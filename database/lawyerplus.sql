-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 08:52 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lawyerplus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
                         `name` varchar(50) NOT NULL,
                         `contact_number` varchar(50) NOT NULL,
                         `username` varchar(10) NOT NULL,
                         `password` varchar(10) NOT NULL,
                         `email` varchar(50) NOT NULL,
                         `address` varchar(50) NOT NULL,
                         `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `contact_number`, `username`, `password`, `email`, `address`, `DOB`) VALUES
    ('', '77123456', 'admin', 'admin', 'admin@lawyerplus.lk', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
                               `Appointment_id` varchar(20) NOT NULL,
                               `Case_Type` varchar(50) NOT NULL,
                               `Lawyer_Id` varchar(50) NOT NULL,
                               `Description` varchar(100) NOT NULL,
                               `client_id` varchar(50) DEFAULT NULL,
                               `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`Appointment_id`, `Case_Type`, `Lawyer_Id`, `Description`, `client_id`, `time`) VALUES
                                                                                                               ('APM-0001', 'Corporate Law', '14', 'hJ2CiLmHHz2mcPdw9pFbElpFNnVlWFg0VTNPQ2oxMlFhN0VDK1E9PQ==', NULL, '2023-08-04 18:00:00'),
                                                                                                               ('APM-0002', 'Immigration Law', '10', 'nUe1g7n/7CEWkUb636iDNkZLdXZVbENOVzNST0pvTUFFaUFUUEE9PQ==', NULL, '2023-08-01 09:00:00'),
                                                                                                               ('APM-0003', 'Criminal Law', '13', 'Court ', 'CLT-0006', '2023-08-03 11:00:00'),
                                                                                                               ('APM-0004', 'Corporate Law', '14', 'Need legal representation. Kindly schedule a consultation at your earliest convenience. Time-sensiti', NULL, '2023-08-04 18:00:00'),
                                                                                                               ('APM-0005', 'Immigration Law', '10', 'I need to get some advice for my Childs Immigrations', 'CLT-0004', '2023-08-01 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `assistant`
--

CREATE TABLE `assistant` (
                             `assistant_id` varchar(50) NOT NULL,
                             `name` varchar(50) NOT NULL,
                             `email` varchar(50) NOT NULL,
                             `lawyer_id` varchar(50) NOT NULL,
                             `contact_number` varchar(50) NOT NULL,
                             `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `assistant`
--
DELIMITER $$
CREATE TRIGGER `insert_user_from_assistant` AFTER INSERT ON `assistant` FOR EACH ROW BEGIN
    -- Insert into assistant table
    INSERT INTO user (user_id, name, role, password, status)
    VALUES (NEW.assistant_id,NEW.name,'assistant',NEW.password,'inactive');
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_assistant` AFTER UPDATE ON `assistant` FOR EACH ROW BEGIN
    UPDATE user
    SET name = NEW.name,
        role = 'assistant',
        password = NEW.password,
        status = 'inactive'
    WHERE user_id = NEW.assistant_id;
END
    $$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cases`
--

CREATE TABLE `cases` (
                         `case_id` varchar(20) NOT NULL,
                         `lawyer_id` varchar(50) NOT NULL,
                         `client_id` varchar(20) NOT NULL,
                         `description` varchar(500) NOT NULL,
                         `C_type` varchar(20) NOT NULL,
                         `submit_date` date NOT NULL,
                         `satuts` varchar(50) NOT NULL,
                         `Amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cases`
--

INSERT INTO `cases` (`case_id`, `lawyer_id`, `client_id`, `description`, `C_type`, `submit_date`, `satuts`, `Amount`) VALUES
                                                                                                                          ('CS-004', 'LW01', 'CLT-0003', 'Devorce', 'Family', '2023-02-01', 'Processing', 7690),
                                                                                                                          ('CS-005', 'LW01', 'CLT-0003', 'Devorce', 'Family', '2023-02-01', 'Processing', 7690),
                                                                                                                          ('CS-006', 'LW05', 'CLT-0003', 'Devorce', 'Family', '2023-02-01', 'Processing', 7690),
                                                                                                                          ('CSE-0001', '', 'CLT-0006', 'divorces', 'Family Law', '0000-00-00', 'Pending', 8970),
                                                                                                                          ('CSE-0002', 'LW13', 'CLT-0006', 'divorces', 'Family Law', '0000-00-00', 'Pending', 8970),
                                                                                                                          ('CSE-0003', 'LW13', 'CLT-0006', 'divorces wife', 'Family Law', '0000-00-00', 'Pending', 8970),
                                                                                                                          ('CSE-0004', 'LW13', 'CLT-0006', 'divorces wife', 'Family Law', '0000-00-00', 'Pending', 8970),
                                                                                                                          ('CSE-0005', '3', 'CLT-0006', 'Murder', 'Criminal Law', '0000-00-00', 'Pending', 8970),
                                                                                                                          ('CSE-0006', '3', 'CLT-0006', 'Murder', 'Criminal Law', '0000-00-00', 'Pending', 8970),
                                                                                                                          ('CSE-0007', '3', 'CLT-0006', 'Murder', 'Criminal Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0008', '3', 'CLT-0006', 'divorces', 'Criminal Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0009', 'LW13', 'CLT-0006', 'divorces', 'Family Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0010', 'LW13', 'CLT-0006', 'divorces', 'Family Law', '0000-00-00', 'Pending', 8970),
                                                                                                                          ('CSE-0011', 'LW13', 'CLT-0006', 'divorces', 'Family Law', '0000-00-00', 'Completed', 8970),
                                                                                                                          ('CSE-0012', 'LW13', 'CLT-0006', 'divorces', 'Family Law', '1970-01-01', 'Completed', 8970),
                                                                                                                          ('CSE-0013', 'LW13', 'CLT-0006', 'divorces', 'Family Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0014', 'LW13', 'CLT-0006', 'divorces', 'Family Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0015', 'LW13', 'CLT-0004', 'Need to get Advices for t', 'Family Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0016', '6', 'CLT-0004', 'Need to get Advice for th', 'Real Estate Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0017', 'LW01', 'CLT-0004', 'A company considering the acquisition of another company, involving due diligence, negotiations, legal agreements, and integration planning.', 'Corporate Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0018', 'LW01', 'CLT-0004', 'A company facing financial challenges decides to restructure its debt, assets, or operations to improve its financial position.', 'Corporate Law', '1970-01-01', 'Pending', 8970),
                                                                                                                          ('CSE-0019', 'LW13', 'CLT-0004', 'Can my marriage survive this betrayal?', 'Family Law', '1970-01-01', 'Pending', 8970);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
                          `client_id` varchar(10) NOT NULL,
                          `name` varchar(252) NOT NULL,
                          `nic` varchar(10) NOT NULL,
                          `email` varchar(50) NOT NULL,
                          `DOB` date DEFAULT NULL,
                          `contact_number` varchar(15) NOT NULL,
                          `address` varchar(252) NOT NULL,
                          `password` varchar(25) NOT NULL,
                          `registerd_datte` date NOT NULL DEFAULT current_timestamp(),
                          `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `name`, `nic`, `email`, `DOB`, `contact_number`, `address`, `password`, `registerd_datte`, `status`) VALUES
                                                                                                                                            ('CLT-0003', 'Thimira Sadeesha', '1234', 'sadeeshathimira2000@', NULL, '0769371701', '228,\"sadeesha\",', 'e2fc714c4727ee9395f324cd2', '2023-08-05', 'active'),
                                                                                                                                            ('CLT-0004', 'abcd', '1234', 'sadeeshathimira2000@', NULL, '0769371701', '228,\"sadeesha\",', 'e10adc3949ba59abbe56e057f', '2023-08-05', 'active'),
                                                                                                                                            ('CLT-0005', 'xxxx', '1234', 'sadeeshathimira2000@', NULL, '0769371701', '228,\"sadeesha\",', 'e10adc3949ba59abbe56e057f', '2023-08-05', 'active'),
                                                                                                                                            ('CLT-0006', 'Admin', '1234', 'sadeeshathimira2000@', NULL, '0769371701', '228,\"sadeesha\",', '25f9e794323b453885f5181f1', '2023-08-05', 'active'),
                                                                                                                                            ('E2046022', 'Kanishka_Bandara', '992654660V', 'kanishka@gmail.com', NULL, '775756081', 'No 99,welagedra road', 'admin@1234', '2023-07-26', 'Active'),
                                                                                                                                            ('E2046315', 'Tharuka', '9845625812', 'tharuka@gmail.com', NULL, '75845125', 'test2', 'admin@123', '2023-07-26', 'Active'),
                                                                                                                                            ('E23456', 'bandara', '23232223', 'cxvvs', '2000-10-02', '23456786', 'dfghbb', '', '2023-08-04', ''),
                                                                                                                                            ('sdeelz', 'ddcd', 'Thimira Sa', 'sadeeshathimira2000@', '1970-01-01', '228,\"sadeesha\",', '0769371701', '', '2023-07-30', '');

--
-- Triggers `client`
--
DELIMITER $$
CREATE TRIGGER `after_update_inactive_user` AFTER UPDATE ON `client` FOR EACH ROW BEGIN
    UPDATE client
    SET status = 'Active'
    WHERE client_id = NEW.client_id;
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_from_user_client` AFTER DELETE ON `client` FOR EACH ROW BEGIN
    DELETE FROM user WHERE user.user_id = OLD.client_id;
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_user_from_client` AFTER INSERT ON `client` FOR EACH ROW BEGIN
    -- Insert into user table
    INSERT INTO user (user_id, name, role, password, status)
    VALUES (NEW.client_id,NEW.name,'client',NEW.password,'Active');
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `record_deletion_trigger_client` AFTER DELETE ON `client` FOR EACH ROW BEGIN
    INSERT INTO deleted_client (`client_id`, `name`, `nic`, `email`, `DOB`, `contact_number`, `address`, `password`, `registerd_datte`, `status`)
    VALUES (OLD.client_id, OLD.name, OLD.nic, OLD.email, OLD.DOB, OLD.contact_number, OLD.address, OLD.password, OLD.registerd_datte, OLD.status);
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_from_client` AFTER UPDATE ON `client` FOR EACH ROW BEGIN
    UPDATE user
    SET name = NEW.name,
        role = 'client',
        password = NEW.password,
        status = 'Active'
    WHERE user_id = NEW.client_id;
END
    $$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `client_statement`
--

CREATE TABLE `client_statement` (
                                    `statement_id` varchar(50) NOT NULL,
                                    `client_id` varchar(50) NOT NULL,
                                    `lawyer_id` varchar(50) NOT NULL,
                                    `message` varchar(500) NOT NULL,
                                    `Topic` varchar(500) NOT NULL,
                                    `Case_Id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_statement`
--

INSERT INTO `client_statement` (`statement_id`, `client_id`, `lawyer_id`, `message`, `Topic`, `Case_Id`) VALUES
                                                                                                             ('SMT-001', '', '', 'Apple Inc. is an American multinational technology company headquartered in Cupertino, California. A', 'Sadeesha', '15'),
                                                                                                             ('SMT-002', '', '', 'Discover the innovative world of Apple and shop everything iPhone, iPad, Apple Watch, Mac, and Apple', 'sdsdsd', '16'),
                                                                                                             ('SMT-003', '', '', 'The most powerful Mac laptops and desktops ever ..', 'thimi', '16'),
                                                                                                             ('SMT-004', '', '', 'The most powerful Mac laptops and desktops ever ..', 'thimi', '16'),
                                                                                                             ('SMT-005', '', '', 'The most powerful Mac laptops and desktops ever ..', 'thimi', '16'),
                                                                                                             ('SMT-006', '', '', 'The most powerful Mac laptops and desktops ever ..', 'thimi', '16'),
                                                                                                             ('SMT-007', '', '', 'Empty Testing', 'Empty Testing', '16'),
                                                                                                             ('SMT-008', '', '', 'Empty Testing', 'Empty Testing2', '16'),
                                                                                                             ('SMT-009', '', '', 'DuU9U+KlrA1kaLVAU9f3LzVTT1dXcjV3TGNuWDkxbTZ5NmVxck9mdzltQlNlNHlzSlUxbjF4dFBUT0E9', 'Empty Testing', '16'),
                                                                                                             ('SMT-010', '', '', '8y4QO0hybQb8LAM/+UdONzFadk9pcndPV1FTenROVUZwOHhUeHJxOS9YZnpCZEx6MStrdUE4UnhHYTA9', 'thimi', 'CSE-0002'),
                                                                                                             ('SMT-011', '', '', '+JKyszOpDqWVqtzLKe0w5EsyRldXRkpGUUZqL2RlNVl0Wks1NlE9PQ==', 'hyyyyy', 'CSE-0003'),
                                                                                                             ('SMT-012', '', '', 'kOZ3P+PnIXpvWU5UfWRr03dPbjdwbWt1L1RQcmgvMzExMkQ2TUFSNVZZYUxPaDFpeWtIQUdMRkZJOW89', 'Test', 'CSE-0004'),
                                                                                                             ('SMT-013', '', '', 'HTLUJXQ2Uk8ovB8uNh2BokZLT1RuRFZsbXJRd29iL1BSREc0YS84Q2t5WGVFUDkrN2NaOS93SnhpZ3c9', 'Test', 'CSE-0004'),
                                                                                                             ('SMT-014', '', '', 'vdTSvPTGqmozFnyCEkE6Qm9kenREUXIwRDJNMFN5eEVKREFGbjJWYTh2RGVxU3dGZEpXMUdpb1Z3aUU9', 'Test', 'CSE-0004'),
                                                                                                             ('SMT-015', '', '', 'Otg3xumcfmzhvsvbrM41cldhNVI4RzdNd05ubEgyYzRxclRWeFE9PQ==', 'Test0_Sadee', 'CS-006'),
                                                                                                             ('SMT-016', '', '', 'aDGH+Uk4QzY2VVoehgy9TXpnSXczcU1YMEZGZE5lWkYwOHdkRWc9PQ==', 'Test', 'CS-005'),
                                                                                                             ('SMT-017', '', '', 'WVffEFAg+GbbJvwIMCwnAVF1Q0FGMTg5S2JiOHp0L2VZcG1QR1E9PQ==', 'Test', 'CS-005'),
                                                                                                             ('SMT-018', '', '', 'Bd2ZU/HDj9XtgxTzM1enF044Q255Z2V1L29SdFJIVzlKZUc2WUI3NUFsSFRRU2MrOEt3SCswMDBCc1NNQmhKZHc3bzBGR3I0SW93dVZFZDdSYkhoTng4Ulo3ek9waGlJZHo2bkswaVNUYWVCaENLU1ZYOVVBZlJBcHVZPQ==', 'About the Divorce ', 'CSE-0015'),
                                                                                                             ('SMT-019', 'CLT-0004', '', 'gvNgWuqnIhRAGwcRvCvXIFVuVU92Mk9XTkRDNURzTnEvdk9pMDd5SWZmYXE3RXJXNE56QUdTYkJkdHhiajAzWDZZYXczVnEzajJGTE5MdEhpNFFQWEoya0pHYUZYUEdCdkZzeVhRV1lLRkQ0Slpja3FqbTlCREhZdWNBPQ==', 'About the Divorce ', 'CSE-0015'),
                                                                                                             ('SMT-020', 'CLT-0004', '', 'Afyd69Cbu3qNubG7WJrBi09DcHk2eTZuZDRaVWV2WnRkNHpWcDNKVmtOTFBqMmJSdDZwK2JCTXlqRlNTdmtONXErOENPWFdYb2ZuVkdJT29uTTFFeVdTMjNJaHlqVWFaY3doMGEzd20zVE91STAzMTE2c0grTU1pUm9ZK3lBeTljNkp4cGlGaWNleWxuZmYx', 'About the Divorce ', 'CSE-0015'),
                                                                                                             ('SMT-021', 'CLT-0004', '', '9cyKIfMP3xHlXq9TlY4RsUFlVmNrR3piNlZVMjByL1pLWExqUlNYTkxCdTM2cEVGR1QxTSs5K1lMUllxZXJsVC92SmlPSGtYU0pRaVIxd21qdFlkRFA5My9ZaTU4c0JGQTQ0Vlp5cGJubkt2ZndYdktVcFZFY25RZnRhL0Z0d1A2YWtFZVlmY0ZMQlRGa1R4R3dVZEM4WG4wcUd0aTRNVkZ2Y1JuTHMwOXNac3hNVnV4aktjc3BNd0wrTUtNNDJIZ1pLdzFIcVY0MzQ2MURJZ0ZneS94ZCtzMko1eVY2UTZTcE9mVGRuTEFTMjRoZnBBcVZVUDF2T1hOYmM9', 'About Family Case', 'CSE-0019'),
                                                                                                             ('SMT-022', 'CLT-0004', '', 'vZwnp3/mF/EgfMrFCPxXTUJNUWlWQytrZDZ4MURHZEwzTGpZUVhBdzdZbi90dml5RlRjRHM0dXFjdnA2cUU3VCs1MHpNcWlWN2dPY29CMTlmZnIzb0RzbkRJaDNmWHlNUlZHWVdsY3hPemo0d09yODhQd01DT0hIRzhBU1BFMHZMREtkVTlDU1BxWUNWamQ5YTZzZFgxQzltWWk4WGhidGxjSldMQ2RnVDdOTWxEQ2V3dzByZWUwa1FtdDU3M1pJaUZTVWtQeVlwem9FMUZWeUc5YTlacU43YjJYOWpYbHZINlpJR1lKUWE1QmY4dnFlTm9PSjFQUTZYL2hWcHhHUkxicGpBaG9sOUczd3Q4Z3NoaHlyWnR1dWxnaEhnRlRwbGg2MldnPT0=', 'Doe Company v. Doe Law Firm Verdict: $45.6 million', 'CSE-0018'),
                                                                                                             ('SMT-023', 'CLT-0004', '', '2GObfINpKd6Qp72FpqK1mFdwdkk5SnhFTU42cXA4bFExWlpCUVRiZzdmREtjczNwUlcrNy9sRGhnbXlDMjJ2MzVGZEVUTFhselBBT283UG5lSWxPSlk4djd5Z0x2WFB6eTdZRjZnbkx3MHJBZkptRjVsNldBRTBGYW1VPQ==', 'Doe Company v. Doe Bank Settlement $3.7 million', 'CSE-0018'),
                                                                                                             ('SMT-024', 'CLT-0004', '', 'yjhWn5FCy2Iuy9UFX+x2wW5kM0UxWHNkQnhyd2FUUklDMGNHQktuWGZVcm5kc2FOOGNscFk1ZDIyVXpLLzRrV3pxWGQwNW5UcU05NW4wUHN3VDE0dFM0REtSWTNUaVpxVkFOWWlGWXVpU0dHWlJTZkNGSUJRSnRIU09lM1dIRzI4Y3N3TldWZUJFNWE2NUE3dVlCNGMrVm1WSWFBM2xhRGwxNjBwN0M4NndxelBqOC9SMUthSHQ3Vlcvb1dWTFFuWFhvQVlnQTd5TjlLTXN1ajBsWEJPeEY2Q3FwZCt5ajdkK1VyeXB0VnVpeldKWXpoZEM3ejhFS1RzZi9uUDJFSHhVUTZUK3Yva0tpTGpUeUVQTGdiZGxnbEc2MVV0MmJ6RTBrdGVnR053OUMyTWR2MmN3ZGt4V3JFUWM0dDdPY2sxMHMxYUFLZ0NjN0dxTmNMeGlQN2pkN25jQUszc1FzemZ3cm9mVHVjZUVtVGlZNmluc1hSTis1', 'McDonald\'s Corporation v. Steel & Morris (McLibel Case)', 'CSE-0017'),
('SMT-025', 'CLT-0006', '', 'Au4gNkkglQ3DZRarUtL4Tzd4K2NEZzFTMy9zeUZUN0ozdW1iV1NFd3pjUTFlWXFuYkx5Q091dWx3S0YxWmhKd0t4M2g3cFplbG9WSnVKU3J0Q0k0WldaL0RhcWluMVRpUHJFakZCQTFya2VIQ1UxZk9DRW54TDkvTThJcFBwMVV3d0M3VFJOR2VhZ2oyWTJKMmVEWUFMQnhQY1lpcHdwTERSQXQ0Q1RpZkV4L0JleEFWcEljWjluOXZjZHhmeEphU0hLZklmUm1RQmQ3QTRyZFpHNU9HNE51T2ttcHRDOG5UVzY5dWhWeEs4UzR4aC9MQlQrV0YzZngxSFhVMnRqNUpwYTg5NTFBMUdlVmVxc1dlUjZ5dUdjNFcvWkJMNGJzaWZRazBLaDR2aUx3cml5SFZzN1NkL2NxUzlYM0NLYTF0Vzk0S0JoUE9Sd2hsbU12aHZmc1BDYUdYRnZEWkZJSXVxei9MWXZiVVZuWXlpRjNnSHFEdWhV', 'Domestic Violence: Abuse by a Partner or Parent', 'CSE-0014'),
('SMT-026', 'CLT-0003', '', 'FEOD0LtSUiR/e7Atpr66oTJlMytiVHBLbCtPRFdvdUs5T2VhdmRWb280VlEwRWpQcEZYbk01UnRFeFZJMGtGbHRwNlQ1QklnM1hHQmlRaU1tbEdpSjBoOXNnUEcrUHBES1VJZXM4bS9YQkgxcENGR01WVHdObTh2V21hSjhRSkJzTnQwU3dELzdZS2pISjUvNUppekgyamNvRnhhMHJ0Z002SWxUZz09', 'Addiction: Alcohol, Drugs, Gambling, or Sex', 'CS-006'),
('SMT-027', 'CLT-0003', '', 'JMqB0CJ2LI5vOikjHCQOWDhneWlONDJhVUZydUREYi9LcXNiRExma3FPVTExSzhrNVdyM3puNG5oZ0xJaDRIcldDNWoyeGNvQ2E0RnhMUFVCN2w1SFlUc0pOd1JEMnJJZTEzSE02RGhRYU5QaHYrRTQ1ZTFRbVlDa2RHTVN3VmRtR2JHUklFbzM5T2UrYWd0YVcvRndzSkFnOEFGK0dPYlhPb2E1OVRaWVRac3NaaHZpSnl0QzU2aEpkZTUwbDQweFFmQ2Nwa0s1OUR3d2pGVTArUVVCc1NscFk5OVkyYnJJSHV2UlR4ZmFWQjlJZUJTYTRnWmI4NUZWMEhKZjZ3SW1SbWxKZ0RVRGVOM2FFSTRrWWhQYUY3cEpReWhpSWs5cWFvcWFhS2Jlc25oZmY5VlpXckhkYSsvdXZnPQ==', 'Absence of Romantic Intimacy or Love', 'CS-005'),
('SMT-028', 'CLT-0003', '', 'zzYtlqgQE7HJ/u/3qSfjyE1yUEczZmZlckJsZEFkZGtuNFVMUk41cVV4aEU2WlVmZTFKMlF3VzlsYkxPbW1ZNHhXbDVWNnZSanlwTExoMG1CV1MwemtySEJkeFdOZllPSHJGSlZHUHZUdXlzNmFxV3hVTHJvVU9VcEYwdFpEUDhkNmdZck9JSGlyVmdaWlNITFFpeStNMjNGSGtXWEVSa0ticWdncldNMlBLdHpPaXdrRWprek5jNENBREV5NHJuYXR6TjF4S29tdmtKdjdmUm0vQVc2eTFDa3graFZZNzFRMnhuQm9vekdqak45U1g4WUJrYnZnTUNOd2s9', 'One Spouse not Carrying Their Weight in the Marriage', 'CS-004');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_client`
--

CREATE TABLE `deleted_client` (
  `client_id` varchar(10) NOT NULL,
  `name` varchar(252) NOT NULL,
  `nic` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `DOB` date DEFAULT NULL,
  `contact_number` varchar(15) NOT NULL,
  `address` varchar(252) NOT NULL,
  `password` varchar(25) NOT NULL,
  `registerd_datte` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deleted_client`
--

INSERT INTO `deleted_client` (`client_id`, `name`, `nic`, `email`, `DOB`, `contact_number`, `address`, `password`, `registerd_datte`, `status`) VALUES
('', '', '', '', NULL, '', '', 'xcxcxcx', '2023-08-04', ''),
('CLT-0001', '', '', '', NULL, '1234567890', '', '', '2023-08-05', 'active'),
('CLT-0002', '', '', '', NULL, '1234567890', '', '', '2023-08-05', 'active'),
('E2046014', 'Sadeesha', '998458213V', 'sadeesha@gmail.com', NULL, '775124523', 'test', 'admin@123', '2023-07-26', 'Blocked');

--
-- Triggers `deleted_client`
--
DELIMITER $$
CREATE TRIGGER `insert _to_client` AFTER DELETE ON `deleted_client` FOR EACH ROW BEGIN
    INSERT INTO client (`client_id`, `name`, `nic`, `email`, `DOB`, `contact_number`, `address`, `password`, `registerd_datte`, `status`)
    VALUES (OLD.client_id, OLD.name, OLD.nic, OLD.email, OLD.DOB, OLD.contact_number, OLD.address, OLD.password, OLD.registerd_datte, 'Active');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_lawyers`
--

CREATE TABLE `deleted_lawyers` (
  `lawyer_id` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `deleted_lawyers`
--
DELIMITER $$
CREATE TRIGGER `record_deletion_trigger_to_lawyer` AFTER DELETE ON `deleted_lawyers` FOR EACH ROW BEGIN
    INSERT INTO lawyer (lawyer_id, title, name, email, category, contact_number, password, status)
    VALUES (OLD.lawyer_id, OLD.title, OLD.name, OLD.email, OLD.category, OLD.contact_number, OLD.password, 'Active');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inactive_users`
--

CREATE TABLE `inactive_users` (
  `user_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nic` varchar(10) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `contact_number` varchar(50) NOT NULL,
  `address` varchar(252) NOT NULL,
  `password` varchar(25) NOT NULL,
  `registerd_datte` date NOT NULL DEFAULT current_timestamp(),
  `role` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `otp_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inactive_users`
--

INSERT INTO `inactive_users` (`user_id`, `name`, `nic`, `email`, `contact_number`, `address`, `password`, `registerd_datte`, `role`, `status`, `otp`, `otp_expiration`) VALUES
('001', 'sadeee', '23232223', 'sadee@gmail.com', '23456786', 'dwdwdwwdwdwdw', '12345', '2023-08-06', 'client', 'Active', '11111', '2023-08-06 10:41:29'),
('CLT-0007', 'John', '24865', 'sadeeshathimira2000@gmail.com', '072904045258966', '3/15A,Gangarama Rd,Wewala ,Piliyandala', '3B3Ns4MDsXk8DDxD/Gr5BmRJQ', '2023-08-10', 'client', 'inactive', '675715', '2023-08-10 18:49:08'),
('CLT-0008', 'Vimukthi Saranaga', '123456789', 'sadeethimira1234@gmail.com', '0729040459', '3/15A,Gangarama Rd,Wewala ,Piliyandala', 'E0GKplvZgwjbsBpLZPAscHRaM', '2023-08-10', 'client', 'inactive', '347081', '2023-08-10 18:44:43'),
('CLT-0009', 'Ravindu Damith', '2000804796', 'Ravindu.ponnamperuma@gmail.com', '0764247208', 'wijaya', '/1E+La+37DE0/5ojSA2iSVpVd', '2023-08-10', 'client', 'active', '335751', '2023-08-10 18:38:19'),
('CLT-0010', 'John De', '1234567', 'sadeethimira1234@gmail.com', '0769871425', 'Colombo Sri lanka', '0RPuDzOlQTUu2y6LRhH+lEE1U', '2023-08-10', 'client', 'active', '347081', '2023-08-10 18:44:43'),
('CLT-0011', 'Thimira Sadeesha', '2000276014', 'sadeeshathimira2000@gmail.com', '0769371701', '228,\"sadeesha\",', '0YoSAhlHyZeiO7dkwutPBEY5c', '2023-08-10', 'admin', 'active', '675715', '2023-08-10 18:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `lawyer`
--

                                                                                                                 CREATE TABLE `lawyer` (
                                                                                                              `lawyer_id` varchar(50) NOT NULL,
                                                                                                              `title` varchar(50) NOT NULL,
                                                                                                              `name` varchar(50) NOT NULL,
                                                                                                              `email` varchar(50) NOT NULL,
                                                                                                              `category` varchar(50) NOT NULL,
                                                                                                              `contact_number` varchar(50) NOT NULL,
                                                                                                              `password` varchar(50) NOT NULL,
                                                                                                              `status` varchar(10) NOT NULL,
                                                                                                              `Available_Date` text DEFAULT NULL
                                                                                                             ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lawyer`
--

INSERT INTO `lawyer` (`lawyer_id`, `title`, `name`, `email`, `category`, `contact_number`, `password`, `status`, `Available_Date`) VALUES
                                                                                                                                       ('10', 'Paralegal', 'Olivia Lewis', 'olivia.lewis@example.com', 'Immigration Law', '7778889990', 'mypassword', 'Active', '2023-08-08 00:00:00'),
                                                                                                                                       ('11', 'Arbitrator', 'William Turner', 'william.turner@example.com', 'Corporate Law', '3334445556', 'securepass', 'Active', '2023-08-09 00:00:00'),
                                                                                                                                       ('12', 'Legal Consultant', 'Sophia Hernandez', 'sophia.hernandez@example.com', 'Family Law', '9990001112', 'pass123', 'Active', '2023-08-16 00:00:00'),
                                                                                                                                       ('13', 'Trial Lawyer', 'Ethan Clark', 'ethan.clark@example.com', 'Criminal Law', '2223334448', 'secretpass', 'Active', '2023-08-16 00:00:00'),
                                                                                                                                       ('14', 'Legal Analyst', 'Ava Roberts', 'ava.roberts@example.com', 'Corporate Law', '7778889992', 'mypassword', 'Block', '2023-08-17 00:00:00'),
                                                                                                                                       ('15', 'Legal Officer', 'Benjamin Thompson', 'benjamin.thompson@example.com', 'Intellectual Property Law', '1112223338', '12345678', 'Hold', '2023-08-14 00:00:00'),
                                                                                                                                       ('17', 'Legal Counselor', 'Henry Wilson', 'henry.wilson@example.com', 'Personal Injury Law', '9998887772', 'mysecretpass', 'Active', '2023-08-20 00:00:00'),
                                                                                                                                       ('18', 'Legal Advocate', 'Lily Anderson', 'lily.anderson@example.com', 'Tax Law', '3332221114', 'lawyerpass', 'Inactive', '2023-08-19 00:00:00'),
                                                                                                                                       ('21', 'Legal Specialist', 'James White', 'james.white@example.com', 'Employment Law', '7776665556', 'securepass', 'Active', '2023-08-24 00:00:00'),
                                                                                                                                       ('3', 'Advocate', 'David Johnson', 'david.johnson@example.com', 'Criminal Law', '5551234567', 'pass123', 'Hold', '2023-08-30 00:00:00'),
                                                                                                                                       ('4', 'Barrister', 'Sarah Williams', 'sarah.williams@example.com', 'Immigration Law', '9998887776', 'secretpass', 'Active', '2023-08-28 00:00:00'),
                                                                                                                                       ('5', 'Solicitor', 'Michael Brown', 'michael.brown@example.com', 'Intellectual Property Law', '1112223334', 'mypassword', 'Inactive', '2023-08-31 00:00:00'),
                                                                                                                                       ('6', 'Notary', 'Emily Davis', 'emily.davis@example.com', 'Real Estate Law', '7776665558', '12345678', 'Active', NULL),
                                                                                                                                       ('7', 'Prosecutor', 'Robert Taylor', 'robert.taylor@example.com', 'Personal Injury Law', '2223334442', 'passw0rd', 'Active', NULL),
                                                                                                                                       ('8', 'Jurist', 'Daniel Martinez', 'daniel.martinez@example.com', 'Tax Law', '8887776660', 'mysecretpass', 'Block', '2023-08-27 00:00:00'),
                                                                                                                                       ('9', 'Legal Advisor', 'Jessica Thompson', 'jessica.thompson@example.com', 'Employment Law', '4445556662', 'lawyerpass', 'Active', '2023-08-12 00:00:00'),
                                                                                                                                       ('LW01', 'Mr.', 'John Doe', 'john.doe@example.com', 'Corporate Law', '1234567890', 'password123', 'Inactive', '2023-08-31 00:00:00'),
                                                                                                                                       ('LW05', 'Dr', 'sadeee', 'sadee1@gmail.com', 'Family Law', '0118792481', '123456', 'Inactive', '2023-08-08 00:00:00'),
                                                                                                                                       ('LW13', 'Chamara', 'Galagedra', 'jane.smith@example.com', 'Family Law', '9876543210', '123345', 'Inactive', NULL);

--
-- Triggers `lawyer`
--
DELIMITER $$
CREATE TRIGGER `delete_from_user` AFTER DELETE ON `lawyer` FOR EACH ROW BEGIN
    DELETE FROM user WHERE user.user_id = OLD.lawyer_id;
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_user_from_lawyer` AFTER INSERT ON `lawyer` FOR EACH ROW BEGIN
    -- Insert into user table
    INSERT INTO user (user_id, name, role, password, status)
    VALUES (NEW.lawyer_id,NEW.name,'lawyer',NEW.password,'Active');
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `record_deletion_trigger` AFTER DELETE ON `lawyer` FOR EACH ROW BEGIN
    INSERT INTO deleted_lawyers (lawyer_id, title, name, email, category, contact_number, password, status)
    VALUES (OLD.lawyer_id, OLD.title, OLD.name, OLD.email, OLD.category, OLD.contact_number, OLD.password, OLD.status);
END
    $$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_user_lawyer` AFTER UPDATE ON `lawyer` FOR EACH ROW BEGIN
    UPDATE user
    SET name = NEW.name,
        role = 'lawyer',
        password = NEW.password,
        status = 'Active'
    WHERE user_id = NEW.lawyer_id;
END
    $$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `lawyer_availablility`
--

CREATE TABLE `lawyer_availablility` (
                                        `time_id` varchar(255) NOT NULL,
                                        `lawyer_id` varchar(50) DEFAULT NULL,
                                        `available_time` datetime DEFAULT NULL,
                                        `status` varchar(6) DEFAULT 'free'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lawyer_availablility`
--

INSERT INTO `lawyer_availablility` (`time_id`, `lawyer_id`, `available_time`, `status`) VALUES
                                                                                            ('1', '10', '2023-08-01 09:00:00', 'booked'),
                                                                                            ('2', '11', '2023-08-02 10:00:00', 'free'),
                                                                                            ('3', '13', '2023-08-03 11:00:00', 'booked'),
                                                                                            ('4', '14', '2023-08-04 18:00:00', 'free'),
                                                                                            ('5', '14', '2023-08-05 18:00:00', 'booked'),
                                                                                            ('6', '14', '2023-08-06 18:00:00', 'booked'),
                                                                                            ('7', '14', '2023-08-07 18:00:00', 'free');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
                           `payment_id` varchar(50) NOT NULL,
                           `client_id` varchar(50) NOT NULL,
                           `type` varchar(50) NOT NULL,
                           `date` varchar(50) NOT NULL,
                           `case_id` varchar(50) NOT NULL,
                           `lawyer_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
                        `user_id` varchar(50) NOT NULL,
                        `name` varchar(50) NOT NULL,
                        `role` varchar(50) NOT NULL,
                        `password` varchar(50) NOT NULL,
                        `Email` varchar(25) NOT NULL,
                        `status` varchar(50) NOT NULL,
                        `otp` varchar(10) DEFAULT NULL,
                        `otp_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `role`, `password`, `Email`, `status`, `otp`, `otp_expiration`) VALUES
                                                                                                           ('12345', 'bandara', 'lawyer', '12345', '', 'Active', NULL, NULL),
                                                                                                           ('Admin', 'xxxx', 'admin', '1111', 'sadeeshathimira2000@gmail', 'Active', '471117', '2023-08-09 18:44:35'),
                                                                                                           ('CLT-0003', 'Thimira Sadeesha', 'client', '1234', '', 'Active', NULL, NULL),
                                                                                                           ('CLT-0004', 'abcd', 'client', '2552', '', 'Active', NULL, NULL),
                                                                                                           ('CLT-0006', 'Admin', 'client', '2468', '', 'Active', NULL, NULL),
                                                                                                           ('E2046022', 'Kanishka_Bandara', 'client', 'admin@1234', '', 'Active', NULL, NULL),
                                                                                                           ('E2046315', 'Tharuka', 'client', 'admin@123', '', 'Active', NULL, NULL),
                                                                                                           ('LW05', 'sadeee', 'lawyer', '123456', '', 'Active', NULL, NULL),
                                                                                                           ('sdeelz', 'ddcd', 'client', '', '', 'Active', NULL, NULL),
                                                                                                           ('soori', 'Tharuka', 'client', 'soori', 'tharukaravisara@gmail.com', 'active', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`username`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
    ADD PRIMARY KEY (`Appointment_id`);

--
-- Indexes for table `assistant`
--
ALTER TABLE `assistant`
    ADD PRIMARY KEY (`assistant_id`),
  ADD KEY `lawyer_id` (`lawyer_id`);

--
-- Indexes for table `cases`
--
ALTER TABLE `cases`
    ADD PRIMARY KEY (`case_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `lawyer_id` (`lawyer_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
    ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `client_statement`
--
ALTER TABLE `client_statement`
    ADD PRIMARY KEY (`statement_id`);

--
-- Indexes for table `deleted_client`
--
ALTER TABLE `deleted_client`
    ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `deleted_lawyers`
--
ALTER TABLE `deleted_lawyers`
    ADD PRIMARY KEY (`lawyer_id`);

--
-- Indexes for table `inactive_users`
--
ALTER TABLE `inactive_users`
    ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `lawyer`
--
ALTER TABLE `lawyer`
    ADD PRIMARY KEY (`lawyer_id`);

--
-- Indexes for table `lawyer_availablility`
--
ALTER TABLE `lawyer_availablility`
    ADD PRIMARY KEY (`time_id`),
  ADD KEY `lawyer_id` (`lawyer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
    ADD PRIMARY KEY (`payment_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistant`
--
ALTER TABLE `assistant`
    ADD CONSTRAINT `assistant_ibfk_1` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyer` (`lawyer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cases`
--
ALTER TABLE `cases`
    ADD CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lawyer_availablility`
--
ALTER TABLE `lawyer_availablility`
    ADD CONSTRAINT `lawyer_availablility_ibfk_1` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyer` (`lawyer_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
    ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
