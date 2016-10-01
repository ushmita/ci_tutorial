-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 01, 2016 at 08:56 AM
-- Server version: 5.5.50-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ci_tutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `Articles`
--

CREATE TABLE IF NOT EXISTS `Articles` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL,
  `posted_date` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `article_id` (`article_id`),
  KEY `slug` (`slug`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Article Table' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `Articles`
--

INSERT INTO `Articles` (`article_id`, `title`, `slug`, `text`, `posted_date`, `user_id`) VALUES
(1, 'Barcelona Victory', 'barcelona-victory', 'MSN shines again for Barcelona. They Defeated Lagnes 5-1 clear victory. Congratulation FC Barcelona.', 1475012203, NULL),
(2, 'James and Benzama rescues Real Madrid', 'real-madrid', 'Real Madrid takes 3 point from away game agains Espanyol.', 1475012324, NULL),
(3, 'Nepal PM visits Delhi Yesterday', 'nepal-pm-visits-delhi-yesterday', 'Nepal Prime Minister, Puspa Kamal Dahal visits Delhi for 3 days.', 1475012335, NULL),
(4, 'Season of Kites', 'season-of-kites', 'Nepalese biggest festival Bijaya Dashami (Bada Dashain) is near. Flying kites on this occasion is very popular.', 1475012342, NULL),
(5, 'Big Data Technologies', 'big-data-technologies', 'Big data are those data sets with sizes beyond the ability of commonly used software to capture, curate, manage and process the data within a tolerable elapsed time.', 1475012351, NULL),
(6, 'Apache and .htaccess ', 'apache-and-htaccess', 'There are 3 steps to remove index.php\r\n\r\n1.Make below changes in application/config.php file\r\n\r\n$config[''base_url''] = ''http://''.$_SERVER[''SERVER_NAME''].''/Your Ci folder_name'';\r\n$config[''index_page''] = '''';\r\n$config[''uri_protocol''] = ''AUTO'';\r\n2.Make .htacces file in your root directory using below code\r\n\r\nRewriteEngine on\r\nRewriteCond $1 !^(index\\.php|resources|robots\\.txt)\r\nRewriteCond %{REQUEST_FILENAME} !-f\r\nRewriteCond %{REQUEST_FILENAME} !-d\r\nRewriteRule ^(.*)$ index.php/$1 [L,QSA]\r\n3.Enable rewrite mode (if your rewrite mode is not enabled)\r\n\r\ni. First, initiate it with the following command:\r\n\r\na2enmod rewrite\r\n\r\nii. Edit the file /etc/apache2/sites-enabled/000-default\r\n\r\nchange All AllowOverride None to AllowOverride All.\r\n\r\nNote : In latest version you need to change in /etc/apache2/apache2.conf file\r\n\r\niii. Restart your server with the following command:\r\n\r\nsudo /etc/init.d/apache2 restart', 1475012359, NULL),
(7, 'CodeIgniter PHP', 'codeigniter-php', 'CodeIgniter is an Application Development Framework - a toolkit - for people who build web sites using PHP. Its goal is to enable you to develop projects much faster than you could if you were writing code from scratch, by providing a rich set of libraries for commonly needed tasks, as well as a simple interface and logical structure to access these libraries. CodeIgniter lets you creatively focus on your project by minimizing the amount of code needed for a given task.\r\n\r\n', 1475012383, NULL),
(8, 'People on the Dance Floor', 'people-on-the-dance-floor', 'These days many teenager are seen in Disco bar. ', 1475012390, NULL),
(9, 'XSS Filtering', 'xss-filtering', 'CodeIgniter comes with a Cross Site Scripting prevention filter, which looks for commonly used techniques to trigger JavaScript or other types of code that attempt to hijack cookies or do other malicious things. If anything disallowed is encountered it is rendered safe by converting the data to character entities.', 1475012402, NULL),
(10, 'Namaste Nepal', 'namaste-nepal', 'Welcome to beautiful land of Nepal.', 1475012408, NULL),
(11, 'Truth about Life', 'truth-about-life', 'All about Life. Lets discuss this topic later.', 1475013631, NULL),
(12, 'Near to Ghatasthapana', 'near-to-ghatasthapana', 'Ghatasthapana is Near.', 1475134115, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `id` (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'cham11ng', '$2a$08$PTvDfXhEk8i6oczO72Y/iel8coUWYVXllkf4PmHoPgz82.GPjN6De', 'cham11ng@gmail.com');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Articles`
--
ALTER TABLE `Articles`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
