-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2011 at 01:12 AM
-- Server version: 5.5.10
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `default`
--

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE IF NOT EXISTS `follows` (
  `follower` char(20) NOT NULL,
  `followee` char(20) NOT NULL,
  PRIMARY KEY (`follower`,`followee`),
  KEY `followee` (`followee`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `follows`
--


-- --------------------------------------------------------

--
-- Table structure for table `followslist`
--

CREATE TABLE IF NOT EXISTS `followslist` (
  `LID` int(11) NOT NULL,
  `userID` char(20) NOT NULL,
  PRIMARY KEY (`LID`,`userID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `followslist`
--


-- --------------------------------------------------------

--
-- Table structure for table `hashes`
--

CREATE TABLE IF NOT EXISTS `hashes` (
  `word` char(50) NOT NULL,
  `TID` int(11) NOT NULL,
  PRIMARY KEY (`word`,`TID`),
  KEY `TID` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hashes`
--


-- --------------------------------------------------------

--
-- Table structure for table `hashtags`
--

CREATE TABLE IF NOT EXISTS `hashtags` (
  `word` char(50) NOT NULL,
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hashtags`
--


-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE IF NOT EXISTS `lists` (
  `ID` int(11) NOT NULL,
  `private` char(50) DEFAULT NULL,
  `creator` char(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `creator` (`creator`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lists`
--


-- --------------------------------------------------------

--
-- Table structure for table `mentions`
--

CREATE TABLE IF NOT EXISTS `mentions` (
  `TID` int(11) NOT NULL DEFAULT '0',
  `userID` char(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`TID`,`userID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentions`
--


-- --------------------------------------------------------

--
-- Table structure for table `messaged`
--

CREATE TABLE IF NOT EXISTS `messaged` (
  `MID` int(11) NOT NULL,
  `userID` char(20) NOT NULL,
  PRIMARY KEY (`MID`,`userID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messaged`
--


-- --------------------------------------------------------

--
-- Table structure for table `tweeted`
--

CREATE TABLE IF NOT EXISTS `tweeted` (
  `TID` int(11) NOT NULL,
  `userID` char(20) NOT NULL,
  PRIMARY KEY (`TID`,`userID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tweeted`
--

INSERT INTO `tweeted` (`TID`, `userID`) VALUES
(1, 'userA'),
(4, 'userA'),
(11, 'UserA'),
(13, 'userA'),
(14, 'userA'),
(15, 'userA'),
(16, 'userA'),
(17, 'userA'),
(18, 'userA'),
(19, 'userA'),
(2, 'userB'),
(5, 'userB');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE IF NOT EXISTS `tweets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `message` char(140) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`ID`, `private`, `message`) VALUES
(1, 0, 'hi there!'),
(2, 0, 'Sup d00d?'),
(4, 0, 'hello!'),
(5, 1, 'hey man'),
(6, 0, 'whats up?dds'),
(7, 0, 'hwdwd'),
(8, 0, 'hdwcs'),
(9, 0, 'hello world\r\n!'),
(11, 0, 'Hello WORLDSzzz!'),
(12, 0, 'NewONE!'),
(13, 0, 'wsadsadpppppppp'),
(14, 0, 'all'),
(15, 0, 'hows it goin?'),
(16, 0, 'my tweet?\r\n'),
(17, 0, 'new tewaets?\r\n'),
(18, 0, 'posting da tweats\r\nstuff'),
(19, 0, 'hello!');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `ID` char(20) NOT NULL,
  `first_name` char(50) DEFAULT NULL,
  `last_name` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `private` char(50) DEFAULT NULL,
  `lang` char(50) DEFAULT NULL,
  `bio` char(50) DEFAULT NULL,
  `location` char(50) DEFAULT NULL,
  `URL` char(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `first_name`, `last_name`, `email`, `private`, `lang`, `bio`, `location`, `URL`, `birthday`) VALUES
('userA', 'john', 'doe', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('userB', 'jake', 'jakerson', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`follower`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followee`) REFERENCES `users` (`ID`);

--
-- Constraints for table `followslist`
--
ALTER TABLE `followslist`
  ADD CONSTRAINT `followslist_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `lists` (`ID`),
  ADD CONSTRAINT `followslist_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `hashes`
--
ALTER TABLE `hashes`
  ADD CONSTRAINT `hashes_ibfk_1` FOREIGN KEY (`word`) REFERENCES `hashtags` (`word`),
  ADD CONSTRAINT `hashes_ibfk_2` FOREIGN KEY (`TID`) REFERENCES `tweets` (`ID`);

--
-- Constraints for table `lists`
--
ALTER TABLE `lists`
  ADD CONSTRAINT `lists_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`ID`);

--
-- Constraints for table `mentions`
--
ALTER TABLE `mentions`
  ADD CONSTRAINT `mentions_ibfk_1` FOREIGN KEY (`TID`) REFERENCES `tweets` (`ID`),
  ADD CONSTRAINT `mentions_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `messaged`
--
ALTER TABLE `messaged`
  ADD CONSTRAINT `messaged_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `tweets` (`ID`),
  ADD CONSTRAINT `messaged_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);

--
-- Constraints for table `tweeted`
--
ALTER TABLE `tweeted`
  ADD CONSTRAINT `tweeted_ibfk_1` FOREIGN KEY (`TID`) REFERENCES `tweets` (`ID`),
  ADD CONSTRAINT `tweeted_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`ID`);
