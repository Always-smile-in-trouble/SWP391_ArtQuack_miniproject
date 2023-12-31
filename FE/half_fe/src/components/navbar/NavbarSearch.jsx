import React, { useEffect, useState } from "react";
import styled from "styled-components";
import { Link, useNavigate } from "react-router-dom";
import { AutoComplete, Input } from "antd";
import api from "../../config/axios";
import UserDropdown from "../UserPage/UserDropdown";
import Search from "antd/es/input/Search";
import { Dropdown, Space } from "antd";

const NavbarSearch = () => {
  const [course, setCourse] = useState([]);
  const [options, setOptions] = useState([]);
  const [searchValue, setSearchValue] = useState("");

  const account = JSON.parse(localStorage.getItem("accessToken"));
  const navigate = useNavigate();

  const [cate, setCate] = useState([]);

  useEffect(() => {
    api.get("/api/categories").then((response) => {
      setCate(response.data);
      console.log(response.data);
    });
  }, []);

  const cates = cate.map((c) => {
    return {
      key: c.cateID,
      // label: c.cateName,
      label: <a href={`/courses/category/${c.cateID}`}>{c.cateName}</a>,
    };
  });

  const handleSearch = (value) => {
    if (value) {
      fetchCourseByKey(value);
      
    } else {
      setOptions([]);
    }
    setSearchValue(value);
    console.log(value);
  };

  const fetchCourseByKey = (key) => {
    api.get(`/api/courses/${key}`).then((response) => {
      setCourse(response.data);
      const searchOptions = response.data.map((course) => ({
        value: course.name,
        key: course.courseID,
      }));
  
      const exactMatchIndex = searchOptions.findIndex(
        (option) => option.value.toLowerCase() === key.toLowerCase()
      );
  
      if (exactMatchIndex === -1) {
        searchOptions.unshift({ value: key, key: "search-value" });
      }
  
      setOptions(searchOptions);
    });
  };
  const onSelect = (value) => {
    console.log(value);
    const selectedCourse = course.find((c) => c.name === value);
    if (selectedCourse) {
      navigate(`/courses/${selectedCourse.courseID}`);
    }else{
      navigate(`/search/${value}`)
    }
  };

  const loadValue = () => {
    setSearchValue("");
  };

  return (
    <>
      <NavbarWrapper className="bg-white flex" direction="horizontal" gap={6}>
        <div className="container">
          <div className="brand-and-toggler flex flex-between w-100">
            <div className="p-2 row">
              <ul>
                <Link
                  to={`${
                    !account
                      ? "/"
                      : account?.learnerID
                      ? `/user`
                      : `/instructor`
                  }`}
                  className="navbar-brand text-uppercase ls-1 fw-8"
                  onClick={loadValue}
                >
                  <span className="topic">A</span>rtquack
                </Link>

                <li>
                  <Dropdown menu={{ items: cates }}>
                    <a className="nav-cate">Categories</a>
                  </Dropdown>
                </li>

                <AutoComplete
                  // popupMatchSelectWidth={252}
                  style={{
                    height: "30px",
                  }}
                  options={options}
                  onSelect={onSelect}
                  onSearch={handleSearch}
                  size="large"
                >
                  <Search
                    placeholder="Search course in ArtQuack"
                    allowClear
                    size="large"
                    enterButton
                    value={searchValue}
                    onSearch={handleSearch}
                    style={{
                      width: 500,
                      paddingLeft: 50,
                    }}
                  />
                  {/* <Input.Search size="large" placeholder="Search course in ArtQuack" allowClear enterButton /> */}
                </AutoComplete>

                {localStorage.getItem("accessToken") &&
                JSON.parse(localStorage.getItem("accessToken")).role ? (
                  <>
                    <li className="col-md-4 offset-md-2">
                      <UserDropdown />
                    </li>
                  </>
                ) : (
                  <>
                    <li>
                      <Link to="/login/v2">Login</Link>
                    </li>
                    <li>
                      <Link to="/register">Sign up</Link>
                    </li>
                  </>
                )}
              </ul>
            </div>
          </div>
        </div>
      </NavbarWrapper>
    </>
  );
};

const NavbarWrapper = styled.nav`
  width: 100%;
  height: 80px;
  box-shadow: rgba(50, 50, 93, 0.15) 0px 16px 12px -2px,
    rgba(0, 0, 0, 0.2) 0px 3px 7px -3px;

  .navbar-brand {
    font-size: 30px;
    padding-top: 10px;
    span {
      color: var(--clr-orange);
      padding-bottom: 10px;
    }
  }
  .cart-btn {
    margin-right: 18px;
    font-size: 23px;
    position: relative;
    .item-count-badge {
      background-color: var(--clr-orange);
      position: absolute;
      right: -10px;
      top: -10px;
      font-size: 12px;
      font-weight: 700;
      display: block;
      width: 23px;
      height: 23px;
      color: var(--clr-white);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }

  .sidebar-open-btn {
    transition: all 300ms ease-in-out;
    &:hover {
      opacity: 0.7;
    }
  }
  .SearchBar {
    width: 20%;
    height: 100px;
  }
`;

export default NavbarSearch;
