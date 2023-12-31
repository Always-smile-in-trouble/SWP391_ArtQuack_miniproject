import { useEffect, useRef, useState } from "react";
import { Link, useParams, useNavigate } from "react-router-dom";
import styled from "styled-components";
import StarRating from "../StarRating";
import { MdInfo } from "react-icons/md";
import { TbWorld } from "react-icons/tb";
//import {FaShoppingCart} from "react-icons/fa";
import { CheckOutlined, EditOutlined } from "@ant-design/icons";
import api from "../../config/axios";
import {
  Rate,
  Table,
  Modal,
  Form,
  message,
  Radio,
  Space,
  Collapse,
  Typography,
  Button,
} from "antd";
import { formatDistanceToNow } from "date-fns";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faStar } from "@fortawesome/free-solid-svg-icons";
import {
  FaBook,
  FaBookOpen,
  FaBookReader,
  FaShoppingCart,
} from "react-icons/fa";
import { PayPalScriptProvider, PayPalButtons } from "@paypal/react-paypal-js";
import swal from "sweetalert";
import "../Test.css";
import { useForm } from "antd/es/form/Form";
import TextArea from "antd/es/input/TextArea";
import { LuFlagTriangleRight } from "react-icons/lu";
import { LockOutlined, PlayCircleOutlined } from "@ant-design/icons";
import ReactPlayer from "react-player";

const SingleCoursePage = () => {
  const { id } = useParams();
  const [course, setCourse] = useState([]);
  const [chapter, setChapter] = useState([]);
  const [accountEnrollment, setAccountEnrollment] = useState(null);
  const price = useRef();
  const [render, setRender] = useState(0);
  const account = JSON.parse(localStorage.getItem("accessToken"));

  const [review, setReview] = useState([]);
  const [enroll, setEnroll] = useState([]);

  const [form] = useForm();
  const [reportForm] = useForm();

  const [form2] = useForm();
  const navigate = useNavigate();
  let count = 0;

  const REGEX = /^[a-zA-Z]+(([a-z A-Z,.!?])?[a-zA-Z]*)*$/;
  const fetchReview = () => {
    api.get(`api/enrollment/course/${id}`).then((res) => {
      setReview(res.data);
    });
  };
  // Assuming you have fetched the enrollments and stored them in a variable called 'enrollments'

  // Step 1: Create an array to store the rates
  const rates = review
    .filter((item) => item.rate >= 1)
    .map((item) => {
      return item.rate;
    });
  count = rates.length;

  // Step 2: Calculate the sum of all rate values
  const sumOfRates = rates.reduce((accumulator, rate) => {
    return accumulator + rate;
  }, 0);

  // Step 3: Calculate the average rate
  // const averageRate = sumOfRates / rates.length;
  const averageRate = sumOfRates / count;
  let num = averageRate;

  useEffect(() => {
    api
      .get(`/api/course/${id}/${account?.learnerID ? account.learnerID : 0}`)
      .then((response) => {
        setCourse(response.data);
        price.current = response.data.price;
      });
  }, [id, render]);

  const fetchChapter = () => {
    api.get(`/api/course/${id}/chapters`).then((response) => {
      setChapter(response.data);
      console.log(response.data);
    });
  };
  const fetchEnroll = () => {
    api.get(`/api/enrollment/course/${id}`).then((response) => {
      setEnroll(response.data);
      console.log(response.data);
      const enrollment = response.data.filter(
        (item) => item?.learnerID === account?.learnerID
      )[0];
      console.log(enrollment?.enrollmentID);
      setAccountEnrollment(enrollment);
      setCurrentID(enrollment?.enrollmentID);
    });
  };

  useEffect(() => {
    fetchChapter();
    fetchReview();
    fetchEnroll();
  }, [render]);
  console.log(enroll);

  const [isModalOpen, setIsModalOpen] = useState(false);
  const [modal, setModal] = useState(false);
  const [viewReview, setViewReview] = useState(false);
  const [currentID, setCurrentID] = useState(null);
  const [chapterTrial, setChapterTrial] = useState([]);

  const [report, setReport] = useState(false);
  const [editReport, setEditReport] = useState(
    {
      enrollmentID: 0,
      typeOfReport: " ",
      report: " ",
    },
    []
  );

  const [modal2, setModal2] = useState(false);
  const [modalReport, setModalReport] = useState(false);

  const showModal = () => {
    setIsModalOpen(true);
  };

  const fetchMenuTrial = () => {
    api.get(`/api/course/${id}/chapters-items`).then((response) => {
      setChapterTrial(response.data);
      console.log(response.data);
    });
  };

  useEffect(() => {
    fetchMenuTrial();
  }, []);

  const handleOk = () => {
    form.submit();
  };

  const handleCancel = () => {
    setIsModalOpen(false);
  };
  const handleReportOk = () => {
    reportForm.submit();
  };

  const handleReportCancel = () => {
    setReport(false);
  };
  const handleSubmit = async (values) => {
    const id = enroll.filter((item) => item.learnerID === account.learnerID)[0]
      .enrollmentID;
    await api.put(`/api/enrollment/${id}/update`, {
      enrollmentID: id,
      rate: values.star,
      comment: values.comment,
      date: new Date().toISOString(),
    });
    console.log(rateEdit);
    message.success("You rated successfully");
    fetchReview();
    setRender(render + 1);
    setIsModalOpen(false);
  };

  const handleView = async () => {
    const id = enroll.filter((item) => item.learnerID === account.learnerID)[0]
      .enrollmentID;
    console.log(id);
    await api.get(`/api/enrollment/${id}`);
    // console.log(rateEdit);
    // message.success("You reated successfully");
    // setRender(render + 1);
    setViewReview(false);
    setModalReport(false);
  };

  useEffect(() => {
    console.log(accountEnrollment);
    if (accountEnrollment) {
      console.log(accountEnrollment);
      form.setFieldsValue({
        stars: accountEnrollment.rate,
        comment: accountEnrollment.comment,
        reportDetails: accountEnrollment.report,
        reportTitle: accountEnrollment.typeOfReport,
      });
    } else {
      form.resetFields();
    }
  }, [accountEnrollment]);

  const [rateEdit, setRateEdit] = useState(
    {
      enrollmentID: 0,
      rate: 0,
      comment: " ",
    },
    []
  );

  const handleReportDetail = (e) => {
    setEditReport({
      ...editReport,
      typeOfReport: e.target.value,
      report: e.target.value,
    });
  };

  const handleEdit = (e) => {
    setRateEdit({
      ...rateEdit,
      comment: e.target.value,
    });
  };

  const [rating, setRating] = useState(0);
  const handleStarClick = (selectedRating) => {
    setRating(selectedRating);
    setRateEdit({ ...rateEdit, rate: selectedRating });
    console.log("Selected rating:", selectedRating);
    form.setFieldValue("star", selectedRating);
  };

  const starStyle = {
    color: "#e6e6e6",
    fontSize: "35px",
    cursor: "pointer",
    transition: "color 0.2s ease",
  };

  const activeStarStyle = {
    color: "#ff9c1a",
    fontSize: "35px", // Keep the font size consistent with starStyle
  };
  // function formatDate(timestamp, format) {
  //   const date = new Date(timestamp);

  //   const options = {
  //     year: "numeric",
  //     month: "2-digit",
  //     day: "2-digit",
  //     hour: "2-digit",
  //     minute: "2-digit",
  //     second: "2-digit",
  //     hour12: false,
  //   };

  //   const formattedDate = date.toLocaleString("vi-VN", options);

  //   const formatMapping = {
  //     "dd/MM/yyyy": formattedDate,
  //     "MM/dd/yyyy": formattedDate,
  //     "yyyy-MM-dd": formattedDate,
  //     "HH:mm:ss": formattedDate.slice(11),
  //     // Add more formats if needed
  //   };
  //   return formatMapping[format] || "Invalid Format";
  // }

  const scriptOptions = {
    clientId:
      "AS_kGKyi8kMb-m3z7SZocpoPihQLS9MGjq7QaYTG3N9b64CRE6mgcFs7HzH16qwPTblmix3ivoSPf0ly",
  };

  const handleReport = (values) => {
    const data = {
      typeOfReport: values.reportTitle,
      report: values.reportDetails,
      enrollmentID: Number(accountEnrollment?.enrollmentID),
    };
    api.put(
      `/api/enrollment/${accountEnrollment?.enrollmentID}/update-of-report`,
      data
    );
    message.success("You report successfully");
    fetchEnroll();
    setRender(render + 1);
    setModal2(false);
    console.log(values.reportTitle);
    console.log(values.reportDetails);
  };

  const handleOk2 = () => {
    form2.submit();
  };

  // const items = [
  //   {
  //     key: "1",
  //     label: "This is panel header 1",
  //     children: <p>hihi</p>,
  //   },
  //   {
  //     key: "2",
  //     label: "This is panel header 2",
  //     children: <p>haha</p>,
  //   },
  // ];

  return (
    <SingleCourseWrapper>
      <div className="course-intro mx-auto grid">
        <div className="course-img">
          <img
            src={
              course.avatar ||
              "https://th.bing.com/th/id/R.34852e2b6e117af5cbb1af009319e292?rik=uXyTqlmPFqtFsQ&pid=ImgRaw&r=0"
            }
            alt={course.name}
          />
        </div>
        <div className="course-details">
          <div className="course-category bg-white text-dark text-capitalize fw-6 fs-12 d-inline-block">
            {course.cateName}
          </div>
          <div className="course-head">
            <h5>{course.name}</h5>
          </div>
          <div className="course-body">
            <p className="course-para fs-18">{course.description}</p>
            <div className="course-rating flex">
              <span
                className="rating-star-val fw-8 fs-16"
                style={{ marginTop: "5px" }}
              >
                {num ? num.toFixed(1) : 0}
                {/* Rating:{" "}  */}
              </span>
              <StarRating rating_star={averageRate} />
              <span className="rating-count">( {count} ratings )</span>
              <span className="students-count fs-14">
                {enroll.length} students
              </span>
            </div>

            <ul className="course-info">
              <li>
                <span className="fs-14">
                  Created by{" "}
                  <span className="fw-6 opacity-08">
                    {course.instructorName}
                  </span>
                </span>
              </li>
              <li className="flex">
                <span>
                  <MdInfo />
                </span>
                <span className="fs-14 course-info-txt fw-5">
                  Last updated{" "}
                  {course.upload_date &&
                    formatDistanceToNow(new Date(course.upload_date), {
                      addSuffix: true,
                    })}
                  {/* Last updated {""} */}
                </span>
              </li>
              <li className="flex">
                <span>
                  <TbWorld />
                </span>
                <span className="fs-14 course-info-txt fw-5">English</span>
              </li>
            </ul>
          </div>

          <div className="course-foot">
            <div className="course-price">
              <span className="new-price fs-26 fw-8">${course.price}</span>
            </div>
          </div>

          <div className="course-btn">
            {!course.enrolled && account?.learnerID ? (
              <PayPalScriptProvider options={scriptOptions}>
                <PayPalButtons
                  createOrder={(data, actions) => {
                    console.log("Creating order:", data);

                    return actions.order.create({
                      purchase_units: [
                        {
                          amount: {
                            value: price.current, // Set the payment amount here
                          },
                        },
                      ],
                    });
                  }}
                  onApprove={async (data, actions) => {
                    // handleEnroll();
                    const response = await api.post(
                      `/api/learner/${account.learnerID}/course/${id}/enrollment`,
                      {
                        enrollmentID: 0,
                        rate: 0,
                        comment: "string",
                        date: new Date().toISOString(),
                        status: true,
                      }
                    );
                    swal(
                      "Success!",
                      "Successfully enroll to course",
                      "success"
                    );
                    setRender(render + 1);
                  }}
                />
              </PayPalScriptProvider>
            ) : // ) : account?.learnerID ? (
            account ? (
              account.learnerID ? (
                <>
                  <Link
                    to={`/learning/${id}`}
                    className="add-to-cart-btn d-inline-block fw-7 bg-orange"
                    style={{
                      backgroundColor: "var(--clr-orange)",
                    }}
                  >
                    <FaBookOpen /> Learn
                  </Link>

                  <Link
                    onClick={() => {
                      if (account.learnerID) {
                        handleStarClick(accountEnrollment.rate);
                        showModal();
                      }
                      // else {
                      //   setModal(true);
                      // }
                    }}
                    className="add-to-cart-btn d-inline-block fw-7 bg-orange"
                    style={{
                      backgroundColor: "var(--clr-orange)",
                      marginLeft: 20,
                    }}
                  >
                    <EditOutlined /> Review
                  </Link>

                  {/* {accountEnrollment?.report !== null &&
                  accountEnrollment?.typeOfReport !== null ? (
                    <Link
                      onClick={() => {
                        setModalReport(true);
                      }}
                      className="add-to-cart-btn d-inline-block fw-7 bg-orange"
                      style={{
                        backgroundColor: "var(--clr-orange)",
                        marginLeft: 20,
                      }}
                    >
                      <LuFlagTriangleRight /> View Report
                    </Link>
                  ) : (
                    <Link
                      onClick={() => {
                        setModal2(true);
                      }}
                      className="add-to-cart-btn d-inline-block fw-7 bg-orange"
                      style={{
                        backgroundColor: "var(--clr-orange)",
                        marginLeft: 20,
                      }}
                    >
                      <LuFlagTriangleRight /> Report
                    </Link>
                  )} */}
                </>
              ) : null
            ) : (
              // ) : null}
              <button
                href={`/login/v2`}
                className="add-to-cart-btn d-inline-block fw-7 bg-orange"
                style={{
                  backgroundColor: "var(--clr-orange)",
                }}
                onClick={() => {
                  setModal(true);
                }}
              >
                <FaBookOpen /> Learn
              </button>
            )}
          </div>
        </div>
      </div>
      <Modal
        title="Report description"
        open={report}
        onOk={handleReportOk}
        onCancel={handleReportCancel}
      >
        <Form form={reportForm} labelCol={{ span: 24 }} onFinish={handleReport}>
          <Form.Item
            label="State your problem"
            name={"typeOfReport"}
            rules={[
              {
                required: true,
                message: "Can not be empty",
              },
            ]}
          >
            <TextArea
              value={editReport.typeOfReport}
              onChange={(e) => handleReportDetail(e)}
            />
          </Form.Item>
          <Form.Item
            label="Tell us in detail"
            name={"report"}
            rules={[
              {
                required: true,
                message: "Can not be empty",
              },
            ]}
          >
            <TextArea
              value={editReport.report}
              onChange={(e) => handleReportDetail(e)}
            />
          </Form.Item>
        </Form>
      </Modal>

      {/* Modal set Review */}
      <Modal
        title="Give me your feel about the course"
        open={isModalOpen}
        onOk={handleOk}
        onCancel={handleCancel}
      >
        <Form form={form} labelCol={{ span: 24 }} onFinish={handleSubmit}>
          {/* <div className="rating-box"> */}
          <Form.Item
            label="How was your experience of this course?"
            name={"star"}
            rules={[
              {
                required: true,
                message: "Let rating",
              },
            ]}
          >
            <div className="stars">
              <FontAwesomeIcon
                icon={faStar}
                style={rating >= 1 ? activeStarStyle : starStyle}
                onClick={() => handleStarClick(1)}
              />
              <FontAwesomeIcon
                icon={faStar}
                style={rating >= 2 ? activeStarStyle : starStyle}
                onClick={() => handleStarClick(2)}
              />
              <FontAwesomeIcon
                icon={faStar}
                style={rating >= 3 ? activeStarStyle : starStyle}
                onClick={() => handleStarClick(3)}
              />
              <FontAwesomeIcon
                icon={faStar}
                style={rating >= 4 ? activeStarStyle : starStyle}
                onClick={() => handleStarClick(4)}
              />
              <FontAwesomeIcon
                icon={faStar}
                style={rating >= 5 ? activeStarStyle : starStyle}
                onClick={() => handleStarClick(5)}
              />
            </div>
          </Form.Item>
          <Form.Item
            label="Write your comment"
            name={"comment"}
            rules={[
              {
                pattern: REGEX,
                whitespace: true,
                message:
                  "Give the feedback for this course to instructor then they can improve it",
              },
            ]}
          >
            <TextArea
              value={rateEdit.comment}
              onChange={(e) => handleEdit(e)}
            />
          </Form.Item>
        </Form>
      </Modal>

      <Modal
        title="Warning"
        open={modal}
        onOk={() => {
          navigate(`/login/v2`);
        }}
        onCancel={() => {
          setModal(false);
        }}
      >
        <p>You must have an account to Pay and Learn</p>
      </Modal>

      <Modal
        title="Report an issue"
        onOk={handleOk2}
        open={modal2}
        onCancel={() => setModal2(false)}
      >
        <Form form={form2} labelCol={{ span: 24 }} onFinish={handleReport}>
          <Form.Item
            label="Select issue you'd like to report"
            name="reportTitle"
            rules={[
              {
                required: true,
                message: "Select issue to know what type issue you want report",
              },
            ]}
          >
            <Radio.Group>
              <Space direction="vertical">
                <Radio value="Content Improvement"> Content improvement</Radio>
                <Radio value="Video Issues"> Video issues</Radio>
                <Radio value="Audio Issues"> Audio issues</Radio>
                <Radio value="Offensive Content"> Offensive content</Radio>
                <Radio value="Spammy Content"> Spammy content</Radio>
                <Radio value="Other"> Other</Radio>
              </Space>
            </Radio.Group>
          </Form.Item>

          <Form.Item
            label="Describe the issue"
            name={"reportDetails"}
            rules={[
              {
                //   pattern: REGEX,
                //   whitespace: true,
                required: true,
                message:
                  "This description do not include space and special characters",
              },
            ]}
          >
            <TextArea rows={3} />
          </Form.Item>
        </Form>
      </Modal>

      {/* Modal view Report */}
      <Modal
        title="View your report about this course"
        onOk={() => setModalReport(false)}
        open={modalReport}
        onCancel={() => setModalReport(false)}
      >
        <Form form={form} labelCol={{ span: 24 }} onFinish={handleReport}>
          <Form.Item
            label="Select issue you'd like to report"
            name="reportTitle"
            rules={[
              {
                required: true,
                message: "Select issue to know what type issue you want report",
              },
            ]}
          >
            <Radio.Group value={accountEnrollment?.typeOfReport} disabled>
              <Space direction="vertical">
                <Radio value="Content Improvement"> Content improvement</Radio>
                <Radio value="Video Issues"> Video issues</Radio>
                <Radio value="Audio Issues"> Audio issues</Radio>
                <Radio value="Offensive Content"> Offensive content</Radio>
                <Radio value="Spammy Content"> Spammy content</Radio>
                <Radio value="Other"> Other</Radio>
              </Space>
            </Radio.Group>
          </Form.Item>

          <Form.Item
            label="Describe the issue"
            name={"reportDetails"}
            rules={[
              {
                pattern: REGEX,
                whitespace: true,
                message:
                  "This description do not include space and special characters",
              },
            ]}
          >
            <TextArea rows={3} disabled />
          </Form.Item>
        </Form>
      </Modal>

      <div className="course-full bg-white text-dark">
        <div className="course-learn mx-auto">
          <div className="course-sc-title">What you will learn</div>
          <ul className="course-learn-list">
            <li>
              <span>
                <CheckOutlined />
              </span>
              <span className="fs-16 fw-5 opacity-09">
                {course.description}
              </span>
            </li>
          </ul>
        </div>

        <div className="course-content mx-auto">
          <div className="course-sc-title">Course content</div>

          <Collapse
            items={chapterTrial.map((chapter) => {
              return {
                key: chapter.chapterID,
                label: <strong>{chapter.chapterName}</strong>,
                children: (
                  <ul className="course-content-list">
                    {chapter.itemsList.map((item) => {
                      return (
                        <CourseItem
                          key={item.itemID}
                          freeTrial={chapter.seevideo}
                          item={item}
                          enrolled={accountEnrollment}
                          account={account?.learnerID}
                        />
                      );
                    })}
                  </ul>
                ),
              };
            })}
            defaultActiveKey={["1"]}
          />
        </div>
        <div className="Table">
          <h3>Reviews</h3>
          <Table
            pagination={false}
            columns={[
              {
                title: "Learner's name",
                dataIndex: "learnerName",
                key: "learnerName",
              },
              {
                title: "Rating",
                dataIndex: "rate",
                key: "rate",
                render: (rate) => <Rate disabled defaultValue={rate} />,
              },
              {
                title: "Comment",
                dataIndex: "comment",
                key: "comment",
              },
              {
                title: "Date",
                dataIndex: "date",
                key: "date",
                render: (date) => {
                  return (
                    date && (
                      <span
                        style={{
                          color: "pink",
                        }}
                      >
                        {formatDistanceToNow(new Date(date), {
                          addSuffix: true,
                        })}
                      </span>
                    )
                  );
                },
              },
            ]}
            dataSource={review.filter((item) => item.rate >= 1)}
            size="small"
            style={{ tableLayout: "fixed" }}
          />
        </div>
      </div>
    </SingleCourseWrapper>
  );
};

const CourseItem = ({ item, freeTrial, enrolled, account }) => {
  const [url, setURL] = useState(null);
  const [title, setTitle] = useState(null);

  const navigate = useNavigate();
  const scriptOptions = {
    clientId:
      "AS_kGKyi8kMb-m3z7SZocpoPihQLS9MGjq7QaYTG3N9b64CRE6mgcFs7HzH16qwPTblmix3ivoSPf0ly",
  };

  const generateContent = (content) => {
    if (!content) return;
    if (content.startsWith("https")) {
      if (content.includes("youtu")) {
        return (
          <ReactPlayer
            url={content}
            width={"100%"}
            height={535}
            style={{
              height: 1000,
            }}
          />
        );
      } else {
        return (
          <video width={"100%"} autoPlay muted src={content.content} controls />
        );
      }
    } else {
      return <Typography.Text>{content}</Typography.Text>;
    }
  };

  const onCancle = () => {
    setURL(null);
    setTitle(null);
  };

  return (
    <li key={item.itemID}>
      <span>{item.itemName}</span>
      {freeTrial || enrolled ? (
        <PlayCircleOutlined
          style={{
            fontSize: 18,
            cursor: "pointer",
          }}
          onClick={() => {
            setURL(item.content);
            setTitle(item.itemName);
          }}
        />
      ) : (
        <LockOutlined
          style={{
            fontSize: 18,
          }}
          onClick={() => {
            setURL(item.content);
            setTitle(item.itemName);
          }}
        />
      )}

      <Modal
        onCancel={onCancle}
        title={title}
        centered
        open={url}
        footer={() => {
          return (
            <>
              {freeTrial || enrolled ? null : (
                <>
                  <Button onClick={() => onCancle()}>Cancel</Button>

                  {account ? (
                    <Button
                      onClick={() => {
                        setTitle(null);
                        setURL(null);
                        window.scrollTo(0, 0);
                      }}
                    >
                      Payment
                    </Button>
                  ) : (
                    <Button
                      onClick={() => {
                        navigate(`/login/v2`);
                      }}
                    >
                      Login
                    </Button>
                  )}
                </>
              )}
            </>
          );
        }}
        width={1000}
      >
        {freeTrial || enrolled
          ? generateContent(url)
          : "Enroll to continue study"}
      </Modal>
    </li>
  );
};

const SingleCourseWrapper = styled.div`
  background: var(--clr-dark);
  color: var(--clr-white);

  .course-intro {
    padding: 40px 16px;
    max-width: 992px;

    .course-details {
      padding-top: 20px;
    }

    .course-category {
      padding: 0px 8px;
      border-radius: 6px;
    }

    .course-head {
      font-size: 50px;
      line-height: 1.2;
      padding: 12px 0 0 0;
    }
    .course-para {
      padding: 12px 0;
    }
    .rating-star-val {
      margin-right: 7px;
      padding-bottom: 5px;
      color: var(--clr-orange);
    }
    .students-count {
      margin-left: 8px;
    }
    .rating-count {
      margin-left: 6px;
      color: #d097f6;
    }
    .course-info {
      li {
        &:nth-child(2) {
          margin-top: 10px;
        }
      }
      .course-info-txt {
        text-transform: capitalize;
        margin-left: 8px;
        margin-bottom: 4px;
      }
    }
    .course-price {
      .old-price {
        color: #eceb98;
        text-decoration: line-through;
        margin-left: 10px;
      }
    }
    .course-btn {
      margin-top: 16px;
      .add-to-cart-btn {
        padding: 12px 28px;
        span {
          margin-left: 12px;
        }
      }
    }

    @media screen and (min-width: 880px) {
      grid-template-columns: repeat(2, 1fr);
      column-gap: 40px;
      .course-details {
        padding-top: 0;
      }
      .course-img {
        order: 2;
        font-size: 20px;
      }
    }

    @media screen and (min-width: 1400px) {
      grid-template-columns: 60% 40%;
    }
  }

  .course-full {
    padding: 40px 16px;
    .course-sc-title {
      font-size: 22px;
      font-weight: 700;
      margin: 12px 0;
    }
    .course-learn {
      max-width: 992px;
      border: 1px solid rgba(0, 0, 0, 0.2);
      padding: 12px 28px 22px 28px;

      .course-learn-list {
        li {
          margin: 5px 0;
          display: flex;
          span {
            &:nth-child(1) {
              opacity: 0.95;
              display: flex;
              margin-right: 12px;
            }
          }
        }

        @media screen and (min-width: 992px) {
          grid-template-columns: repeat(2, 1fr);
        }
      }
    }

    .course-content {
      max-width: 992px;
      margin-top: 30px;
      border: 1px solid rgba(0, 0, 0, 0.2);
      padding: 12px 28px 22px 28px;

      .course-content-list {
        li {
          font-weight: 500;
          font-size: 14px;
          display: flex;
          justify-content: space-between;
          padding: 10px 30px;
        }
      }
    }
  }
`;

export default SingleCoursePage;
