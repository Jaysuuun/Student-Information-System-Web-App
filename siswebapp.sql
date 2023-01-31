-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2023 at 11:16 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siswebapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`id`, `name`) VALUES
(' rwasd', 'adadada'),
('CASS', 'College of Arts and Social Sciences'),
('CCS', 'College of Computer Studies'),
('CEBA', 'College of Economics, Business and Accountancy'),
('CED', 'College of Education'),
('COET', 'College Of Engineering and Technology'),
('CON', 'College Of Nursing'),
('CSM', 'College of Science and Mathematics');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `college_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `college_id`) VALUES
('BA English', 'Bachelor of Arts in English', 'CASS'),
('BA Filipino', 'Bachelor of Arts in Filipino', 'CASS'),
('BA History', 'Bachelor of Arts in History', 'CASS'),
('BEED', 'Bachelor of Elementary Education', 'CED'),
('BS Psych', 'Bachelor of Science in Psychology', 'CASS'),
('BSA', 'Bachelor of Science in Accountancy', 'CEBA'),
('BSBA', 'Bachelor of Science in Business Administration', 'CEBA'),
('BSBIO', 'Bachelor of Science in Biology', 'CSM'),
('BSCA', 'Bachelor of Science in Computer Applications', 'CCS'),
('BSCerE', 'Bachelor of Science in Ceramics Engineering', 'COET'),
('BSChem', 'Bachelor of Science in Chemistry', 'CSM'),
('BSChemE', 'Bachelor of Science in Chemical Engineering', 'COET'),
('BSCpe', 'Bachelor of Science in Computer Engineering', 'COET'),
('BSCS', 'Bachelor of Science in Computer Science', 'CCS'),
('BSEd', 'Bachelor of Science in Secondary Education', 'CED'),
('BSEE', 'Bachelor of Science in Electrical Engineering', 'COET'),
('BSEM', 'Bachelor of Science in Mining Engineering', 'COET'),
('BSHRM', 'Bachelor of Science in Hotel, and Restaurant Management', 'CEBA'),
('BSIS', 'Bachelor of Science in Information Systems', 'CCS'),
('BSIT', 'Bachelor of Science in Information Technology', 'CCS'),
('BSMath', 'Bachelor of Science in Mathematics', 'CSM'),
('BSME', 'Bachelor of Science in Mechanical Engineering', 'COET'),
('BSN', 'Bachelor of Science in Nursing', 'CON'),
('BSPhy', 'Bachelor of Science in Physics', 'CSM'),
('BSPolSci', 'Bachelor of Science in Political Science', 'CASS'),
('BSSTAT', 'Bachelor of Science in Statistics', 'CSM'),
('BSVS', 'Bachelor of Science in Vulcanizing Shop', 'COET');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `ID` varchar(9) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `college_id` varchar(50) DEFAULT NULL,
  `course_id` varchar(50) DEFAULT NULL,
  `yearlevel` varchar(50) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`ID`, `firstname`, `middlename`, `lastname`, `gender`, `college_id`, `course_id`, `yearlevel`, `img_url`) VALUES
('2019-0001', 'Peter', 'Gene', 'Hernandez', 'Male', 'CED', 'BSEd', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675147848/Students/y9teuhdednryafni26hm.jpg'),
('2019-0002', 'Dwayne', 'Douglas', 'Johnson', 'Male', 'CCS', 'BSCS', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675147861/Students/b8tnqs4nh33bg8bvh8jm.jpg'),
('2019-0003', 'Sandra', 'Anette', 'Bullock', 'Female', 'CCS', 'BSCS', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675147980/Students/obvkfjzfbldxrfdhep6j.jpg'),
('2019-0004', 'Kendrick', 'Lamar', 'Duckworth', 'Male', 'CCS', 'BSIS', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148006/Students/qagakwuvjdbq1jqphmyi.jpg'),
('2019-0005', 'Drake', 'Aubrey', 'Graham', 'Male', 'CON', 'BSN', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148024/Students/wcogt3gzcsjwxnezqwle.jpg'),
('2019-0006', 'Ariana', 'Grande', 'Butera', 'Female', 'CON', 'BSN', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148041/Students/b3kkbmqvj09iyun8hcn0.jpg'),
('2019-0007', 'Selena', 'Marie', 'Gomez', 'Female', 'CCS', 'BSIS', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148263/Students/zg8lesoqvjmdcxet1opl.jpg'),
('2019-0008', 'Rachel', 'Meghan', 'Markle', 'Female', 'CCS', 'BSIS', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148286/Students/w1nkezcje3nqtftabmzn.jpg'),
('2019-0009', 'Lauren', 'Keyana', 'Palmer', 'Female', 'COET', 'BSCpe', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148305/Students/wlxfaroq8wy1w7xdphoi.jpg'),
('2019-0010', 'Christopher', 'Ashton', 'Kutcher', 'Male', 'CED', 'BSEd', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148322/Students/lo61fbtbvcqjjatdkalh.jpg'),
('2019-0011', 'Robert', 'Allen', 'Zimmerman', 'Male', 'CCS', 'BSCA', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148800/Students/pr1tonv8qctaws2srjx6.jpg'),
('2019-0012', 'Hannah', 'Dakota', 'Fanning', 'Female', 'CASS', 'BA Filipino', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148860/Students/iewpi0wafchxq0csjdqp.jpg'),
('2019-1502', 'Taylor', 'Alison', 'Swift', 'Female', 'CEBA', 'BSBA', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675142195/Students/qr4kxtstfnzhxbvy0ra7.jpg'),
('2019-4234', 'Nicholas', 'David', 'Offerman', 'Male', 'CEBA', 'BSBA', '4th Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675151114/Students/kem1ydaja46g945djkwm.jpg'),
('2020-0001', 'Jennifer', 'Shrader', 'Lawrence', 'Female', 'COET', 'BSChemE', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148888/Students/amj6bmpc4b0n3xzqiv1v.jpg'),
('2020-0002', 'Lebron', 'Raymone', 'James', 'Male', 'CED', 'BEED', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148911/Students/yn6oqyjlogkhqkuyoihi.jpg'),
('2020-0003', 'Ryan', 'Thomas', 'Gosling', 'Male', 'CEBA', 'BSBA', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148929/Students/ixieho0a9wyqav1f2gqs.jpg'),
('2020-0004', 'Michael', 'Joseph', 'Jackson', 'Male', 'CASS', 'BSPolSci', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148954/Students/oojzwavy99mvo6nbsgtq.jpg'),
('2020-0005', 'Katheryn', 'Elizabeth', 'Hudson', 'Female', 'CED', 'BSEd', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148972/Students/g5foudeyastynbsi33ud.jpg'),
('2020-0006', 'James', 'Charles', 'Dickson', 'Male', 'CASS', 'BA English', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675148995/Students/uxfezwsyg38fuifwk44l.jpg'),
('2020-0007', 'John', 'Winston', 'Lennon', 'Male', 'CASS', 'BSPolSci', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149015/Students/bn9ezlo6r6npok1rersc.jpg'),
('2020-0008', 'Paul', 'James', 'McCartney', 'Male', 'CEBA', 'BSBA', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149191/Students/kidlb6zc4ztuf1xuszwl.jpg'),
('2020-0009', 'Lionel', 'Brockman', 'Richie', 'Male', 'COET', 'BSME', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149219/Students/dcvrcxnclwvryo3pnhfb.jpg'),
('2020-0010', 'Whitney', 'Elizabeth', 'Houston', 'Female', 'CASS', 'BS Psych', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149241/Students/kxdgjv5u310awmwz1moy.jpg'),
('2020-1111', 'Joshua', 'James', 'Brolin', 'Male', 'COET', 'BSEE', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675150437/Students/lwtnhzuswqmvvfdqalca.jpg'),
('2020-1205', 'Stefani Joanne', 'Angelina', 'Germanotta', 'Female', 'CASS', 'BS Psych', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675155080/Students/hot5t8kgvwqgtmamhs9u.jpg'),
('2020-1414', 'Aubrey', 'Christina', 'Plaza', 'Female', 'CASS', 'BS Psych', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675151198/Students/pji0visux2abou8xgvwt.jpg'),
('2020-1502', 'Bob Jason', 'Waga', 'Legaspi', 'Male', 'CCS', 'BSCS', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675100459/Students/nfqayos7yerh3tml0yte.jpg'),
('2020-2535', 'Rainn', 'Dietrich', 'Wilson', 'Male', 'CEBA', 'BSA', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675150960/Students/faxqrfwqlwwiv3gjxtls.jpg'),
('2020-6723', 'Jose Pedro', 'Balmaceda', 'Pascal', 'Male', 'COET', 'BSEE', '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675150607/Students/iwdygqusogfrbscwz70j.jpg'),
('2020-9999', 'ihyffyd', 'vihgi', 'jigigv', 'Female', NULL, NULL, '3rd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675156985/Students/ysxf8tegsmxihflsn02l.jpg'),
('2021-0001', 'Gaia', 'Celine', 'Legaspi', 'Female', 'CEBA', 'BSA', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149374/Students/hyxxopvyhwpifmqkpjre.png'),
('2021-0002', 'William', 'Bradley', 'Pitt', 'Male', 'CON', 'BSN', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149264/Students/md1zb42cfx8jupyj181z.jpg'),
('2021-0003', 'Karen', 'Lucille', 'Hale', 'Female', 'CEBA', 'BSA', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149286/Students/ouy54vmzhkcoqsypv5el.jpg'),
('2021-0004', 'James', 'Jame', 'James', 'Other', 'CEBA', 'BSHRM', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149309/Students/hbnjmnz8sqg87svp4rpa.jpg'),
('2021-0005', 'Mark', 'John', 'Legaspi', 'Male', 'CSM', 'BSSTAT', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149331/Students/eu8jwny4ahzc26bz5w5l.png'),
('2021-0006', 'Paul', 'Kevin', 'Jonas II', 'Male', 'CON', 'BSN', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149575/Students/qc6upz0prcckrxcbtpq5.jpg'),
('2021-0007', 'Mary', 'Elle', 'Fanning', 'Female', 'COET', 'BSCpe', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149595/Students/ffu877rmq8e8yovzxy6s.jpg'),
('2021-0911', 'Sacha', 'Baron', 'Cohen', 'Male', 'COET', 'BSChemE', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675151361/Students/qxe9iokzczbiefpshplg.jpg'),
('2021-5452', 'John', 'Burke', 'Krasinski', 'Male', 'CEBA', 'BSA', '2nd Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675150861/Students/rm2j24swtsi5lra8u3gw.jpg'),
('2022-0001', 'Justin', 'Corneho', 'Chio', 'Male', 'CCS', 'BSIT', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675155343/Students/br6qpzy8gcwn6iwxsrkn.jpg'),
('2022-0002', 'Endymion', 'Waga', 'Legaspi', 'Male', 'CCS', 'BSCS', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675155392/Students/uyvtwk4wlylktk1xtmdq.jpg'),
('2022-0003', 'Justine', 'Randall', 'Timberlake', 'Male', NULL, NULL, '1st Year', NULL),
('2022-0004', 'John', 'William', 'Ferrell', 'Male', 'CSM', 'BSPhy', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149616/Students/ivrrfjb45i2bxb3of31c.jpg'),
('2022-0005', 'Ellen', 'Lee', 'DeGeneres', 'Female', 'CED', 'BSEd', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149637/Students/kwkf4nzd3xrdtv80etm5.jpg'),
('2022-0006', 'Nicole', 'Mary', 'Kidman', 'Female', 'CEBA', 'BSA', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149669/Students/lcgivcd3tuigxqttqrqs.jpg'),
('2022-0007', 'Miley', 'Ray', 'Cyrus', 'Female', 'CCS', 'BSCA', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149695/Students/ukqe3bldxibbwud1ysqy.jpg'),
('2022-0008', 'Angelina', 'Jolie', 'Voight', 'Female', 'COET', 'BSCpe', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675149717/Students/wni0r2by6hpvu9lweuyy.jpg'),
('2022-1502', 'Ryan', 'Rodney', 'Reynolds', 'Male', 'CEBA', 'BSHRM', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675150298/Students/i21wxvhqurmoq6m195sb.jpg'),
('2022-1505', 'Blake', 'Ellender', 'Liveley', 'Female', 'CASS', 'BS Psych', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675150359/Students/jir7nbboink5mtnshyoy.jpg'),
('2022-4411', 'Lesley', 'Barbara', 'Knope', 'Female', 'CASS', 'BSPolSci', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675151056/Students/tfjpymglccawhiqb4ant.jpg'),
('2022-5133', 'Steven', 'John', 'Carrell', 'Male', 'CEBA', 'BSBA', '1st Year', 'http://res.cloudinary.com/dbkiycgft/image/upload/v1675150746/Students/kpz5gd4camrg10vha1xe.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `college_IDC` (`college_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `students_ibfk_1` (`college_id`),
  ADD KEY `students_ibfk_2` (`course_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `college_IDC` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`college_id`) REFERENCES `college` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
