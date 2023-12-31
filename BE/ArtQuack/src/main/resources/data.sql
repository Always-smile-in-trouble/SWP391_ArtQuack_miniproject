﻿INSERT INTO Category (cateName, status)
VALUES
    ( 'Portrait Drawing', 1),
    ('Landscape Drawing', 1),
    ( 'Still Life Drawing', 1),
    ( 'Figure Drawing', 1),
    ( 'Cartoon Drawing', 1),
    ( 'Anime Drawing', 1),
    ( 'Abstract Drawing', 1),
    ( 'Realistic Drawing', 1),
    ( 'Watercolor Painting', 1),
    ( 'Oil Painting', 1);

INSERT INTO Instructor (rate, status, email, name, password, role, summarize)
VALUES
    (5, 1, 'anhduy@example.com', 'Anh Duy', 'anhduy', 'Instructor', 'Experienced instructor specializing in drawing and painting techniques.'),
    (5, 1, 'ngockhoi@example.com', 'Ngoc Khoi', 'ngockhoi', 'Instructor', 'Professional artist offering lessons in various art mediums.'),
    (3, 1, 'thuylinh@example.com', 'Thuy Linh', 'thuylinh', 'Instructor', 'Passionate about teaching art to beginners.'),
    (2, 1, 'giabao@example.com', 'Gia Bao', 'giabao', 'Instructor', 'Skilled instructor with a focus on realistic portrait drawing.'),
    (5, 1, 'sarah@example.com', 'Sarah Wilson', 'sarah', 'Instructor', 'Specializes in abstract painting techniques.'),
    (4, 1, 'brown@example.com', 'Michael Brown', 'brown', 'Instructor', 'Experienced in teaching landscape painting.'),
    (3, 1, 'davis@example.com', 'Emily Davis', 'davis', 'Instructor', 'Offers step-by-step lessons for still life drawing.'),
    (5, 1, 'daniel@example.com', 'Daniel Taylor', 'daniel', 'Instructor', 'Expert in watercolor painting techniques.'),
    (2, 1, 'olivia@example.com', 'Olivia Martinez', 'olivia', 'Instructor', 'Passionate about teaching figure drawing.'),
    (5, 1, 'james@example.com', 'James Wilson', 'james', 'Instructor', 'Specializes in teaching cartoon and anime drawing techniques.');

INSERT INTO Learner (status, email, name, password, role)
VALUES
    (1, 'johndoe@example.com', 'John Doe', 'johndoe', 'learner'),
    (1, 'janesmith@example.com', 'Jane Smith', 'janesmith', 'learner'),
    (1, 'johnson@example.com', 'Alice Johnson', 'johnson', 'learner'),
    (1, 'anderson@example.com', 'Bob Anderson', 'anderson', 'learner'),
    (1, 'winston@example.com', 'Sarah Winston', 'wilson', 'learner'),
    (1, 'michael@example.com', 'Michael Brown', 'michael', 'learner'),
    (1, 'emily@example.com', 'Emily Davis', 'emily', 'learner'),
    (1, 'taylor@example.com', 'Daniel Taylor', 'taylor', 'learner'),
    (1, 'martinez@example.com', 'Olivia Martinez', 'martinez', 'learner'),
    (1, 'wilson@example.com', 'James Wilson', 'wilson', 'learner');

INSERT INTO Level (levelName)
VALUES
    ( 'Beginner'),
    ( 'Intermediate'),
    ( 'Advanced'),
    ( 'Expert');

INSERT INTO Course (cateID, instructorID, levelID, price, rate, status, viewer, upload_date, Avatar, description, name)
VALUES
    (1, 1, 1, 49.99, 4, 1, 100, '2023-10-30', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk09DUEQ-vqQVOOcamYtdeglzf_KD-bPQ5uw&usqp=CAU', 'This is going to be the first of a few tutorials. In this one, we will do an overview on how to draw a head.', 'Drawing the head'),
    (2, 2, 2, 29.99, 5, 1, 200, '2023-10-31', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRQiiQW2u-qiqbO0_ekXsZeVzSkHCmn4sBqg&usqp=CAU', 'How to Draw Scenery for Kids includes 33 Scenery in easy step by step drawings. These drawing tutorials are very easy and simple for kids and adults.', 'Draw scenery for beginners'),
    (1, 3, 3, 19.99, 3, 1, 150, '2023-10-31', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk09DUEQ-vqQVOOcamYtdeglzf_KD-bPQ5uw&usqp=CAU', 'Provide, supplement and improve drawing knowledge from basic to advanced', 'Learn basic drawing for beginners'),
    (3, 4, 1, 39.99, 2, 1, 120, '2023-11-01', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwbzosnFuH6aVU5qVF4SyK5BmI7_buqnAl8w&usqp=CAU', 'You can look for inspiration and ideas in paintings, beautiful photos, or explore nature to find unique and creative images.', 'Draw objects that are shaped like cubes'),
    (2, 5, 2, 59.99, 5, 1, 180, '2023-11-02', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRQiiQW2u-qiqbO0_ekXsZeVzSkHCmn4sBqg&usqp=CAU', 'The characteristic of portrait painting is that it focuses on the prominent features on the characters face, helping to clearly describe each persons shape, appearance, and expressions.', 'Learn portrait drawing from basic to advanced'),
    (4, 6, 3, 69.99, 4, 1, 90, '2023-11-02', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPGiXF3Icov01LZWdOBlEQf4ImoG9njbwoiw&usqp=CAU', 'Drawing a character standing or sitting still is one thing, drawing a character in motion is another thing.', 'Instructions for drawing human movements'),
    (3, 7, 1, 24.99, 3, 1, 140, '2023-11-03', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwbzosnFuH6aVU5qVF4SyK5BmI7_buqnAl8w&usqp=CAU', 'Everything from drawing fundamentals to professional painting techniques', 'The Ultimate Digital Painting Course - Beginner to Advanced'),
    (6, 8, 2, 34.99, 5, 1, 160, '2023-11-04', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk09DUEQ-vqQVOOcamYtdeglzf_KD-bPQ5uw&usqp=CAU', 'Learn the secrets to drawing cute cartoons quickly and easily', 'How to Draw Cute Cartoon Characters'),
    (7, 9, 3, 44.99, 2, 1, 110, '2023-11-04', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPGiXF3Icov01LZWdOBlEQf4ImoG9njbwoiw&usqp=CAU', 'Learn Anatomy, Design, Illustrations, and more!', 'Anime Academy: Characters and Illustrations'),
    (2, 10, 1, 54.99, 4, 1, 170, '2023-11-05', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRQiiQW2u-qiqbO0_ekXsZeVzSkHCmn4sBqg&usqp=CAU', 'Drawing is not a talent. Its a skill anyone can learn.', 'The Art & Science of Drawing / BASIC SKILLS'),
    (3, 1, 2, 14.99, 3, 1, 130, '2023-11-06', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwbzosnFuH6aVU5qVF4SyK5BmI7_buqnAl8w&usqp=CAU', 'A comprehensive video and ebook course designed for people wanting to learn the core concepts of drawing.', 'The Secrets to Drawing'),
    (1, 2, 3, 64.99, 5, 1, 190, '2023-11-06', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk09DUEQ-vqQVOOcamYtdeglzf_KD-bPQ5uw&usqp=CAU', 'Dramatically increase the accuracy of your drawings.', 'The Art & Science of Drawing / MEASURING & PROPORTION'),
    (4, 3, 1, 19.99, 4, 1, 100, '2023-11-07', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPGiXF3Icov01LZWdOBlEQf4ImoG9njbwoiw&usqp=CAU', 'The Perfect Class to Learn Drawing, Painting, Watercolor, Pastel and Mixed Media Art Skills for Kids & Beginners.', 'Art for Beginners & Kids: 8 Drawing & Mixed-Media Projects'),
    (10, 4, 2, 29.99, 3, 1, 200, '2023-11-08', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRQiiQW2u-qiqbO0_ekXsZeVzSkHCmn4sBqg&usqp=CAU', 'Learn how to draw animals with pastels.', 'Animals with Pastels'),
    (3, 5, 3, 49.99, 5, 1, 150, '2023-11-08', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwbzosnFuH6aVU5qVF4SyK5BmI7_buqnAl8w&usqp=CAU', 'Learn to draw and paint; from your imagination, guaranteed.', 'Discover How to Draw and paint Comics');


INSERT INTO Chapter (chapterName, courseID, status)
VALUES
    ('Chapter 1 : How to draw a head from Front view', 1, 1),
    ('Chapter 2 : How to Draw a Head in half profile?',1,1),
    ('Chapter 3 : How to draw a head in Profile?',1,1),
    ('Chapter 4 : Final Phase in Drawing a Head',1,1),

    ('Chapter 1 : Draw the frame', 2, 1),
    ('Chapter 2 : Depict the trunk of the tree',2,1),
    ('Chapter 3 : Depict the crown of the tree',2,1),
    ('Chapter 4 : Final Color the drawing',2,1),

    ('Chapter 1 : Break the Straight Line',3,1),
    ('Chapter 2 : How to Create Your Own Style of Art',3,1),
    ('Chapter 3 : How to Measure and Draw Proportions',3,1),
    ('Chapter 4 : Free Your Hand',3,1),
    ('Chapter 5 : Learn What Things Are... And Why They Are',3,1),
    ('Chapter 6 : Now You are Ready to Draw!',3,1),

    ('Chapter 1 : Draw a square',4,1),
    ('Chapter 2 : Draw straight lines between the corners',4,1),
    ('Chapter 3 : Shade in one side with dark shading',4,1),
    ('Chapter 4 : Shade in the top with light shading',4,1),
    ('Chapter 5 : Add a shadow below the cube and on the same side with the dark shading',4,1),
    ('Chapter 6 : Final draw cube object',4,1),

    ('Chapter 1 : Basics of drawing',5,1),
    ('Chapter 2 : Drawing facial features just like your model ( sketching )',5,1),
    ('Chapter 3 : How to draw & shade facial features hyper-realistic ( nose )',5,1),
    ('Chapter 4 : How to draw & shade facial features hyper-realistic ( lips )',5,1),
    ('Chapter 5 : How to draw & shade facial features ( ear )',5,1),
    ('Chapter 6 : Final project of potrait drawing',5,1),

    ('Chapter 1 : Skeleton - The Important Foundations you must know',6,1),
    ('Chapter 2 : Muscles and where they attach - Needed to draw any pose from imagination',6,1),
    ('Chapter 3 : Structure of Man',6,1),
    ('Chapter 4 : How to Draw Hands, and Anatomy of hands',6,1),
    ('Chapter 5 : How muscles move and look when flexed, etc',6,1),
    ('Chapter 6 : Putting it all Together -- Drawing Poses',6,1),
    ('Chapter 7 : This is the end',6,1),

    ('Chapter 1 : Getting Started With The Course',7,1),
    ('Chapter 2 : Learning to Use a Digital Brush',7,1),
    ('Chapter 3 : Learn The Fundamentals of Drawing',7,1),
    ('Chapter 4 : Light and Color',7,1),
    ('Chapter 5 : Layers & Composition',7,1),
    ('Chapter 6 : Advanced Painting Tools',7,1),
    ('Chapter 7 : Learning the Grayscale to Color Painting Method',7,1),
    ('Chapter 8 : Learning the Photorealistic Painting Style',7,1),
    ('Chapter 9 : Painting From Your Imagination',7,1),
    ('Chapter 10 : Conclusion',7,1),

    ('Chapter 1 : Getting Started',8,1),
    ('Chapter 2 : Going Digital!',8,1),
    ('Chapter 3 : Basics of drawing the Face/Head',8,1),
    ('Chapter 4 : Basics of Building the Body',8,1),
    ('Chapter 5 : Growing Your Character',8,1),
    ('Chapter 6 : Drawing Animal Characters',8,1),
    ('Chapter 7 : Conclusion',8,1),

    ('Chapter 1 : Basic Fundamentals: Shapes',9,1),
    ('Chapter 2 : How to Draw Anime Bodies (Male and Female)',9,1),
    ('Chapter 3 : How to draw Faces',9,1),
    ('Chapter 4 : How to Draw Hair for Girls',9,1),
    ('Chapter 5 : How to Draw Hands and Feet',9,1),
    ('Chapter 6 : How to Pose your Character',9,1),
    ('Chapter 7 : How to Color using Cell Shading',9,1),
    ('Chapter 8 : Congrats!',9,1),

    ('Chapter 1 : Basic Skills',10,1),
    ('Chapter 2 : Bonus Lectures and Demonstration Drawings',10,1),
    ('Chapter 3 : Conclusion!',10,1),

    ('Chapter 1 : Introduction',11,1),
    ('Chapter 2 : Linear Perspective',11,1),
    ('Chapter 3 : Drawing Techniques',11,1),
    ('Chapter 4 : Portraiture',11,1),
    ('Chapter 5 : Figure Drawing',11,1),
    ('Chapter 6 : Conclusion',11,1),

    ('Measuring & Proportion',12,1),

    ('Chapter 1 : Introduction to Art for Beginners',13,1),
    ('Chapter 2 : Lets Create Entertaining Elephants',13,1),
    ('Chapter 3 : Lets Create Precious Pears',13,1),
    ('Chapter 4 : Lets Create Happy Hummingbirds',13,1),
    ('Chapter 5 : Final project of course',13,1),

    ('Chapter 1 : Cat with Pastels',14,1),
    ('Chapter 2 : Dog with Pastels',14,1),
    ('Chapter 3 : Parrot with Pastels',14,1),
    ('Chapter 4 : Cow with Oil Pastels',14,1),
    ('Chapter 5 : Final!',14,1),

    ('Chapter 1 : How to Draw to look 3D- Form Lighting and Perspective',15,1),
    ('Chapter 2 : Discover the Seven Secrets of Figure Drawing',15,1),
    ('Chapter 3 : Master the Human Head/Faces',15,1),
    ('Chapter 4 : Painting From B&W to Color',15,1),
    ('Chapter 5 : Painting a Full Scene',15,1),
    ('Chapter 6 : Master Photoshop CS5',15,1),
    ('Chapter 7 : Master Photo Editing',15,1),
    ('Chapter 8 : Congrat!!',15,1);

INSERT INTO Item ( itemName, chapterID, content, status)
VALUES

    ('Understanding Head Proportions',1,'',1),
    ('Drawing the Basic Oval Shape for the Head',1,'',1),
    ('Placing the Facial Guidelines',1,'',1),
    ('Understanding Head Proportions in Half-Profile View',2,'',1),
    ('Dividing the Head into Sections for Placement',2,'',1),
    ('Shaping the Jawline and Chin in Half-Profile',2,'',1),
    ('Add the facial guidelines',3,'',1),
    ('Position the eye, nose, and mouth',3,'',1),
    ('Erase unnecessary guidelines and add shading',3,'',1),
    ('Peer-Graded',4,'',1),

    ('Understanding the Purpose of the Frame',5,'',1),
    ('Choosing the Right Materials for the Frame',5,'',1),
    ('Measuring and Planning the Frame Dimensions',5,'',1),
    ('Sketching the Outline of the Frame',6,'',1),
    ('Adding Depth and Thickness to the Frame',6,'',1),
    ('Incorporating Decorative Elements in the Frame Design',6,'',1),
    ('Sketching the Basic Outline of the Tree Crown',7,'',1),
    ('Adding Branches and Branching Patterns to the Crown',7,'',1),
    ('Critiquing and Refining the Tree Crown Depiction',7,'',1),
    ('Peer-Graded',8,'',1),

    ('Understanding the Purpose and Impact of Breaking Straight Lines in Art',9,'',1),
    ('Exploring Various Techniques for Breaking Straight Lines',9,'',1),
    ('Understanding the Importance of Developing Your Artistic Style',10,'',1),
    ('Exploring and Analyzing Different Artistic Styles and Movements',10,'',1),
    ('Understanding the Importance of Proportions in Art',11,'',1),
    ('Exploring Different Measurement Techniques in Art',11,'',1),
    ('Employing Grids and Guidelines for Accurate Proportional Drawing',11,'',1),
    ('Understanding the Benefits of Freehand Drawing',12,'',1),
    ('Embracing the Imperfections and Uniqueness of Freehand Art',12,'',1),
    ('Celebrating the Joy and Personal Expression in Freehand Drawing',12,'',1),
    ('Observing and Identifying Objects in the World',13,'',1),
    ('Studying the Color and Light Interaction on Objects',13,'',1),
    ('Reflecting on the Role of Objects in Artistic Expression',13,'',1),
    ('Peer-Graded',14,'',1),

    ('Understanding the Properties and Characteristics of a Square',15,'',1),
    ('Choosing the Right Tools for Drawing a Square',15,'',1),
    ('Experimenting with Variations and Creative Applications of Squares',15,'',1),
    ('Understanding the Purpose and Impact of Connecting Corners with Straight Lines',16,'',1),
    ('Drawing the First Straight Line between Two Corners',16,'',1),
    ('Exploring Creative Variations and Artistic Applications of Connecting Corners with Straight Lines',16,'',1),
    ('Understanding the Importance and Effect of Dark Shading',17,'',1),
    ('Applying a Base Layer of Medium Tone to the Shaded Side',17,'',1),
    ('Experimenting with Different Shading Techniques and Styles',17,'',1),
    ('Understanding the Purpose and Effect of Light Shading',18,'',1),
    ('Blending and Feathering the Shading for Smooth Transitions',18,'',1),
    ('Refining the Light Shading to Achieve the Desired Effect',18,'',1),
    ('Understanding the Importance of Shadows in Creating Depth and Realism',19,'',1),
    ('Applying Dark Shading to the Shaded Side of the Cube',19,'',1),
    ('Creating a Connection Between the Cube and Its Shadow',19,'',1),
    ('Peer-Graded',20,'',1),

    ('Understanding the Fundamentals of Drawing',21,'',1),
    ('Practicing Hand-Eye Coordination and Control',21,'',1),
    ('Experimenting with Texture and Detail',21,'',1),
    ('Understanding the Structure and Proportions of the Face',22,'',1),
    ('Sketching the Outline and Contours of the Models Face',22,'',1),
    ('Sketching the Ears and Hair with Attention to Texture and Volume',22,'',1),
    ('Understanding the Anatomy and Structure of the Nose',23,'',1),
    ('Observing and Capturing the Proportions and Placement of the Nostrils',23,'',1),
    ('Shading and Rendering the Gradual Transition of Light and Shadow on the Nose',23,'',1),
    ('Understanding the Anatomy and Structure of the Lips',24,'',1),
    ('Observing and Capturing the Proportions and Shape of the Upper and Lower Lips',24,'',1),
    ('Refining and Blending the Shading to Achieve Hyper-Realistic Texture and Depth',24,'',1),
    ('Understanding the Anatomy and Structure of the Ear',25,'',1),
    ('Observing and Capturing the Proportions and Placement of the Ears Components',25,'',1),
    ('Refining and Blending the Shading to Achieve Realistic Texture and Three-Dimensionality',25,'',1),
    ('Peer-Graded',26,'',1),

    ('Introduction to the Skeleton and Its Role in Artistic Anatomy',27,'',1),
    ('Understanding the Basic Structure and Function of Bones',27,'',1),
    ('Practicing Drawing and Sketching the Skeleton',27,'',1),
    ('Introduction to Muscles and Their Importance in Figure Drawing',28,'',1),
    ('Understanding the Different Types of Muscles in the Human Body',28,'',1),
    ('Practicing Drawing Muscles and Their Attachments',28,'',1),
    ('Understanding the Relationship Between Skeleton, Muscles, and Body Fat',29,'',1),
    ('Learning to Observe and Capture Structural Details in Drawings',29,'',1),
    ('Practicing Drawing the Human Body with Attention to Structure',29,'',1),
    ('Understanding the Anatomy and Structure of the Hand',30,'',1),
    ('Learning Techniques for Capturing the Detail and Gesture of Hands',30,'',1),
    ('Practicing Drawing Hands and Exploring Various Hand Poses',30,'',1),
    ('Understanding the Concepts of Muscle Flexion, Extension, and Contraction',31,'',1),
    ('Learning to Draw Muscles in Various States of Action and Rest',31,'',1),
    ('Practicing Drawing Dynamic Poses and Capturing Muscle Movement',31,'',1),
    ('Understanding the Importance of Gesture and Flow in Figure Drawing',32,'',1),
    ('Refining Skills in Capturing Expressions and Gestures in Poses',32,'',1),
    ('Peer-Graded',33,'',1),

    ('Introduction to the Course and Its Objectives',34,'',1),
    ('Setting Realistic Goals and Expectations for Your Learning Journey',34,'',1),
    ('Exploring the Course Curriculum and Outline',34,'',1),
    ('Introduction to Digital Brushes and Their Functionality',35,'',1),
    ('Understanding Brush Dynamics and Customization',35,'',1),
    ('Practicing Using Digital Brushes to Create Various Effects',35,'',1),
    ('Understanding the Importance of Fundamentals in Drawing',36,'',1),
    ('Practicing Hand-Eye Coordination and Control',36,'',1),
    ('Developing a Sense of Composition and Layout',36,'',1),
    ('Understanding the Role of Light in Drawing and Painting',37,'',1),
    ('Practicing Rendering Light and Shadow in Your Drawings',37,'',1),
    ('Learning to Use Layers for Organization and Non-Destructive Editing',38,'',1),
    ('Practicing Compositional Techniques to Create Balance and Interest',38,'',1),
    ('Learning to Use Selection Tools and Masking for Precision',39,'',1),
    ('Practicing Advanced Painting Techniques to Elevate Your Artwork',39,'',1),
    ('Learning to Create a Strong Grayscale Underpainting',40,'',1),
    ('Practicing the Grayscale to Color Method to Develop Your Style',40,'',1),
    ('Studying Reference Images and Observing Photorealistic Artworks',41,'',1),
    ('Experimenting with Photorealistic Style and Pushing Your Limits',41,'',1),
    ('Learning to Sketch and Plan Your Imaginative Artwork',42,'',1),
    ('Embracing the Joy and Freedom of Creating Art from Your Mind',42,'',1),
    ('Peer-Graded',43,'',1),

    ('Introduction to Character Drawing and Its Importance',44,'',1),
    ('Building Confidence and Overcoming Creative Blocks',44,'',1),
    ('Introduction to Digital Drawing Tools and Software',45,'',1),
    ('Learning Shortcuts and Efficient Workflow Tips',45,'',1),
    ('Exploring Different Facial Expressions and Emotions',46,'',1),
    ('Studying Different Head Angles and Perspectives',46,'',1),
    ('Learning the Basic Structure of the Human Body',47,'',1),
    ('Adding Clothing and Accessories to Your Character',47,'',1),
    ('Developing a Backstory and Personality for Your Character',48,'',1),
    ('Experimenting with Different Hairstyles and Features',48,'',1),
    ('Practicing Drawing Animal Faces and Expressions',49,'',1),
    ('Pushing Your Creativity with Imaginative Animal Designs',49,'',1),
    ('Peer-Graded',50,'',1),

    ('Introduction to the Importance of Shapes in Drawing',51,'',1),
    ('Practicing Drawing Various Shapes and Forms',51,'',1),
    ('Understanding the Differences Between Male and Female Bodies',52,'',1),
    ('Practicing Drawing Different Body Types and Poses',52,'',1),
    ('Understanding the Different Facial Structures (Male and Female)',53,'',1),
    ('Practicing Drawing Different Facial Expressions',53,'',1),
    ('Understanding the Flow and Movement of Hair',54,'',1),
    ('Practicing Drawing Different Hairstyles for Female Characters',54,'',1),
    ('Understanding the Basic Structure and Proportions of Hands and Feet',55,'',1),
    ('Practicing Drawing Different Hand and Foot Poses',55,'',1),
    ('Understanding the Role of Gestures and Body Language in Posing',56,'',1),
    ('Practicing Dynamic and Action Poses for Your Characters',56,'',1),
    ('Learning to Create Clean and Crisp Line Art for Cell Shading',57,'',1),
    ('Refining Your Cell Shading Techniques through Experimentation',57,'',1),
    ('Peer-Graded',58,'',1),

    ('Introduction to the Importance of Basic Skills in Drawing',59,'',1),
    ('Practicing Different Types of Lines and Strokes',59,'',1),
    ('Developing Hand-Eye Coordination and Precision',59,'',1),
    ('Practicing Observation and Drawing from Life',59,'',1),
    ('Exercises and Challenges to Improve Your Basic Drawing Skills',59,'',1),
    ('Demonstrations of Drawing Techniques and Methods',60,'',1),
    ('Tips and Tricks for Overcoming Common Drawing Challenges',60,'',1),
    ('Q&A Sessions and Addressing Common Student Questions',60,'',1),
    ('Peer-Graded',61,'',1),

    ('Overview of the Course and Learning Objectives',62,'',1),
    ('Understanding the Role of Observation and Practice in Drawing',62,'',1),
    ('Tips for Creating a Productive and Inspiring Drawing Workspace',62,'',1),
    ('Learning to Create Depth and Illusion of Space in Drawings',63,'',1),
    ('Exercises and Practice Prompts to Improve Perspective Drawing Skills',63,'',1),
    ('Learning to Create Texture and Surface Details in Drawings',64,'',1),
    ('Exercises and Challenges to Enhance Drawing Technique Skills',64,'',1),
    ('Understanding the Proportions and Structure of the Human Face',65,'',1),
    ('Exercises and Practice Sessions for Portraiture Skills Development',65,'',1),
    ('Learning to Capture Gesture and Movement in Figure Drawings',66,'',1),
    ('Exercises and Practice Prompts for Figure Drawing Skills Enhancement',66,'',1),
    ('Peer-Graded',67,'',1),

    ('Introduction to Measuring and Proportion in Drawing',68,'',1),
    ('Learning to Use Tools for Measuring in Drawing',68,'',1),
    ('Understanding the Golden Ratio and its Application in Art',68,'',1),
    ('Practicing Measuring and Proportion Exercises',68,'',1),
    ('Recap and Review of Measuring and Proportion Concepts',68,'',1),
    ('Peer-Graded',68,'',1),

    ('Welcome to the Course: Introduction to Art for Beginners',69,'',1),
    ('Understanding the Basics of Art and its Importance',69,'',1),
    ('Understanding the Principles of Art: Balance, Contrast, Unity, Emphasis, Movement, and Proportion',69,'',1),
    ('Gathering Reference Images and Sketching Initial Ideas',70,'',1),
    ('Exploring Different Drawing Techniques for Textures and Shadows',70,'',1),
    ('Observing and Sketching Different Pear Varieties',71,'',1),
    ('Adding Details and Textures to Your Pear Drawing',71,'',1),
    ('Studying Hummingbird Anatomy and Movement',72,'',1),
    ('Sketching Different Poses and Gestures of Hummingbirds',72,'',1),
    ('Finalizing and Polishing Your Hummingbird Drawing',72,'',1),
    ('Peer-Graded',73,'',1),

    ('Introduction to the Cat Drawing Project with Pastels',74,'',1),
    ('Sketching the Basic Shapes and Proportions of a Cat',74,'',1),
    ('Adding Details, Shadows, and Highlights to Bring Your Cat to Life',74,'',1),
    ('Final Touches and Finishing Details on Your Cat Illustration',74,'',1),
    ('Introduction to the Dog Drawing Project with Pastels',75,'',1),
    ('Sketching the Basic Shapes and Proportions of a Dog',75,'',1),
    ('Adding Details, Shadows, and Highlights to Enhance the Dogs Features',75,'',1),
    ('Finalizing and Polishing Your Dog Drawing with Pastels',75,'',1),
    ('Introduction to the Parrot Drawing Project with Pastels',76,'',1),
    ('Sketching the Basic Shapes and Proportions of a Parrot',76,'',1),
    ('Adding Details, Patterns, and Texture to the Parrots Plumage',76,'',1),
    ('Final Adjustments and Refinements to Bring Your Parrot Illustration to Life',76,'',1),
    ('Introduction to the Cow Drawing Project with Oil Pastels',77,'',1),
    ('Sketching the Basic Shapes and Proportions of a Cow',77,'',1),
    ('Finalizing and Polishing Your Cow Drawing with Oil Pastels',77,'',1),
    ('Peer-Graded',78,'',1),

    ('Introduction to Drawing in 3D: Understanding Form, Lighting, and Perspective',79,'',1),
    ('Introduction to Perspective: One-Point, Two-Point, and Three-Point Perspective',79,'',1),
    ('Practice Exercises and Projects to Improve Your 3D Drawing Skills',79,'',1),
    ('Introduction to Figure Drawing: Importance and Benefits',80,'',1),
    ('Proportions and Anatomy: Understanding the Human Body',80,'',1),
    ('Practice Exercises and Projects to Enhance Your Figure Drawing Skills',80,'',1),
    ('Understanding Facial Proportions and Features',81,'',1),
    ('Capturing Expressions and Emotions in Portraits',81,'',1),
    ('Practice Exercises and Projects to Master Drawing Human Heads and Faces',81,'',1),
    ('Introduction to Painting: From Black and White to Color',82,'',1),
    ('Applying Color to Add Life and Dimension to Your Paintings',82,'',1),
    ('Practice Exercises and Projects to Improve Your Painting Skills',82,'',1),
    ('Introduction to Painting Full Scenes: Composition and Design',83,'',1),
    ('Sketching and Blocking in the Major Shapes and Forms',83,'',1),
    ('Practice Exercises and Projects to Master Painting Full Scenes',83,'',1),
    ('Introduction to Photoshop CS5: Features and Tools Overview',84,'',1),
    ('Image Editing and Manipulation Techniques',84,'',1),
    ('Working with Selections and Masks',84,'',1),
    ('Practice Exercises and Projects to Master Photoshop CS5',84,'',1),
    ('Introduction to Photo Editing: Importance and Benefits',85,'',1),
    ('Basic Photo Editing Techniques: Cropping, Resizing, and Adjusting Exposure',85,'',1),
    ('Practice Exercises and Projects to Master Photo Editing Skills',85,'',1),
    ('Peer-Graded',86,'',1);

INSERT INTO Post (cateID, status, date, author, content, title)
VALUES
    (1, 1, '2023-10-30', 'John Doe', 'This is the content of post 1', 'Post 1 Title'),
    (2, 1, '2023-10-31', 'Jane Smith', 'This is the content of post 2', 'Post 2 Title'),
    (1, 1, '2023-10-31', 'Alice Johnson', 'This is the content of post 3', 'Post 3 Title'),
    (3, 1, '2023-11-01', 'Bob Anderson', 'This is the content of post 4', 'Post 4 Title'),
    (2, 1, '2023-11-02', 'Sarah Wilson', 'This is the content of post 5', 'Post 5 Title'),
    (4, 1, '2023-11-02', 'Michael Brown', 'This is the content of post 6', 'Post 6 Title'),
    (3, 1, '2023-11-03', 'Emily Davis', 'This is the content of post 7', 'Post 7 Title'),
    (1, 1, '2023-11-04', 'Daniel Taylor', 'This is the content of post 8', 'Post 8 Title'),
    (4, 1, '2023-11-04', 'Olivia Martinez', 'This is the content of post 9', 'Post 9 Title'),
    (2, 1, '2023-11-05', 'James Wilson', 'This is the content of post 10', 'Post 10 Title'),
    (3, 1, '2023-11-06', 'Emma Thompson', 'This is the content of post 11', 'Post 11 Title'),
    (1, 1, '2023-11-06', 'Benjamin Davis', 'This is the content of post 12', 'Post 12 Title'),
    (4, 1, '2023-11-07', 'Sophia Anderson', 'This is the content of post 13', 'Post 13 Title'),
    (2, 1, '2023-11-08', 'Jacob Miller', 'This is the content of post 14', 'Post 14 Title'),
    (3, 1, '2023-11-08', 'Ava Garcia', 'This is the content of post 15', 'Post 15 Title'),
    (1, 1, '2023-11-09', 'William Thompson', 'This is the content of post 16', 'Post 16 Title'),
    (4, 1, '2023-11-10', 'Mia Hernandez', 'This is the content of post 17', 'Post 17 Title'),
    (2, 1, '2023-11-10', 'Alexander Clark', 'This is the content of post 18', 'Post 18 Title'),
    (3, 1, '2023-11-11', 'Charlotte Johnson', 'This is the content of post 19', 'Post 19 Title'),
    (1, 1, '2023-11-12', 'Ethan Martinez', 'This is the content of post 20', 'Post 20 Title');



