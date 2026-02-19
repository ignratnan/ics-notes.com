-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql307.infinityfree.com
-- Generation Time: Jan 01, 2026 at 09:47 PM
-- Server version: 11.4.9-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_35983749_icsnotes`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agent_type` varchar(255) NOT NULL,
  `business_source` varchar(255) DEFAULT NULL,
  `company_country` varchar(255) NOT NULL,
  `company_notes` text DEFAULT NULL,
  `edited_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `company_name`, `agent_type`, `business_source`, `company_country`, `company_notes`, `edited_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Global Travel Moments', 'TA', NULL, 'UK', NULL, '', '2023-02-21 17:26:52', '2023-02-21 17:26:52'),
(2, 1, 'Chic Locations', 'TO', NULL, 'UK', NULL, '', '2023-02-22 09:26:21', '2023-02-22 09:26:21'),
(3, 1, 'Cloud 10 Travel', 'TA', NULL, 'USA', NULL, '', '2023-02-22 09:30:04', '2023-02-22 09:30:04'),
(4, 1, 'Trips & Ships Luxury Travel', 'TA', NULL, 'USA', NULL, '', '2023-02-22 09:32:23', '2023-02-22 09:32:23'),
(5, 1, 'SSR Holiday', 'TO', NULL, 'India', NULL, '', '2023-02-22 09:40:11', '2023-02-22 09:40:11'),
(6, 1, 'Wish Viagens & Turismo', 'TA', NULL, 'Brazil', NULL, '', '2023-02-22 09:42:45', '2023-02-22 09:42:45'),
(7, 1, 'Con Questa', 'TO', NULL, 'Netherlands', NULL, '', '2023-02-22 09:46:33', '2023-02-22 09:46:33'),
(8, 1, 'Seamless Travel Agency', 'TA', NULL, 'USA', NULL, '', '2023-02-22 09:55:03', '2023-02-22 09:55:03'),
(9, 1, 'The Accomplished Traveller', 'TO - Virtuoso', NULL, 'USA', NULL, '', '2023-02-22 10:07:15', '2023-02-22 10:07:15'),
(10, 1, 'Eraso Travel', 'ON CHECK', NULL, 'USA', NULL, '', '2023-02-22 10:13:07', '2023-02-22 10:13:07'),
(11, 1, 'Avila Reizen', 'TO', 'ICS', 'Netherlands', 'https://www.avilareizen.nl', '5', '2023-02-22 10:17:52', '2024-06-25 03:51:42'),
(12, 1, 'Viajan Turismo & Expedicoes', 'ON CHECK', NULL, 'Brazil', NULL, '', '2023-02-22 10:20:10', '2023-02-22 10:20:10'),
(13, 1, 'Origin.me', 'TO', NULL, 'USA', NULL, '', '2023-02-22 10:23:04', '2023-02-22 10:23:04'),
(14, 1, 'Cookson Adventures', 'TO', NULL, 'UK', NULL, '', '2023-02-22 10:23:27', '2023-02-22 10:23:27'),
(15, 1, 'Stagings', 'TO', NULL, 'Latvia', NULL, '', '2023-02-22 10:23:46', '2023-02-22 10:23:46'),
(16, 1, 'Prana Travel Design', 'TO', NULL, 'Germany', NULL, '', '2023-02-22 10:24:11', '2023-02-22 10:24:11'),
(17, 1, 'Exotic Tour / Mistral Tour', 'ON CHECK', NULL, 'Italy', NULL, '', '2023-02-22 10:24:30', '2023-02-22 10:24:30'),
(18, 1, 'Ailes', 'TO', NULL, 'Switzerland', NULL, '', '2023-02-22 10:25:06', '2023-02-22 10:25:06'),
(20, 1, 'Embark Beyond (Virtuoso)', 'TA', NULL, 'USA', NULL, '', '2023-02-22 10:26:06', '2023-02-22 10:26:06'),
(21, 1, 'Born to Travel', 'TA', NULL, 'USA', NULL, '', '2023-02-22 10:26:31', '2023-02-22 10:26:31'),
(22, 1, 'Belo Viaja', 'TA', NULL, 'Mexico', NULL, '', '2023-02-22 10:27:00', '2023-02-22 10:27:00'),
(23, 1, 'Geographic Expeditions', 'TO', NULL, 'USA', NULL, '', '2023-02-22 10:27:37', '2023-02-22 10:27:37'),
(24, 1, 'Truffle Pig', 'TO', NULL, 'USA', NULL, '', '2023-02-22 10:27:57', '2023-02-22 10:27:57'),
(25, 1, 'Luxe & Nyx', 'TO', NULL, 'USA', NULL, '', '2023-02-22 10:28:18', '2023-02-22 10:28:18'),
(26, 1, 'The Passionist', 'TO', NULL, 'UK', NULL, '', '2023-02-22 10:28:42', '2023-02-22 10:28:42'),
(27, 1, 'Paveway Explores', 'TO', NULL, 'Singapore', NULL, '', '2023-02-22 10:29:11', '2023-02-22 10:29:11'),
(28, 1, 'Lisa Lindblad Travel Design', 'TA', NULL, 'USA', NULL, '', '2023-02-22 10:29:30', '2023-02-22 10:29:30'),
(29, 3, 'Adventum Travel', 'TO', 'ICS', 'AUS', NULL, '', '2023-02-22 10:29:50', '2024-06-04 17:47:55'),
(30, 1, 'Hello Word / Surrey Hills', 'TO', NULL, 'AUS', NULL, '', '2023-02-22 10:30:10', '2023-02-22 10:30:10'),
(31, 1, 'TRUVI', 'TO', NULL, 'Indonesia', NULL, '', '2023-02-22 10:30:34', '2023-02-22 10:30:34'),
(32, 1, 'Perez–Maldonado', 'TO - Virtuoso', NULL, 'Mexico', NULL, '', '2023-02-22 10:31:04', '2023-02-22 10:31:04'),
(33, 1, 'Panache World', 'TO', NULL, 'India', NULL, '', '2023-02-22 10:31:22', '2023-02-22 10:31:22'),
(34, 1, 'Chic Voyage', 'TO', NULL, 'Netherlands', NULL, '', '2023-02-22 10:31:43', '2023-02-22 10:31:43'),
(35, 1, 'Allure Travel', 'TO', NULL, 'AUS', NULL, '', '2023-02-22 10:32:01', '2023-02-22 10:32:01'),
(36, 1, 'Teranui by Tselana Travel', 'TO', NULL, 'France', NULL, '', '2023-02-22 10:32:17', '2023-02-22 10:32:17'),
(37, 1, 'Travel XL', 'TA', NULL, 'Netherlands', NULL, '', '2023-03-14 13:44:27', '2023-03-14 13:44:27'),
(38, 1, 'Pelikaan Travel Group', 'TA', NULL, 'Netherlands', NULL, '', '2023-03-14 13:44:58', '2023-03-14 13:44:58'),
(39, 1, 'Travel Boutique', 'TO', NULL, 'Netherlands', NULL, '', '2023-03-14 13:45:40', '2023-03-14 13:45:40'),
(40, 1, 'TOOKU (Anders Dan Anders)', 'TO', NULL, 'Belgium', NULL, '', '2023-03-14 13:46:26', '2023-03-14 13:46:26'),
(41, 1, 'Talisman', 'TO', NULL, 'Netherlands', NULL, '', '2023-03-14 13:46:46', '2023-03-14 13:46:46'),
(42, 1, 'Tico Reizen', 'TO', NULL, 'Netherlands', NULL, '', '2023-03-14 13:47:11', '2023-03-14 13:47:11'),
(43, 1, 'Zeppelin Reizen', 'TO', NULL, 'Belgium', NULL, '', '2023-03-14 13:56:03', '2023-03-14 13:58:56'),
(44, 1, 'GCS / Great Value Vacation', 'TO', NULL, 'USA', NULL, '', '2023-03-17 08:35:52', '2023-03-17 08:35:52'),
(45, 1, 'Lotus Travel', 'TO', NULL, 'Germany', NULL, '', '2023-03-17 08:36:37', '2023-03-17 08:36:37'),
(46, 3, 'Test edited', 'ON CHECK', 'ICS', 'Test', NULL, '', '2023-11-11 16:02:56', '2024-06-04 17:53:59'),
(47, 6, 'For Test Only', 'TA', NULL, 'Indonesia', NULL, '', '2023-11-14 12:37:02', '2023-11-14 12:37:02'),
(48, 5, 'Reisebüro Reischel', 'TA', NULL, 'Germany', NULL, '', '2023-11-14 21:30:46', '2023-11-14 21:30:46'),
(49, 5, 'Travel Department', 'TO', NULL, 'Ireland', NULL, '', '2023-11-14 21:51:45', '2023-11-14 21:51:45'),
(50, 5, 'GCS (Global Consolidated Services)', 'TO', NULL, 'USA', NULL, '', '2023-11-14 22:17:35', '2023-11-14 22:17:35'),
(51, 5, 'D-Reizen', 'TA', NULL, 'Netherlands', NULL, '', '2023-11-16 17:28:25', '2023-11-16 17:28:25'),
(52, 5, 'Intravelr', 'TO', NULL, 'UK', NULL, '', '2023-11-16 22:49:18', '2023-11-16 22:49:18'),
(53, 5, 'Times Travel', 'TO', NULL, 'UK', NULL, '', '2023-11-17 23:17:58', '2023-11-17 23:17:58'),
(54, 5, 'Tania Travel', 'TO', NULL, 'Lebanon', NULL, '', '2023-11-17 23:20:57', '2023-11-17 23:20:57'),
(55, 5, 'Transindus', 'TO', NULL, 'UK', NULL, '', '2023-11-22 21:45:44', '2023-11-22 21:45:44'),
(56, 5, 'Colibri Travel', 'TO', NULL, 'Germany', NULL, '', '2023-12-04 19:54:24', '2023-12-04 19:54:44'),
(59, 3, 'Test New Company', 'ON CHECK', 'RER', 'Indonesia', '<div>Test AA BB CC sassda edited</div>', '', '2024-05-08 18:08:31', '2024-06-04 17:47:30'),
(60, 5, 'Riksja Travel', 'TO', 'ICS', 'Netherlands', '<div><a href=\"https://www.riksjatravel.nl/\">https://www.riksjatravel.nl/</a><br><br>Group based in the Netherlands that incorporates 2 other TOs in UK (Rickshaw Travel) and Germany (Erlebe Reizen).&nbsp;<br>Works with Khiri Travel.&nbsp;<br>They know Thailand very well (not only the International Product Manager Birgit, but also Leonie (part of the sales team) who comes every year and Julia from Erlebe in Germany who lived in Chiang Mai for few years) are extremely high maintenance, requires a fully dedicated team in all departments. Probably around 10 staff for Thailand only. Complete game changer from a&nbsp; seasonality standpoint (balance business between seasons, increase production with suppliers during a season during which they are desperate for business etc.)&nbsp; as a huge majority of their clients come during summer holidays</div><div>(July &amp; August). It’s a very friendly &amp; passionate team. Great office in Leiden, very modern &amp; open minded&nbsp; Management.</div>', '', '2024-05-10 18:23:43', '2024-05-10 19:52:34'),
(61, 7, 'TravDek', 'TO', 'ICS', 'United States', '<div>&nbsp;With head-quartered in Silicon Valley (San Francisco), TravDek has 18 years experience.&nbsp; They are DMC for&nbsp; USA | UAE | EUROPE and ASIA including India, Bhutan, Nepal, Srilanka, Hongkong and Singapore for the moment&nbsp;<br>Contact person: SAndeep Talwar - CEO<br>E: Sandeep@TravDesk.com<br>T:+1.650.980.1963<br>M:+1 650.7594331<br>W: www.TravDek.com<br><br></div>', '', '2024-05-10 20:18:28', '2024-05-10 20:21:28'),
(62, 7, 'Discover Balkans', 'TA', 'ICS', 'Bulgaria', '<div>&nbsp;</div><h1>Bohemia is a DMC company that offers inbound and outbound tour operating for more than 30 years.&nbsp;</h1><h1>Bohemia has 30 own offices and branches located in Sofia, Skopje and other major cities in Bulgaria.&nbsp;<br>Contact person: Ph.D.Bayko Baykov&nbsp;<br>General Manager&nbsp;<br>Mobile: +359 888 52 82 62<br>Tel: +3592981 47 53<br>Email: manager@bohemia.bg<br>WWW.BOHEMIA.BG<br>Add: 6 Triaditsa st., 1000 Sofia, Bulgaria</h1><div><br></div>', '', '2024-05-10 20:28:00', '2024-05-10 20:28:00'),
(63, 7, 'Mission Nepal Holidays', 'TA', 'ICS', 'Nepal', '<div>&nbsp;Specialised in inbound and outbound tours. inbound tours cover Nepal and outbound tours cover Tibet, Bhutan, India and Dubai. They are an authorized ticketing agency.&nbsp;<br>Contact: Damodar Dhakal - Managing Director&nbsp;<br>M: +977 985 1019102<br>E: info@missionnepal.com&nbsp;<br>www.missionnelpal.com<br>Sukra Bhawan, Thanel Marg 26<br>44600 Kathmandu<br>Nepal&nbsp;</div>', '', '2024-05-10 20:31:22', '2024-05-10 20:31:22'),
(64, 7, 'Rate Hawk', 'ON CHECK', 'ICS', 'United Arab Emirates', '<div>It is an unrivalled online booking tool for travel professionals</div><div>We lead the way in accommodation: 2.5M+ hotels worldwide from 250+ suppliers, air tickets, transfers, car rentals, and other services.&nbsp; They are looking for partners to provide tour experiences<br>Contact: Victoria Vlasenko&nbsp;<br>Head of Business Development South Asia<br>E:victoria@ratehawk.com&nbsp;<br>Tel:+7926 699 30 68&nbsp;<br>W: https://www.ratehawk.com/lp/en/</div>', '', '2024-05-10 20:38:55', '2024-05-10 20:40:51'),
(65, 7, 'Tripsnstay', 'ON CHECK', 'ICS', 'Oman', '<div>&nbsp;tripsnstay” is a marketplace of non –air booking services in the B2B travel segment.&nbsp; They work with worldwide DMCs offering them access to the distribution of travel products to bring together a comprehensive system, providing tour operators and travel agents an easy interface that aggregates and distributes information of hotels , leisure packages , tours and transfers enabling global B2B clients to search and book online&nbsp;<br>Contact: Priya Vineeth<br>Manager - Product<br>Mob: +968 993 55891<br>E: v.priya@kr.om<br>www.tripsnstay.com</div>', '', '2024-05-10 20:44:37', '2024-05-10 20:44:37'),
(66, 7, 'Alfaris Travel', 'TA', 'ICS', 'Saudi Arabia', '<div>&nbsp;Alfaris is a DMC&nbsp; in the Kingdom of Saudi Arabia and also offering Education Abroad in US, UK, Canada and Capetown.<br>Contact: Hossam Nawar - Destinations Director&nbsp;<br>Phone: +966 56 569 1109<br>P.O Box 2430 Riyadh 12214 Kindom of Saudi Arabia&nbsp;<br>www.alfaristours.com</div>', '', '2024-05-10 20:50:42', '2024-05-10 20:53:08'),
(67, 5, 'Skinny Dip Travel', 'TA', 'RER', 'United States', 'www.skinnydiptravel.com', '5', '2024-06-13 01:20:09', '2024-06-23 08:50:27'),
(68, 5, 'Travel Hub 365', 'TA', 'RER', 'United States', 'globaltravelcollection.com', '5', '2024-06-13 01:21:48', '2024-06-23 08:57:19'),
(69, 5, 'NAO Travel Collection', 'TA', 'ICS', 'Mexico', '<div>www.naotravel.com<br><br>LIke sustainable products &amp; activities&nbsp;</div>', '5', '2024-06-13 02:09:41', '2024-06-23 08:59:04'),
(70, 5, 'Protravel', 'TA', 'RER', 'United States', '', '5', '2024-06-13 02:10:43', '2024-06-13 02:10:43'),
(71, 5, 'Mindful Journeys Luxury Travel', 'TA', 'ICS', 'United States', '', '5', '2024-06-13 02:11:09', '2024-06-13 02:11:09'),
(72, 5, 'Estia Travel (Attica Greece)', 'TA', 'ICS', 'Greece', '', '5', '2024-06-13 02:12:16', '2024-06-13 02:12:16'),
(73, 5, 'Mayamaya Travel', 'TA', 'ICS', 'United States', '', '5', '2024-06-13 02:14:38', '2024-06-13 02:14:38'),
(74, 5, 'Bagshaw Travel', 'TA', 'RER', 'United States', '', '5', '2024-06-13 02:15:08', '2024-06-13 02:15:08'),
(76, 5, 'Godwana Experiences', 'TA', 'ICS', 'Spain', '<div><a href=\"http://www.godwana.es\">http://www.godwana.es</a><br><br>official agent for Paris Olympics 2024<br>small boutique travel agent&nbsp;<br><br>expanding in Saudi and Mexico</div>', '5', '2024-06-13 02:16:43', '2024-06-27 22:19:43'),
(77, 5, 'Boutique Travel', 'TA', 'ICS', 'Lithuania', '<div><a href=\"https://boutiquetravel.lt\">https://boutiquetravel.lt</a><br><br>only 5 staff. operating for 16 years. mostly repeat clients. 5 stars mostly. boutique hotels, local vibe.&nbsp;<br><br>member of Belmond, Serendipians<br><br></div>', '5', '2024-06-13 02:17:12', '2024-06-28 00:46:15'),
(78, 5, 'Brickell Travel Management', 'TA', 'RER', 'United States', '<div><a href=\"https://www.brickelltravel.com/corporate\">https://www.brickelltravel.com/corporate</a><br><br>Brickell Travel Management is a market leader in the corporate travel management industry in South Florida. We believe that we are where personalized service meets the next generation of corporate travel. As a privately owned company, we have grown from a small operation to an emerging business travel industry leader with annual sales exceeding $85 million. We are committed to making executive travel simple and worry free by offering a complete one-stop corporate travel solution to our clients.</div>', '5', '2024-06-13 02:19:01', '2024-06-28 01:02:34'),
(80, 5, 'R T Travel of America', 'TA', 'ICS', 'United States', '', '5', '2024-06-13 03:28:21', '2024-06-13 03:28:21'),
(82, 5, 'Viallo (formerly known as Felgueres) ', 'TA', 'ICS', 'Mexico', '<div><a href=\"https://felgueres.tviajes.com\">https://felgueres.tviajes.com</a><br><br>Formerly known as Felgueres. Don\'t like too many tours in itineraries. Needs orientation tour in every destination at the beginning and leave the rest for optional unique experiences. we had one rq in 2022-23, one booking in 2023. Families, couple, honeymoon.&nbsp;</div>', '5', '2024-06-23 09:16:37', '2024-06-23 09:19:44'),
(83, 5, 'Explorateur Travel', 'TA', 'ICS', 'United States', '<div><a href=\"https://explorateurtravel.com\">https://explorateurtravel.com</a><br><br>20 independent contractors. will hire 10 more in 2024. Experiential travel. Very much relying on DMCs.&nbsp;</div>', '5', '2024-06-25 03:32:31', '2024-06-25 03:32:31'),
(84, 5, 'Mindful Journeys Travel', 'TA', 'ICS', 'United States', '<div><a href=\"http://www.mindfuljourneys.com\">http://www.mindfuljourneys.com</a><br><br>into transformative travel.&nbsp;</div>', '5', '2024-06-25 04:16:00', '2024-06-25 04:16:00'),
(85, 5, 'Kensington Tours', 'TO', 'ICS', 'Canada', '<div><a href=\"https://www.kensingtontours.com\">https://www.kensingtontours.com</a><br><br>Famous TO based in Toronto (main office), Montreal and Vancouver. Works with Khiri &amp; Easia in Thailand<br><br></div><blockquote><blockquote>Kensington is the biggest brand in the group (Trip Arc), but they have also Travel Edge, Ensemble and few others . In Thailand only, it its more than a million USD account / year… Tariff agent, tailor made, 5 stars hotels mostly. They have their own quoting system to which they upload tariffs sent by DMC. Consultants quote independently, so what we basically get from them is mostly bookings, plus some group requests from time to time. Like Avanti.They have 163 sales consultants (that they call Destination Experts (DE)). Minimum sales target per DE is 1 million USD per year.&nbsp;</blockquote></blockquote><div><br></div>', '5', '2024-06-26 22:28:38', '2024-06-27 13:15:08'),
(86, 5, 'Friendly Planet', 'TO', 'ICS', 'United States', '<div>https://www.friendlyplanet.com<br>Very long established TO in the US. Based in Philadelphia.<br>Does small group departures and FITS. <br><br>Our story begins almost 40 years ago. <a href=\"https://www.friendlyplanet.com/about/peggy-goldman.html\">Peggy Goldman</a> was a divorced schoolteacher with 2 small children. A serendipitous opportunity arose to organize a journey to Israel for 200 Holocaust survivors for a special event. With no experience in the travel industry, but a lot of gumption, Peggy rose to the challenge and somehow pulled it off. Encouraged by the success of this trip, and realizing the power of travel to transform lives, she founded Great Touring Adventures in 1981 with a staff of three. 14 years later, we became Friendly Planet Travel.</div><div><br>Today, we are a global tour operator offering authentic and affordable travel experiences to some of the most iconic and fascinating international destinations, including Asia, Africa, Central America, South America, Europe and the Middle East. We were one of the first U.S. companies licensed by the U.S. government to offer people-to-people travel experiences to Cuba. We were also one of the first tour operators to begin selling on the Internet (and boy, you should see our first website!). We\'re based in Jenkintown, Pennsylvania, a suburb of Philadelphia, but our customers are from all over the U.S., Canada, and beyond.</div>', '5', '2024-06-27 13:24:14', '2024-06-27 13:37:15'),
(87, 5, 'Goway', 'TO', 'ICS', 'Canada', '<div><a href=\"https://www.goway.com/about-us/contact-us\">https://www.goway.com/about-us/contact-us</a><br><br>TO based in Canada (Toronto, Vancouver), US (California), Australia and Philippines.&nbsp;<br><br>Goway Travel was founded in Toronto in 1970 by Bruce Hodge, a young Australian economist who moved to Canada to follow his dreams. He forged a passion for travel during a short stint as a tour guide in England.&nbsp;<br><br></div><div>Bruce worked evenings in a peanut butter factory to make cash flow and grew the company to promote European Camping Tours for 18 to 30-somethings, Adventures in Australia, and Overland Expeditions across Asia and Africa. By the late 70s, Goway had become a pioneer operator of overland camping tours across the Americas, providing “Young Adult Adventures.”&nbsp;<br><br></div><div>In the following decades, we have established ourselves as a global influence. While the travel industry endured major challenges, our strong foundations allowed Goway to forge ahead. We continually innovated, invested in new technology, and challenged the status quo. Bruce’s wife, son, and daughter have played key roles in our growth.&nbsp;<br><br></div><div>Our mission has always been to help our clients realize their travel dreams. We’ve listened as your travel styles and bucket lists have evolved, and you’ve become true Globetrotters. Today, we are an industry-leading, global travel company. We’re powered by a 600-person team utilizing cutting-edge technology. We traded camping tours for 4 and 5-star tailor-made travel experiences to over 100 countries around the world.&nbsp;</div>', '5', '2024-06-27 16:09:45', '2024-06-27 16:09:45'),
(88, 5, 'Worldstrides', 'TO', 'ICS', 'United States', '<div><a href=\"https://worldstrides.com\">https://worldstrides.com</a><br><br>TO based in the US, Australia and Canada, specialized in student trips (academic programs)<br><br>For over 55 years, we’ve pushed the limits of education to create programs that empower and inspire, partnering with learners of all ages to bridge cultures and break through boundaries. Innovation is how our company was born, how we’ve helped millions of students soar higher, and how we continue to create life-changing moments every day.</div>', '5', '2024-06-27 20:05:05', '2024-06-27 20:05:05'),
(89, 5, 'Estia Travel', 'TA', 'ICS', 'Greece', '<div><a href=\"http://www.estiatravel.gr\">http://www.estiatravel.gr</a><br><br>private jet, villas, yachts. FIT and corporate&nbsp;</div>', '5', '2024-06-27 21:25:25', '2024-06-27 21:25:25'),
(90, 5, 'Cassis Travel Services (CTS)', 'TA', 'RER', 'United States', '<div>100 staff.&nbsp;<br>based in California,&nbsp;<br>we had a 25K booking in Thailand in 2023<br>interested in TH, VN&nbsp;<br>yoga groups.&nbsp;</div>', '5', '2024-06-27 22:09:33', '2024-07-03 13:21:31'),
(91, 5, 'R T Travel of America', 'TA', 'ICS', 'United States', '<div><a href=\"https://www.rttravelofamerica.com\">https://www.rttravelofamerica.com</a><br><br>no Asia on their website. Very much Europe &amp; Africa focused. Also do inbound in Florida</div>', '5', '2024-06-28 01:30:21', '2024-06-28 01:30:21'),
(92, 5, 'Art of Travel', 'TA', 'ICS', 'Brazil', '<div><a href=\"https://artoftravel.com.br\">https://artoftravel.com.br</a><br><br>Serendipians. Based in Rio &amp; Miami.&nbsp;</div>', '5', '2024-06-28 14:12:59', '2024-06-28 14:12:59'),
(94, 5, 'Royal Travel', 'TA', 'RER', 'United States', '<div><a href=\"https://www.royal-travel.com\">https://www.royal-travel.com</a><br>ski experts<br>CEOs, / multigen families<br>Knows Lisa.</div>', '5', '2024-06-28 14:39:31', '2024-06-28 14:52:18'),
(95, 5, 'Valerie Wilson Travel', 'TA', 'RER', 'United States', '<div><a href=\"https://valeriewilsontravel.com\">https://valeriewilsontravel.com</a><br><br>In 1981, Valerie Ann Wilson was living in London with her young family. Like many expats, she wanted to take full advantage of her new address and quickly set about planning experiences across Europe. A consummate professional with a knack for details, Valerie sought a travel consultant who would approach travel planning the way she would—by providing unrivaled service with highly individualized attention. She never found one, so the unflappable Wilson took matters into her own hands and upon her return to the United States, she launched VWT. She opened her doors on September 8, 1981 in New York’s famed Pan Am Building. She started small, with just two full-time employees and one part-time bookkeeper. Her dedication to every last detail coupled with her growing rolodex of influential industry contacts made Valerie the go-to source for sophisticated travelers seeking one-of-a-kind experiences.<br><br>Fast-forward four decades and VWT is now one of the largest travel consulting firms in the United States. Headquartered in New York City, VWT now has 12 VWT has offices nationwide with a network of over 300 travel advisors and associate agents.<br><br></div><div>Expansion is not the only change that VWT has experienced. In the early years, VWT focused solely on personal travel, but today, VWT serves both leisure and corporate clients equally. Our corporate clients range from Fortune 500 companies with well-recognized brand names to boutique businesses in a wide range of industries.<br><br></div><div>VWT’s expansion has allowed for big-agency buying power, but we keep our ears to the ground and have remained nimble throughout the years. Whether it was creating a cruise department or hiring a staff of meeting and event planners to help our corporate clients deliver exceptional conferences and incentives, we have always adapted to meet clients’ ever-changing needs.<br><br></div><div>Valerie Wilson launched a legacy when she opened her doors in 1981, never knowing then that her two daughters, Jennifer Wilson-Buttigieg and Kimberly Wilson Wetty, would join her as Co-Presidents and the company, and her name, would be synonymous with quality</div>', '5', '2024-06-28 15:00:21', '2024-06-28 15:00:21'),
(96, 5, 'Nuba', 'TA', 'ICS', 'Mexico', '<div><a href=\"https://nuba.com\">https://nuba.com</a><br>Based in Mexico&nbsp;<br>more 4 stars<br><br>merged with ITG Mexico.&nbsp;</div>', '5', '2024-06-28 18:41:31', '2024-06-28 18:44:12'),
(97, 5, 'Contemplar Turismo', 'TA', 'ICS', 'Brazil', '<div><a href=\"http://www.contemplarturismo.com.br\">http://www.contemplarturismo.com.br</a><br><br>based in Rio. 7 travel consultants only. luxury a la carte. They love Asia</div>', '5', '2024-06-28 19:08:19', '2024-06-28 19:08:19'),
(98, 5, 'Otelle Travel', 'TA', 'ICS', 'Mexico', '<div>https://otelle.mx<br><br>In Mexico and US.&nbsp;</div>', '5', '2024-06-28 19:26:56', '2024-06-28 19:42:15'),
(99, 5, 'Be Part of the Journey', 'TA', 'RER', 'Peru', '<div><a href=\"https://www.bpjourney.com\">https://www.bpjourney.com</a><br><br>only 12 staff. launched in 2012.&nbsp;<br><br>had 1 booking per year since&nbsp; 2022 in Thailand.&nbsp;</div>', '5', '2024-06-28 20:03:30', '2024-06-28 20:05:41'),
(100, 5, 'CT Operadora', 'TO', 'ICS', 'Brazil', '<div><a href=\"https://ctoperadora.com.br\">https://ctoperadora.com.br</a><br><br><br></div>', '5', '2024-06-28 20:20:35', '2024-06-28 20:25:31'),
(101, 5, 'Global Travel Collection', 'TA', 'RER', 'United States', '<div><a href=\"https://www.globaltravelcollection.com\">https://www.globaltravelcollection.com</a><br><br>we had 1 booking in Thailand in 2023 via RER</div>', '5', '2024-06-28 20:41:26', '2024-06-28 20:41:26'),
(102, 5, 'Luxury Explorers', 'TA', 'ICS', 'United Arab Emirates', '<div><a href=\"https://luxuryexplorersme.com\">https://luxuryexplorersme.com</a><br><br>based in Dubai. VIPs and MICE</div>', '5', '2024-06-28 20:51:53', '2024-06-28 20:51:53'),
(103, 5, 'Epic Away Travel', 'TA', 'RER', 'United States', '<div><a href=\"http://www.epicaway.com\">http://www.epicaway.com</a><br><br>part of Uniglobe Travel Center.</div>', '5', '2024-06-28 21:03:30', '2024-06-28 21:03:30'),
(104, 5, 'Elefant Travel', 'TO', 'ICS', 'Spain', '<div><a href=\"https://www.elefant.com.es\">https://www.elefant.com.es</a><br><br>based in Spain &amp; Colombia</div>', '5', '2024-06-28 21:11:12', '2024-06-28 21:11:12'),
(105, 5, 'Untold Story Travel', 'TA', 'ICS', 'United Kingdom', '<div><a href=\"https://www.untoldstorytravel.com\">https://www.untoldstorytravel.com</a><br><br>clients from the UK and US. unique experiences. expert discretion and diplomacy.&nbsp;</div>', '5', '2024-06-28 21:18:37', '2024-06-28 21:18:37'),
(106, 5, 'Jonathan\'s Travels', 'TA', 'RER', 'United States', '<div><a href=\"https://www.jonathanstravels.us\">https://www.jonathanstravels.us</a><br><br>corporate travel, weddings, leisure luxury&nbsp;</div>', '5', '2024-06-28 21:29:54', '2024-06-28 21:29:54'),
(107, 5, 'Select Luxury Travel', 'TA', 'RER', 'United States', '<div><a href=\"https://www.selectluxurytravels.com\">https://www.selectluxurytravels.com</a><br><br>affiliate of Largay Travel</div>', '5', '2024-06-28 21:39:16', '2024-06-28 21:39:16'),
(108, 5, 'The Rich List', 'TA', 'ICS', 'United Kingdom', 'http://richlistgroup.com', '5', '2024-06-28 22:09:58', '2024-06-28 22:09:58'),
(109, 5, 'Travel By Shaiy', 'TA', 'ICS', 'United States', '<div><a href=\"https://www.travelbyshaiyllc.com\">https://www.travelbyshaiyllc.com</a><br><br>part of Travel Edge network&nbsp;<br><br></div>', '5', '2024-06-28 22:14:29', '2024-07-01 13:25:04'),
(110, 5, 'CTS (Corporate Travel Services)', 'TA', 'RER', 'Mexico', '<div><a href=\"http://www.cts.com.mx\">http://www.cts.com.mx</a><br>part of Signature Travel Network.&nbsp;<br>Via Leo&nbsp;</div>', '5', '2024-07-01 21:22:55', '2024-07-01 21:26:00'),
(111, 5, 'Brownell Travel', 'TA', 'RER', 'United States', '<div><a href=\"https://www.brownelltravel.com\">https://www.brownelltravel.com</a><br><br>part of Tzell.&nbsp;<br>got 1 rq end of 2023 from Paul.&nbsp;</div>', '5', '2024-07-01 21:43:50', '2024-07-01 21:43:50'),
(112, 5, 'Explorer Travel Services', 'TA', 'RER', 'United States', '<div><a href=\"http://explorerts.com/index.html\">http://explorerts.com/index.html</a><br><br>was part of the luxury TAT fam in January 2024 in Koh Samui.&nbsp;<br>Knows Paul &amp; Lisa well.&nbsp;<br><br></div>', '5', '2024-07-01 21:53:48', '2024-07-01 21:53:48'),
(113, 5, 'Worlds Away Travel', 'TA', 'RER', 'United States', '<div><a href=\"https://www.worldsawaytravel.com\">https://www.worldsawaytravel.com</a><br><br>knows Lisa. affiliate of Travel Edge.&nbsp;<br><br></div>', '5', '2024-07-01 22:04:51', '2024-07-01 22:04:51'),
(114, 5, 'Fernleaf fravel', 'TA', 'ICS', 'United States', '<div><a href=\"https://fernleaftravel.com\">https://www.fernleaftravel.com</a><br><br>affiliate of Largay Travel<br><br>weak in Asia, Japan mostly&nbsp;<br><br></div>', '5', '2024-07-01 23:13:01', '2024-07-01 23:13:01'),
(115, 5, 'Exquisite Travel Group', 'TA', 'ICS', 'United States', '<div>https://exquisitetravelgroup.com<br><br>had a rq for Japan. Concept \"baby moon\"!</div>', '5', '2024-07-01 23:25:05', '2024-07-01 23:25:54'),
(116, 5, 'Mundana Travel', 'TA', 'ICS', 'Mexico', '<div>https://www.mundanatravel.com<br><br>Traveller Made Member Agency.&nbsp;</div>', '5', '2024-07-01 23:38:12', '2024-07-01 23:40:35'),
(117, 5, 'Plaza Travel', 'TA', 'RER', 'United States', '<div><a href=\"https://www.plazatravel.com\">https://www.plazatravel.com</a><br><br>part of Signature. Frosch</div>', '5', '2024-07-02 01:05:57', '2024-07-02 01:05:57'),
(118, 5, 'Onirikos', 'TA', 'ICS', 'Italy', '', '5', '2024-07-02 01:16:00', '2024-07-02 01:16:00'),
(119, 5, 'Culturebrand Luxury Travel & Events', 'TA', 'ICS', 'Germany', '<div><a href=\"https://www.culturebrand.org\">https://www.culturebrand.org</a><br><br>works with Exo</div>', '5', '2024-07-02 01:30:47', '2024-07-02 01:30:47'),
(120, 5, 'Direct Travel', 'TA', 'RER', 'Canada', '<div><a href=\"https://www.dt.com\">https://www.dt.com</a><br><br>big travel agent network in Canada &amp; US. One of their sales were in the Luxury TAT fam in Koh Samui. big booking in 2024 in thailand.&nbsp;</div>', '5', '2024-07-02 01:43:11', '2024-07-02 01:43:11'),
(121, 5, 'Travelwise', 'TA', 'ICS', 'Dominican Republic', '<div><a href=\"https://travelwise.com.do\">https://travelwise.com.do</a><br><br>works with Exo, A&amp;K and TOI<br>have 100 staff, including 30 sales</div>', '5', '2024-07-02 14:12:22', '2024-07-02 14:48:45'),
(122, 5, 'SeaBreeze', 'TA', 'ICS', 'United States', '<div><a href=\"https://sbtravel.net\">https://sbtravel.net</a><br><br>part of Frosch.&nbsp;</div>', '5', '2024-07-02 14:28:28', '2024-07-02 14:28:28'),
(123, 5, 'Trip Whisperer', 'TA', 'ICS', 'United States', 'https://www.tripwhisperer.co', '5', '2024-07-02 14:34:37', '2024-07-02 14:34:37'),
(124, 5, 'BCD Travel', 'TO', 'ICS', 'Mexico', '<div><a href=\"https://www.bcdtravel.com\">https://www.bcdtravel.com</a><br><br>Huge MICE company<br>BCD Travel was founded on Jan. 3, 2006, when BCD Group announced its decision to purchase TQ3 Travel Solutions Management Holding GmbH and a majority interest in The Travel Company. These two companies were combined with WorldTravel BTI under one ownership to form BCD Travel. The company formally began trading under its new brand on March 31, 2006. BCD Travel has its global headquarters in Utrecht and regional headquarters in Atlanta, London and Singapore.</div>', '5', '2024-07-02 14:54:46', '2024-07-02 14:56:14'),
(125, 5, 'Tourcan Vacations', 'TO', 'ICS', 'Canada', '<div>working with ICS for 20 years. Very loyal.&nbsp;<br>based in Toronto</div>', '5', '2024-07-02 20:25:06', '2024-07-02 20:25:25'),
(126, 5, 'Travel Brands (Exotik)', 'TO', 'ICS', 'Canada', '<div>www.exotikjourneys.com<br>head office in Montreal but a lot of staff work remotely.&nbsp;<br>Main brand is Exotik Journeys. They are based everywhere in Canada and have a huge travel agents network.&nbsp;<br>main competitors are 5continents (David Boigné is an ex Travel brands staff) as they do also French and English speaking travelers.&nbsp;<br>they work with other DMC for the SIC part.&nbsp;</div>', '5', '2024-07-15 13:51:25', '2024-07-15 13:53:31'),
(127, 5, 'Travelworld', 'TO', 'ICS', 'Belgium', '<div>big TO in Belgium. Mostly english speaking with requests for French speaking sometimes.&nbsp;<br>FIT<br>Need to transform this account into a tariff agent.&nbsp;<br>in ICS Thailand top 10 agents in 2024. Huge increase YOY.&nbsp;<br>almost 1 request per day</div>', '5', '2024-10-18 19:06:38', '2024-10-18 19:06:38'),
(128, 5, 'Sunway', 'TO', 'RER', 'Ireland', '<div>http://www.sunway.ie/<br>famous TO in Ireland, specialized in flash deals package.&nbsp;</div>', '5', '2024-11-18 19:02:22', '2024-11-19 00:43:58'),
(129, 5, 'All about tailor made', 'TO', 'RER', 'United Kingdom', '<div><a href=\"http://www.allabouttailormadetravel.com/\"><strong>www.allabouttailormadetravel.com</strong></a><strong><br></strong><br></div>', '5', '2024-11-18 23:29:25', '2024-11-18 23:29:25'),
(130, 5, 'Flights And Packages', 'TO', 'RER', 'United Kingdom', '', '5', '2024-11-19 00:30:26', '2024-11-19 00:30:26'),
(131, 5, 'Unforgettable Travel Company', 'TO', 'RER', 'United Kingdom', '<div>small boutique TO. Works with Exo but find they are becoming too big. Turnaround time and creativity are the key with them<br>www.<a href=\"https://unforgettabletravel.com/\"><strong>unforgettabletravel.com</strong></a></div>', '5', '2024-11-22 01:28:20', '2024-11-22 01:28:20'),
(132, 5, 'Sirocco Luxury Travel', 'TO', 'RER', 'United Kingdom', '<div>Formerly Temple World, still managed by Alice Burns <br><a href=\"https://siroccoluxurytravel.com/\">https://siroccoluxurytravel.com/</a></div>', '5', '2024-11-29 02:54:28', '2024-11-29 02:54:28'),
(133, 6, 'THE FAMILY PROJECT GmbH & Co. KG', 'TO', 'ICS', 'Germany', '<div>Luxury Munich-based travel company specialized in high-end luxury family travel and multi-generational travel. We design unique, sustainable beach stays, cruises, safaris and tours that are tailored to the needs of discerning families.</div>', '6', '2024-11-29 21:38:46', '2024-11-30 18:02:19'),
(134, 5, 'Tropical Sky', 'TO', 'RER', 'United Kingdom', 'https://www.tropicalsky.co.uk', '5', '2024-11-30 02:08:16', '2024-11-30 02:08:16'),
(135, 11, 'Asian Escape', 'TO', 'ICS', 'Turkey', '', '11', '2024-12-16 18:54:00', '2024-12-16 18:54:00'),
(136, 5, 'Global Basecamps', 'TO', 'ICS', 'United States', '<div><a href=\"https://www.globalbasecamps.com\">https://www.globalbasecamps.com</a><br><br>San Diego based TO. Works with Khiri, tried DA but were dissapointed.&nbsp;<br><br>Selling Thailand with authentic experiences, 4 stars hotels (boutique, stylish)&nbsp;<br><br>PPD very similar to ICS Thailand average PPD (around 250 USD).&nbsp;<br>We already have 90% of their hotel contracts in Thailand</div>', '5', '2025-01-03 01:33:27', '2025-01-03 01:47:33'),
(137, 5, 'Contiki', 'TO', 'ICS', 'United States', '<div><a href=\"https://www.contiki.com\">https://www.contiki.com</a><br><br>Travel experiences (groups) for 18 - 35 years old travelers</div>', '5', '2025-01-03 01:54:46', '2025-01-03 01:54:46'),
(138, 5, 'Tauck', 'TO', 'ICS', 'United States', '<div>https://www.tauck.com<br><br>group series<br>works with Asia Concierge in Indonesia</div>', '5', '2025-01-07 02:09:02', '2025-01-07 02:12:22'),
(140, 11, 'Transformational Tours and Retreat ', 'TO', 'ICS', 'United States', '<div>Transformational Tours &amp; Retreats is a Travel company founded by Halle Eavelyn, who has been leading spiritual tours for over the years. The company specializes in creating transformative group travel experiences that combine vacation with personal growth, offering journeys to destinations such as Bali, Egypt, India, Kauai, Riviera Maya, and Peru.</div>', '11', '2025-02-04 18:43:15', '2025-02-04 18:43:15'),
(141, 5, 'Travel Answers Group', 'TO', 'ICS', 'United States', '', '5', '2025-02-19 20:36:45', '2025-02-19 20:36:45'),
(142, 5, 'Globus Family of Brands', 'TO', 'ICS', 'United States', '<div>located in the US (Denver), Canada, NZ, UK, India..<br>Includes Avalon Waterways (which we already handle for pre &amp; post cruise) as well as Globus and Cosmos</div>', '5', '2025-03-18 01:06:12', '2025-03-18 01:06:12'),
(143, 5, 'Hotelbook', 'TO', 'ICS', 'Russian Federation', '<div><a href=\"https://hbpro.expert/en/\">https://hbpro.expert/en/</a><br><br>Luxury TO in Moscow</div>', '5', '2025-03-18 17:50:18', '2025-03-18 17:50:18'),
(144, 7, 'Boutique Tours', 'TA', 'ICS', 'Germany', '<div>They have not sold Asia yet and are looking into possibilities to extend.</div>', '7', '2025-03-20 20:59:25', '2025-03-20 20:59:25'),
(145, 7, '54 Traveller', 'TA', 'ICS', 'China', '<div>Looking for DMC who can organize off the beaten track tours around Asia for group max 20 pax for Chinese tourists</div>', '7', '2025-03-20 21:14:42', '2025-03-20 21:14:42'),
(146, 7, 'Thailand Travel', 'TA', 'ICS', 'Switzerland', '<div>They are currently working with EXO</div>', '7', '2025-03-20 22:13:04', '2025-03-20 22:13:04'),
(147, 5, 'Promoséjours', 'TO', 'ICS', 'France', '<div>part of NG Travel (Next Generation Travel) along with Directours, Kappa Club, Club Corallia, Club Eldorador, Boomerang, CE Evasion. And more recently Jet tours. Huge French TO.&nbsp;</div>', '5', '2025-03-24 16:18:29', '2025-03-24 16:18:29'),
(148, 5, 'Podro Zesylvia', 'TO', 'ICS', 'Poland', '<div><a href=\"https://podrozesylvia.pl\">https://podrozesylvia.pl</a><br><br>TO in Poland that is looking for a DMC In Thailand</div>', '5', '2025-03-24 23:41:07', '2025-03-24 23:41:07'),
(149, 5, 'FET Reisen', 'TO', 'ICS', 'Germany', '<div>www.myfet.de</div>', '5', '2025-04-30 19:06:56', '2025-04-30 19:06:56'),
(150, 5, 'TCS World Travel', 'TO', 'ICS', 'United States', '<div>www.tcsworldtravel.com</div>', '5', '2025-06-05 01:05:14', '2025-06-05 01:05:14'),
(151, 5, 'Ker & Downey', 'TO', 'ICS', 'United States', '', '5', '2025-06-07 00:44:25', '2025-06-07 00:44:25'),
(152, 5, 'Mawa Collective', 'TO', 'ICS', 'United States', '<div>https://www.mawacollective.com/<br><br>he largest adventure company and travel group for Muslim women. In our first year alone, we’ve led<strong> 26+ group trips</strong>, welcoming over <strong>500 participants</strong> across the US, Canada, and internationally. Our trips consistently sell out within an hour, and we’ve organically grown a highly engaged Instagram community with <a href=\"https://www.instagram.com/mawa.collective/?hl=en\"><strong>45K+ followers</strong></a>.&nbsp;</div>', '5', '2025-06-07 00:53:51', '2025-06-07 00:53:51'),
(153, 5, 'Elect Lifestyle', 'TA', 'RER', 'United States', '<div>https://www.electlifestyle.com/<br><br>has client like Magic Johson and its family !</div>', '5', '2025-06-07 00:57:52', '2025-06-07 00:57:52'),
(154, 5, 'Pax Expeditions', 'TO', 'ICS', 'United States', '<div>https://paxexpeditions.com<br><br>PAX Expeditions was founded by Alison Ashton, a veteran adventure guide and expedition travel designer. From the jungles of Borneo to the canals of Burgundy, Alison has lived on four continents, traveled across six, and visited 36+ countries.<br><br></div><div>has Women only segment<br><br>PAX Expeditions was founded by Alison Ashton, a veteran adventure guide and expedition travel designer. From the jungles of Borneo to the canals of Burgundy, Alison has lived on four continents, traveled across six, and visited 36+ countries.<br><br></div><div>Women only&nbsp;<br><br></div><div><br><br></div>', '5', '2025-06-09 22:01:51', '2025-06-09 22:02:58'),
(155, 5, 'Natural Habitat Adventures', 'TO', 'ICS', 'United States', '<div>https://www.nathab.com<br><br><br></div>', '5', '2025-06-09 22:47:09', '2025-06-09 22:47:41'),
(156, 5, 'Road Scholar', 'TO', 'ICS', 'United States', '<div><a href=\"https://www.roadscholar.org\">https://www.roadscholar.org</a><br><br>50th annivbersary !<br><br></div><div><strong>4,000 LEARNING ADVENTURES</strong></div><div><strong>&nbsp;100+COUNTRIES</strong></div><div><strong>&nbsp;6 Million PARTICIPANTS AGE 50+</strong></div><div><strong>&nbsp;30%SOLO TRAVELERS</strong></div><div><strong>&nbsp;1975&nbsp;FOUNDED AS A NOT-FOR-PROFIT ORGANIZATION</strong></div>', '5', '2025-06-09 23:35:49', '2025-06-09 23:35:49'),
(157, 5, 'On Location Travel', 'TA', 'RER', 'United States', '<div><a href=\"https://onloctravel.com\">https://onloctravel.com</a><br><br>Part of Avenue Two</div>', '5', '2025-06-09 23:55:41', '2025-06-09 23:56:22'),
(158, 5, 'BSK Travel', 'TO', 'ICS', 'Italy', 'https://bsktravel.com', '5', '2025-06-10 00:13:16', '2025-06-10 00:13:16'),
(159, 5, 'Martins Soares', 'TO', 'ICS', 'Portugal', '<div><a href=\"https://www.martins-soares.com\">https://www.martins-soares.com</a><br><br>oldest tour operator in Portugal&nbsp;</div><div>speclialized in luxury&nbsp;</div>', '5', '2025-06-10 01:12:18', '2025-06-10 01:13:15'),
(160, 5, 'Cranky Concierge', 'TA', 'RER', 'United States', 'https://crankyconcierge.com', '5', '2025-06-10 01:23:13', '2025-06-10 01:23:13'),
(161, 5, 'Vertours', 'TO', 'ICS', 'Italy', 'https://www.vertours.com/home/vertours/', '5', '2025-06-10 01:27:28', '2025-06-10 01:27:28'),
(162, 5, 'CTS Collection', 'TO', 'RER', 'Mexico', '<div><a href=\"https://www.ctscollection.com\">https://www.ctscollection.com</a></div>', '5', '2025-06-10 04:17:53', '2025-06-10 04:17:53'),
(163, 5, 'Lura Lifestyle', 'TO', 'ICS', 'United Kingdom', 'https://www.luralifestyle.com', '5', '2025-06-10 04:52:40', '2025-06-10 04:52:40'),
(164, 5, 'Connoisseur Travel', 'TA', 'RER', 'United States', 'www.ctltd.com', '5', '2025-06-10 05:12:02', '2025-06-10 05:12:02'),
(165, 5, 'Cozy Travel', 'TA', 'RER', 'United States', 'https://www.cozytravel.co', '5', '2025-06-11 22:26:46', '2025-06-11 22:26:46'),
(166, 5, 'Shy Aviation', 'TA', 'ICS', 'United Kingdom', '<div><a href=\"https://www.shyaviation.com\">https://www.shyaviation.com</a><br><br><strong><em>global private aviation charter company</em></strong> with access to the finest aircraft on the market. Based in London, UK, with offices in Dubai.</div>', '5', '2025-06-12 00:13:46', '2025-06-12 00:13:46'),
(167, 5, 'World Wide Lux', 'TO', 'ICS', 'Italy', 'https://worldwidelux.com', '5', '2025-06-12 00:40:04', '2025-06-12 00:40:04'),
(168, 5, 'Hype Journeys', 'TA', 'RER', 'Mexico', 'https://hypejourneys.com', '5', '2025-06-12 00:51:46', '2025-06-12 00:51:46'),
(169, 5, 'Polaris Journeys', 'TO', 'ICS', 'Iceland', 'https://polarisjourneys.com', '5', '2025-06-12 00:58:40', '2025-06-12 00:58:40'),
(170, 5, 'Impressive Travels', 'TA', 'RER', 'United States', '<div><a href=\"https://www.impressivetravels.com\">https://www.impressivetravels.com</a></div>', '5', '2025-06-12 01:12:51', '2025-06-12 01:12:51'),
(171, 5, 'Travel Associates', 'TA', 'ICS', 'Australia', '<div><a href=\"https://www.travelassociates.com\">https://www.travelassociates.com</a><br><br>Virtuoso</div>', '5', '2025-06-12 21:39:38', '2025-06-12 21:40:05'),
(172, 5, 'Elli Travel Group', 'TA', 'RER', 'United States', '<div><a href=\"https://stablestravel.com\">https://stablestravel.com</a><br><br></div>', '5', '2025-06-12 22:22:47', '2025-06-12 22:22:47'),
(173, 5, 'Travel & Soul', 'TA', 'RER', 'Brazil', 'https://travelandsoul.com.br', '5', '2025-06-12 23:31:19', '2025-06-12 23:31:19'),
(174, 5, 'Private Travel Club', 'TO', 'ICS', 'Russian Federation', 'https://private-travel-club.com', '5', '2025-06-13 00:35:11', '2025-06-13 00:35:11'),
(175, 5, 'Get Out! Custom Travels', 'TA', 'RER', 'United States', 'https://www.getoutcustomtravels.com', '5', '2025-06-13 01:12:05', '2025-06-13 01:12:05'),
(176, 5, 'First In Services', 'TA', 'RER', 'United States', 'https://firstinservice.com', '5', '2025-06-13 01:15:34', '2025-06-13 01:15:34'),
(177, 5, 'Unigloble Travel', 'TO', 'ICS', 'Sweden', '<div>www.unigloble.se<br><br>MICE small and medium-sized businesses, has Bangok featured on their webiste<br>groups coroporate vacations (IT corporate) up to 50 pax. 3 days BKK</div>', '5', '2025-11-01 04:24:05', '2025-11-01 04:24:05'),
(178, 5, 'Lars Madland Reiser', 'TO', 'ICS', 'Norway', '<div>www.larsmadlandreiser.no<br>groups, FITS, package to Japan, currenlty developping SEA<br>Set dates. Starting with groups. Unhpapy with its current DMC. like Long stays&nbsp;</div>', '5', '2025-11-01 04:54:59', '2025-11-01 04:54:59'),
(179, 5, 'Helen\'s Journeys', 'TA', 'ICS', 'Finland', '<div>www.helensjourneys.fi<br><br>works via TO (and looking for one). but can do direct. Works with the Pimalai a lot.&nbsp;</div>', '5', '2025-11-01 05:14:08', '2025-11-01 05:14:08'),
(180, 5, 'Orient Tours', 'TO', 'ICS', 'Sweden', '<div>www.orienttours.se<br>FIT, high end</div>', '5', '2025-11-01 05:28:37', '2025-11-01 05:28:37'),
(181, 5, 'Risskov Rejser', 'TO', 'ICS', 'Denmark', '', '5', '2025-11-01 06:13:14', '2025-11-01 06:13:14'),
(182, 5, 'Antario Travel', 'TO', 'ICS', 'Latvia', '<div>www.antario.lv<br><br>mostly tailor made FIT, luxury, families</div>', '5', '2025-11-01 06:26:52', '2025-11-01 06:26:52'),
(183, 5, 'Mr Travel', 'TA', 'ICS', 'Finland', '<div>www.mrtravel.fi<br>part of Serendipians</div>', '5', '2025-11-01 06:37:34', '2025-11-01 06:37:34'),
(184, 5, 'Profil Rejser', 'TO', 'ICS', 'Denmark', '<div>www.profilrejser.dk<br><br>luxury , wellness, sustainability , all year round. Work with DTH everywhere</div>', '5', '2025-11-01 06:47:58', '2025-11-01 06:47:58'),
(185, 5, 'Drommerejser', 'TO', 'ICS', 'Denmark', '<div>www.drommerejser.dk<br><br>do a lot of island hopping. interested in Koh Phayam&nbsp;</div>', '5', '2025-11-01 06:55:02', '2025-11-01 06:55:02'),
(186, 5, 'Travisto', 'TO', 'ICS', 'Sweden', '<div>www.travisto.se<br><br>They MICE, tailor made FIT, luxury&nbsp;<br>works with TOI&nbsp;<br><br></div>', '5', '2025-11-04 12:40:33', '2025-11-04 12:40:33'),
(187, 5, 'Travel Zmart', 'TO', 'ICS', 'Sweden', '<div>F1 trip, ABBA live in london, Ski trips, football trips, no Asia, MICE.&nbsp;<br><a href=\"https://travelzmart.se/\">https://travelzmart.se/</a></div>', '5', '2025-11-04 13:04:49', '2025-11-04 13:04:49'),
(188, 5, 'Le Voyagiste du Québec', 'TA', 'ICS', 'Canada', '<div><a href=\"https://levoyagistedequebec.com\">https://levoyagistedequebec.com</a><br><br>doing series from Quebec. They have a TV show with potentially 500K watching</div>', '5', '2025-11-13 02:20:42', '2025-11-13 02:20:42'),
(189, 5, 'Indus Experiences', 'TO', 'RER', 'United Kingdom', '<div>https://www.indusexperiences.co.uk<br><br>Very experiences focus TO. Perfect for ICS</div>', '5', '2025-11-13 19:49:17', '2025-11-13 19:49:45'),
(190, 5, 'Southall Travel', 'TO', 'RER', 'United Kingdom', 'https://www.southalltravel.co.uk', '5', '2025-11-13 23:19:33', '2025-11-13 23:19:33'),
(191, 5, 'Titan Travel', 'TO', 'RER', 'United Kingdom', '<div><a href=\"https://www.titantravel.co.uk/\">https://www.titantravel.co.uk/</a><br><br>Titan was acquired by Saga in 2009. More experiential than Saga</div>', '5', '2025-11-14 18:29:50', '2025-11-14 18:29:50'),
(192, 5, 'Celgas Travels and Tours', 'TO', 'ICS', 'Nigeria', '<div><a href=\"https://www.celgastravelsandtours.com/\">https://www.celgastravelsandtours.com/</a><br><br>Corporate &amp; families (as extensions for corporate groups)<br>has a UK office</div>', '5', '2025-11-14 22:26:31', '2025-11-14 22:48:58'),
(193, 5, 'Mardis Travels and Tours (MTT)', 'TO', 'ICS', 'Nigeria', 'https://www.instagram.com/mardistravels/?hl=en', '5', '2025-11-14 22:48:44', '2025-11-14 22:48:44'),
(194, 5, 'Viktors Farmor', 'TO', 'ICS', 'Denmark', '<div><a href=\"https://www.viktorsfarmor.dk\">https://www.viktorsfarmor.dk</a><br><br>do things a bit differently, no beaches</div>', '5', '2025-11-17 20:03:46', '2025-11-17 20:03:46'),
(195, 5, 'Armenia Holidays', 'TO', 'ICS', 'Armenia', '<div><a href=\"https://armeniaholidays.com/en/tour-by-category/9\">https://armeniaholidays.com</a>/<br><br>groups from Armenia</div>', '5', '2025-11-17 22:41:19', '2025-11-17 22:41:19'),
(196, 5, 'Telco Travel', 'TO', 'ICS', 'Lebanon', 'https://www.facebook.com/telcotravel/?locale=th_TH', '5', '2025-11-17 23:10:45', '2025-11-17 23:10:45'),
(197, 5, 'Travelbag', 'TO', 'RER', 'United Kingdom', '<div><a href=\"https://www.travelbag.co.uk/\">https://www.travelbag.co.uk/</a><br><br>part of Dnata group but this brand is for sale</div>', '5', '2025-11-18 01:22:28', '2025-11-18 01:22:28'),
(198, 5, 'Platinum Concierge', 'TO', 'ICS', 'United Kingdom', 'http://www.vipplatinum-club.com/', '5', '2025-11-18 01:33:00', '2025-11-18 01:33:00'),
(199, 5, 'Major Travel', 'TO', 'RER', 'United Kingdom', '<div>https://www.major.travel/tours.php<br><br><br></div>', '5', '2025-11-20 02:11:09', '2025-11-20 02:11:09');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `contact_gender` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `edited_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `company_id`, `contact_gender`, `first_name`, `last_name`, `title`, `phone_number`, `email`, `edited_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Duncan Greenfield-Turk', NULL, 'Chief Curator', NULL, 'duncan@globaltravelmoments.com', '', '2023-02-21 17:27:31', '2023-02-21 17:27:31'),
(2, 1, 2, NULL, 'David Kevan', NULL, 'Partner & Product Person', NULL, 'david@chiclocations.com', '', '2023-02-22 09:26:49', '2023-02-22 09:26:49'),
(3, 1, 3, NULL, 'Alyson Nash', NULL, 'Founder', NULL, 'alyson@cloud10travel.com', '', '2023-02-22 09:30:27', '2023-02-22 09:30:27'),
(4, 1, 4, NULL, 'Angela Hughes', NULL, 'Owner', NULL, 'sales@tripsandships.com', '', '2023-02-22 09:32:53', '2023-02-22 09:32:53'),
(5, 1, 5, NULL, 'Sapnael Rao', NULL, 'Founder', NULL, 'sapnael@ssrholidays.in', '', '2023-02-22 09:40:56', '2023-02-22 09:40:56'),
(6, 1, 6, NULL, 'Juliana Vivieros', NULL, '-', NULL, 'juliana@wishturismo.com.br', '', '2023-02-22 09:43:30', '2023-02-22 09:43:30'),
(7, 1, 7, NULL, 'Lesley Klavert', NULL, 'Lifestyle Manager', NULL, 'lesley@con-questa.com', '', '2023-02-22 09:47:04', '2023-02-22 09:47:04'),
(8, 1, 8, NULL, 'Anthea Gilchrist', NULL, 'Luxury Travel Designer', NULL, 'anthea@seamlesstravelagency.com', '', '2023-02-22 09:55:35', '2023-02-22 09:55:35'),
(9, 1, 9, NULL, 'Blaine Horton', NULL, 'Director of Leisure Travel', NULL, 'blaine@theaccomplishedtraveler.com', '', '2023-02-22 10:07:48', '2023-02-22 10:07:48'),
(10, 1, 9, NULL, 'Jason C Miller', NULL, 'Founder / CEO', NULL, 'jason@theaccomplishedtraveler.com', '', '2023-02-22 10:08:28', '2023-02-22 10:08:28'),
(11, 1, 10, NULL, 'Jim Eraso', NULL, 'Founder', NULL, 'jim@jimerasotravel.com', '', '2023-02-22 10:13:50', '2023-02-22 10:13:50'),
(12, 1, 11, NULL, 'Tim van der Wel', NULL, 'Founder', NULL, 'tim@avilareizen.nl', '', '2023-02-22 10:18:20', '2023-02-22 10:18:20'),
(13, 1, 12, NULL, 'Jan Neumark', NULL, 'Founder', NULL, 'jan@viajan.com.br', '', '2023-02-22 10:20:43', '2023-02-22 10:20:43'),
(14, 1, 13, NULL, 'Federici Botta Aramburu', NULL, 'Travel Operations Manager', NULL, 'federico@origin.me', '', '2023-02-22 10:33:11', '2023-02-22 10:33:11'),
(15, 1, 14, NULL, 'William Siddeley', NULL, 'Senior Concept Designer', NULL, 'will@cooksonadventures.com', '', '2023-02-22 10:34:02', '2023-02-22 10:34:02'),
(16, 1, 15, NULL, 'Anna Locika', NULL, 'Travel Consultant', NULL, 'anna.locika@stagings.com', '', '2023-02-22 10:34:35', '2023-02-22 10:34:35'),
(17, 1, 16, NULL, 'Stephanie Syiemlieh', NULL, 'Founder', NULL, 's.syiemlieh@pranatraveldesign.de', '', '2023-02-22 10:35:02', '2023-02-22 10:35:02'),
(18, 1, 17, NULL, 'Diego Firenze', NULL, 'General Manager', NULL, 'diego.firenze@exotictour.it', '', '2023-02-22 10:36:57', '2023-02-22 10:39:51'),
(19, 1, 18, NULL, 'Manuel Chablais', NULL, 'Director / Owner', NULL, 'no@email', '', '2023-02-22 10:38:02', '2023-02-22 10:38:02'),
(20, 1, 19, NULL, 'Anna Gilbert', NULL, 'Senior VP Sales & Partnerships', NULL, 'anna@travel6degrees.com', '', '2023-02-22 10:39:04', '2023-02-22 10:39:04'),
(21, 1, 20, NULL, 'Julie Banning', NULL, 'Luxury Travel Advisor', NULL, 'julie@embarkbeyond.com', '', '2023-02-22 10:39:35', '2023-02-22 10:39:35'),
(22, 1, 21, NULL, 'Hope J. Smith', NULL, 'Travel Connoisseur', NULL, 'hope@born2travel.com', '', '2023-02-22 10:40:32', '2023-02-22 10:40:32'),
(23, 1, 22, NULL, 'Joana Bautista', NULL, 'Operations Manager', NULL, 'joana@beloviaje.com', '', '2023-02-22 10:41:14', '2023-02-22 10:41:14'),
(24, 1, 23, NULL, 'Tina Liadis', NULL, 'Director, Global sales (USA)', NULL, 'tina@geox.com', '', '2023-02-22 10:41:51', '2023-02-22 10:41:51'),
(25, 1, 23, NULL, 'Charlie Lockwood', NULL, 'Director, Global sales (UK)', NULL, 'charlie@geox.com', '', '2023-02-22 10:42:21', '2023-02-22 10:42:21'),
(26, 1, 24, NULL, 'Anthony Weersing', NULL, 'Trip Planner', NULL, 'anthony@trufflepig.com', '', '2023-02-22 10:43:01', '2023-02-22 10:43:01'),
(27, 1, 25, NULL, 'Katie Parris Griffin', NULL, 'Founder & Chief Designer', NULL, 'katie@luxeandnyx.com', '', '2023-02-22 10:43:42', '2023-02-22 10:43:42'),
(28, 1, 26, NULL, 'Rene Roseburg', NULL, 'Managing Director / Owner', NULL, 'rene@thepassionist.de', '', '2023-02-22 10:44:35', '2023-02-22 10:44:35'),
(29, 1, 27, NULL, 'Thomas NG', NULL, 'Managing Director', NULL, 'thomas@pavewayexplorer.com', '', '2023-02-22 10:45:18', '2023-02-22 10:45:18'),
(30, 1, 28, NULL, 'Hannah Sari', NULL, '-', NULL, 'hannah@lisalindblad.com', '', '2023-02-22 10:45:46', '2023-02-22 10:45:46'),
(31, 1, 29, NULL, 'Michelle Slack-Smith', NULL, 'Director', NULL, 'michelle@adventumtravel.com.au', '', '2023-02-22 10:46:23', '2023-02-22 10:46:23'),
(32, 1, 30, NULL, 'Debra Carr', NULL, 'Director / Travel Desinger', NULL, 'surreyhills@helloworld.com', '', '2023-02-22 10:46:54', '2023-02-22 10:46:54'),
(33, 1, 31, NULL, 'Kevin Hartanto', NULL, 'Founder & CEO', NULL, 'no@email', '', '2023-02-22 10:47:27', '2023-02-22 10:47:27'),
(34, 1, 32, NULL, 'Paulina Muñoz Licon', NULL, '-', NULL, 'paulina.munoz@perezmaldonado.com', '', '2023-02-22 10:47:57', '2023-02-22 10:47:57'),
(35, 1, 33, NULL, 'Sanjar Imam', NULL, 'Founder / Director', NULL, 'sanjar@panacheworld.com', '', '2023-02-22 10:48:43', '2023-02-22 10:48:43'),
(36, 1, 34, NULL, 'Minette Scheffers', NULL, 'Owner', NULL, 'minette@chicvoyage.nl', '', '2023-02-22 10:49:23', '2023-02-22 10:49:23'),
(37, 1, 35, NULL, 'Janine Bubb', NULL, 'Travel Advisor', NULL, 'Janine.bubb@alluretravel.com.au', '', '2023-02-22 10:49:58', '2023-02-22 10:49:58'),
(38, 1, 36, NULL, 'Aimee Bon-Hecker', NULL, 'Managing Director & Travel Designer', NULL, 'abonhecker@teranui.com', '', '2023-02-22 10:51:16', '2023-02-22 10:51:16'),
(39, 1, 38, NULL, 'Bert Thijsen', NULL, 'Commercial & Operational Director', NULL, 'b.thijsen@pelikaantravelgroup.com', '', '2023-03-14 13:51:39', '2023-03-14 13:51:39'),
(40, 1, 40, NULL, 'Gwendoline de Bruycker', NULL, 'Sales Manager', NULL, 'gwendoline@master-tours.com', '', '2023-03-14 13:52:53', '2023-03-14 13:52:53'),
(41, 1, 40, NULL, 'Nicky Baert', NULL, 'Product Manager', '+32485386855', 'nicky@master-tours.com', '', '2023-03-14 13:53:48', '2023-03-14 13:53:48'),
(42, 1, 41, NULL, 'Don Haagh', NULL, 'Owner', NULL, 'dhaagh@talisman.nl', '', '2023-03-14 13:55:22', '2023-03-14 13:55:22'),
(43, 1, 42, NULL, 'Charissa Martens', NULL, 'Director', NULL, 'charissa@tico.nl', '', '2023-03-14 13:58:02', '2023-03-14 13:58:02'),
(44, 1, 43, NULL, 'Jessie Oosterlynck', NULL, 'Owner', NULL, 'info@zeppelinreizen.be', '', '2023-03-14 14:00:53', '2023-03-14 14:00:53'),
(45, 1, 39, NULL, 'Debby Snelders', NULL, 'Owner', NULL, 'Debby@travelboutique.nl', '', '2023-03-14 14:20:54', '2023-03-14 14:20:54'),
(46, 1, 37, NULL, 'Peter van Limburg', NULL, 'Director', NULL, 'p.vanlimburg@travelxl.nl', '', '2023-03-14 14:25:32', '2023-03-14 14:25:32'),
(47, 1, 44, NULL, 'Alexandra Falbo', NULL, 'Product Development Manager', NULL, 'afalbo@gcs-ltd.com', '', '2023-03-17 08:39:06', '2023-03-17 08:39:06'),
(48, 1, 45, NULL, 'Elisabeth Beyrich', NULL, 'Lotus Travel', NULL, 'elisabeth.beyrich@lotus-travel.com', '', '2023-03-17 08:43:23', '2023-03-17 08:43:23'),
(51, 6, 47, NULL, 'For Test Contact', NULL, 'Director', '085000111222', 'test@only.com', '', '2023-11-14 12:38:10', '2023-11-14 12:38:10'),
(52, 5, 45, NULL, 'Susanne Rohrschneider', NULL, 'Sales Manager', '+49 (0)89 29 29 899 - 0', 'susanne.rohrschneider@lotus-travel.com', '', '2023-11-14 16:24:49', '2023-11-14 16:24:49'),
(53, 5, 45, NULL, 'Alkinoos Mergianos', NULL, 'Senior Sales Manager', '+49 (0)89 20 20 899 - 0', 'alkinoos.mergianos@lotus-travel.com', '', '2023-11-14 16:26:08', '2023-11-14 16:26:08'),
(54, 5, 48, NULL, 'Harald Reischel', NULL, 'CEO', '+49 851 988830', 'harald@reischel.de', '', '2023-11-14 21:31:58', '2023-11-14 21:31:58'),
(55, 5, 49, NULL, 'Sara Zimmerman', NULL, 'CEO', '+353 1 637 1600', 'saraz@traveldepartment.ie', '', '2023-11-14 22:03:28', '2023-11-14 22:03:28'),
(56, 5, 50, NULL, 'Alexandra Falbo', NULL, 'Product Development Manager', '+1 516 881 3268', 'afalbo@gcs-ltd.com', '', '2023-11-15 14:46:45', '2023-11-15 14:46:45'),
(57, 5, 50, NULL, 'Laura DeMaio', NULL, 'Director, Supplier Relations & Product Development', '+1 516 881 3333', 'ldemaio@gcs-ltd.com', '', '2023-11-15 14:48:56', '2023-11-15 14:48:56'),
(58, 5, 51, NULL, 'Jutta Van Peer', NULL, 'Director Contracting & Partnerships Suppliers', '+31 (0) 6 820 826 69', 'jutta.vanpeer@prijsvrij.nl', '', '2023-11-16 17:35:45', '2023-11-16 17:35:45'),
(59, 5, 51, NULL, 'Dominique Giese', NULL, 'Product Specialist', 'N/A', 'dgiese@d-reizen.nl', '', '2023-11-16 17:37:30', '2023-11-16 17:37:30'),
(60, 5, 52, NULL, 'Martin Lomax', NULL, 'Managing Director / UK Country Director', 'N/A', 'Martin@intravelr.com', '', '2023-11-16 22:50:37', '2023-11-16 22:50:37'),
(61, 5, 53, NULL, 'Zee Khalid', NULL, 'Managing Director', '+44 207 447 5000', 'zee@timestravel.com', '', '2023-11-17 23:18:49', '2023-11-17 23:18:49'),
(62, 5, 55, NULL, 'Amrit Singh', NULL, 'Managing Director', '-', 'amrit@transindus.com', '', '2023-11-22 21:47:19', '2023-11-22 21:47:19'),
(63, 5, 55, NULL, 'Hari Daggubaty', NULL, 'Global Sales Manager', '+44 (0)20 8', 'hari@transindus.com', '', '2023-11-22 21:48:14', '2023-11-22 21:48:14'),
(64, 5, 56, NULL, 'Matthias Ruch', NULL, 'Managing Director', '+49 15172502501', 'm.ruch@colibri-travel.de', '', '2023-12-04 19:59:31', '2023-12-04 19:59:31'),
(66, 5, 60, 'Mrs.', 'Birgit', 'Theijssen', 'International Product Manager', '', 'birgit.theijssen@riksjatravel.nl', '', '2024-05-10 18:29:11', '2024-05-10 18:29:11'),
(67, 5, 67, 'Mrs.', 'Kylie', 'Osmundson', 'Travel Designer', '6122714645', 'skinnydiptravel@gmail.com', '', '2024-06-20 02:32:20', '2024-06-23 08:37:41'),
(68, 5, 68, 'Mrs.', 'Katherine', 'Scott', 'Corporate and Entertainment Travel Advisor', '3128954607', 'Katherine.Scott@protravelinc.com', '', '2024-06-23 08:45:32', '2024-06-23 08:45:32'),
(69, 5, 69, 'Mrs.', 'Paola', 'Prieto', 'Founding Partner & CGO', '+52 (55) 8572 8040', 'paola@naotravelco.com', '', '2024-06-23 08:53:12', '2024-06-23 08:53:12'),
(70, 5, 82, 'Mrs.', 'Karen', 'Diner', 'Travel Consultant', '+525585534272', 'kdiner03@yahoo.com', '', '2024-06-23 09:17:37', '2024-06-23 09:17:37'),
(71, 5, 70, 'Mrs.', 'Selma', 'Weisbein', 'Luxury Travel Advisor', '+13058983353', 'selma.weisbein@protravelinc.com', '', '2024-06-23 09:43:41', '2024-06-23 09:43:41'),
(72, 5, 83, 'Mrs.', 'Kim', 'Hebert', 'Owner', '+1(337)3446324', 'kim@explorateurtravel.com', '', '2024-06-25 03:35:14', '2024-06-25 03:35:14'),
(73, 5, 11, 'Mrs.', 'Hilda', 'Van Der Wel-Gonzalez', 'Owner', '+31654203787', 'hilda@avilareizen.nl', '', '2024-06-25 03:44:12', '2024-06-25 03:44:12'),
(74, 5, 71, 'Mrs.', 'Jodi', 'Zoph', 'Founder', '+18475081417', 'jodi@mindfuljourneys.com', '', '2024-06-25 04:17:37', '2024-06-25 04:17:55'),
(75, 5, 85, 'Mr.', 'Mark', 'Perrera', 'Senior Account Manager, Travel Partner Relations - DMC', '+1 437 777 1042', 'mark.perera@trip-arc.com', '', '2024-06-26 22:32:43', '2024-06-26 22:32:43'),
(76, 0, 86, 'Mrs.', 'Judy', 'Poliva', 'Product Development Manager', '+1 215-572-9594 ext 226', 'jpoliva@friendlyplanet.com', '', '2024-06-27 13:39:32', '2024-06-27 13:39:32'),
(77, 0, 87, 'Mrs.', 'Moira', 'Smith', 'Vice President, Africa & Asia', '+1 800-387-8850', 'moira@goway.com', '5', '2024-06-27 16:11:22', '2024-06-27 16:11:22'),
(78, 0, 87, 'Mrs.', 'Shirley', 'Rourke', 'Vice President, Groups Only', '+1 800 387 8850', 'shirley@goway.com', '5', '2024-06-27 16:12:20', '2024-06-27 16:12:20'),
(79, 0, 87, 'Mrs.', 'Linda', 'Warner', 'Product Manager, Asia', '+1 800 387 8850', 'lindaw@goway.com', '5', '2024-06-27 16:13:35', '2024-06-27 16:13:35'),
(80, 0, 86, 'Mrs.', 'Vicky', 'Booysen', 'Event planner', '', 'vbooysen@friendlyplanet.com', '5', '2024-06-27 16:18:16', '2024-06-27 16:18:16'),
(81, 0, 86, 'Mrs.', 'Taylor', 'Smith', 'Product development', '', 'tsmith@friendlyplanet.com', '5', '2024-06-27 16:18:52', '2024-06-27 16:18:52'),
(82, 0, 88, 'Mr.', 'Wesley', 'Young', 'Product Delivery', '+1 434 234 7385', 'wesleyy@WorldStrides.com', '5', '2024-06-27 20:07:29', '2024-06-27 20:07:29'),
(83, 0, 89, 'Mrs.', 'Marianthi', 'Kotsou', 'CEO', '+30 210 3232192', 'm.kotsou@estiatravel.gr', '5', '2024-06-27 21:27:02', '2024-06-27 21:27:02'),
(84, 0, 73, 'Mrs.', 'Audrey', 'Zantzinger', 'Junior Sales Associate', '+1 646 733 4918', 'audrey@mayamayatravel.com', '5', '2024-06-27 21:37:34', '2024-06-27 21:37:34'),
(85, 0, 74, 'Mrs.', 'Stephanie', 'Bagshaw', 'President & Founder', '+1 425-241-3154', 'sbagshaw@bagshawtravel.com', '5', '2024-06-27 21:47:32', '2024-06-27 21:47:32'),
(86, 0, 76, 'Mrs.', 'Elena', 'González', 'Luxury Travel Designer', '+34 917 37 06 03', 'egonzalez@godwana.es', '5', '2024-06-27 22:17:16', '2024-06-27 22:17:59'),
(87, 0, 77, 'Mrs.', 'Tatsiana', 'Lukyanenka', 'Travel Designer', '+37066600545', 'luxury@boutiquetravel.lt', '5', '2024-06-28 00:52:10', '2024-06-28 00:52:10'),
(88, 0, 78, 'Mrs.', 'Adriana', 'Cambio', 'Luxury Travel Advisor', '+1 305 933 3997', 'ca@brickelltravel.com', '5', '2024-06-28 01:05:15', '2024-06-28 01:05:15'),
(89, 0, 78, 'Mrs.', 'Sandra', 'Ghisays', 'Luxury Travel Advisor', '+1 305 856 8889', 'sandra.ghisays@brickelltravel.com', '5', '2024-06-28 01:06:43', '2024-06-28 01:06:43'),
(90, 0, 80, 'Mr.', 'Adi', 'Fogel', 'President', '+1 305 531 8999', 'afogel@rttravelofamerica.com', '5', '2024-06-28 01:32:24', '2024-06-28 01:32:55'),
(91, 0, 92, 'Mrs.', 'Mariana', 'David de Sanson', 'Owner - Sales & Marketing', '+1 305 505 6803', 'mari@artoftravel.com.br', '5', '2024-06-28 14:18:21', '2024-06-28 14:18:21'),
(92, 0, 94, 'Mrs.', 'Katie', 'Anetsberger', 'Luxury Travel Advisor', '+1 773 430 4252', 'kanetsberger@royal-travel.com', '5', '2024-06-28 14:42:49', '2024-06-28 14:42:49'),
(93, 0, 95, 'Mrs.', 'Camila', 'Alfonso', 'Travel Advisor', '+1 954 371 9093', 'camila.alfonso@vwti.com', '5', '2024-06-28 15:02:39', '2024-06-28 15:02:39'),
(94, 0, 95, 'Mr.', 'Pete Maniscalco', 'Pete', 'Maniscalco', '+1 332 244 9144', 'pete.maniscalco@vwti.com', '5', '2024-06-28 15:09:41', '2024-06-28 15:09:41'),
(95, 0, 96, 'Mrs.', 'Estela', 'Huston', 'Sales Council Member % Luxury Travel Advisor', '+52 (81) 8161 4779', 'estela.huston@nuba.com', '5', '2024-06-28 18:43:34', '2024-06-28 18:43:34'),
(96, 5, 96, 'Mrs.', 'Lucila', 'Hernandez', 'Travel Advisor', '+1', 'lucila.hernandez@nuba.com', '5', '2024-06-28 19:01:56', '2024-06-28 19:01:56'),
(97, 5, 97, 'Mrs.', 'Vanelle', 'Pereira', 'Owner', '+55 21 99808 5883', 'vanelle@contemplarturismo.com.br', '5', '2024-06-28 19:20:41', '2024-06-28 19:20:41'),
(98, 5, 98, 'Mrs.', 'Mónica', 'Ahued Vázquez', 'Travel Designer', '+51 55 5402 5632', 'monica.ahued@frosch.com', '5', '2024-06-28 19:40:26', '2024-06-28 19:40:26'),
(99, 5, 99, 'Mrs.', 'Olenka', 'Vasquez', 'Travel Expert', '+51 991 875 165', 'sales@bpjourney.com', '5', '2024-06-28 20:05:11', '2024-06-28 20:05:11'),
(100, 5, 99, 'Mrs.', 'Natalia', 'Ordonez', 'Director', '+51 991 875 165', 'natalia.ordonez@bpjourney.com', '5', '2024-06-28 20:12:18', '2024-06-28 20:12:51'),
(101, 5, 100, 'Mr.', 'Fabiano', 'Camargo', 'Sales Director', '+55 19 99299 4437', 'fabiano@ctoperadora.com.br', '5', '2024-06-28 20:22:50', '2024-06-28 20:22:50'),
(102, 5, 101, 'Mr.', 'Theo', 'Laksmana', 'Director of Leisure & Entertainment', '+1 213-924-4702', 'theo.laksmana@globaltravelcollection.com', '5', '2024-06-28 20:44:18', '2024-06-28 20:44:18'),
(103, 5, 102, 'Mrs.', 'Cathlyn', 'Donado', 'Operations Manager, VIP, Corporate & MICE', '+971 559008016', 'operations3@luxuryexplorersme.com', '5', '2024-06-28 20:53:33', '2024-06-28 20:53:33'),
(104, 5, 103, 'Mrs.', 'Amy', 'Freyder', 'Luxury Travel Advisor', '+1 949 246 6865', 'amy@epicaway.com', '5', '2024-06-28 21:04:34', '2024-06-28 21:04:34'),
(105, 5, 104, 'Mrs.', 'África', 'Llamas', 'Sales Director & Associate Partner', '+34 933 464 345', 'africallamas@elefant.com.es', '5', '2024-06-28 21:12:45', '2024-06-28 21:12:45'),
(106, 5, 105, 'Mr.', 'Mark', 'Allvey', 'Co-Founder', '+44 7762 848888', 'mark@untoldstorytravel.com', '5', '2024-06-28 21:19:46', '2024-06-28 21:19:46'),
(107, 5, 106, 'Mr.', 'Ilmir', 'Alder', 'Social Media Manager / Assistant Agent', '+1', 'ilmir@jonathanstravels.us', '5', '2024-06-28 21:32:29', '2024-06-28 21:32:29'),
(108, 5, 107, 'Mrs.', 'Shari', 'Shocket', 'Luxury Travologist', '+1 617 921 7802', 'shari@largaytravel.com', '5', '2024-06-28 21:40:31', '2024-06-28 21:40:31'),
(109, 5, 108, 'Mrs.', 'Sandie', 'Lehal', 'Travel Partner', '+44 7974 479931', 'sandie@richlisttravel.co.uk', '5', '2024-06-28 22:10:55', '2024-06-28 22:10:55'),
(110, 5, 109, 'Mrs.', 'Shaiy', 'Howard', 'President & CEO/Travel Curator', '+1 305 409 2133', 'shaiy@travelbyshaiy.com', '5', '2024-06-28 22:15:24', '2024-06-28 22:15:24'),
(111, 5, 110, 'Mrs.', 'Margarita', 'Guerrero', 'Luxury Travel Advisor', '+52 558 525 2213', 'mguerrero@cts.mx', '5', '2024-07-01 21:24:32', '2024-07-01 21:24:32'),
(112, 5, 111, 'Mrs.', 'Toni', 'McClelland', 'Director of Hosting Development', '+1 205 414 1669', 'tonim@brownelltravel.com', '5', '2024-07-01 21:45:16', '2024-07-01 21:46:11'),
(113, 5, 112, 'Mr.', 'Ted', 'Bradpiece', 'President', '+1 818 359 2158', 'tedbradpiece@explorerts.com', '5', '2024-07-01 21:57:11', '2024-07-01 21:57:11'),
(114, 5, 113, 'Mrs.', 'Jennifer', 'Anderson', 'Co-Founder', '+1 917 741 7409', 'jennifer@worldsawaytravel.com', '5', '2024-07-01 22:06:35', '2024-07-01 22:06:35'),
(115, 5, 113, 'Mrs.', 'Laura', 'Treciokas', 'Luxury Travel Advisor', '+1 917 882 5802', 'laura@worldsawaytravel.com', '5', '2024-07-01 22:30:48', '2024-07-01 22:30:48'),
(116, 5, 114, 'Mrs.', 'Angela', 'Caes', 'Founder', '+1 203 524 1641', 'angela@fernleaftravel.com', '5', '2024-07-01 23:17:38', '2024-07-01 23:17:38'),
(117, 5, 115, 'Mr.', 'Paul', 'Dhadda', 'CEO', '+19164121514', 'paul@exquisitetravelgroup.com', '5', '2024-07-01 23:27:19', '2024-07-01 23:27:19'),
(118, 5, 116, 'Mrs.', 'Analucia', 'Torres', 'Founder & Director', '+52 811002023', 'analuciatorres@mundanatravel.com', '5', '2024-07-01 23:43:14', '2024-07-01 23:43:14'),
(119, 5, 117, 'Mrs.', 'Uly', 'Silkey', 'Travel Advisor', '+18189073686', 'uly@plazatravel.com', '5', '2024-07-02 01:08:24', '2024-07-02 01:08:24'),
(120, 5, 118, 'Mr.', 'Stefano', 'Bajona', 'President & Founder', '+39 02 9167 2271', 'stefano.bajona@onirikos.com', '5', '2024-07-02 01:17:44', '2024-07-02 01:17:44'),
(121, 5, 119, 'Mr.', 'Hubery Georg', 'Feil', 'CEO', '+49 171 33 11 331', 'hf@culturebrand.org', '5', '2024-07-02 01:33:25', '2024-07-02 01:33:25'),
(122, 5, 120, 'Mr.', 'Jason', 'Swaye', 'Luxury Travel Specialist', '+416 892 7936', 'jswaye@dt.com', '5', '2024-07-02 01:46:19', '2024-07-02 01:46:19'),
(123, 5, 121, 'Mrs.', 'Rossy', 'Natera', 'Travel Consultant', '+ 829 292 7531', 'rossy.natera@travelwise.com.do', '5', '2024-07-02 14:13:58', '2024-07-02 14:13:58'),
(124, 5, 122, 'Mrs.', 'Jeni', 'Kay', 'Owner / Luxury Travel Advisor', '+ 619 994 8899', 'Jeni@SeaBreezeTravel.net', '5', '2024-07-02 14:29:41', '2024-07-02 14:29:41'),
(125, 5, 123, 'Mrs.', 'Jessica', 'Parker', 'Travel Public Relations, Sales & Marketing', '+1 484 410 7122', 'jessica@tripwhisperer.co', '5', '2024-07-02 14:38:07', '2024-07-02 14:38:07'),
(126, 5, 90, 'Mr.', 'Dan', 'Marroni', 'Luxury Travel Designer', '+310 728 1826', 'danielm@travelcts.com', '5', '2024-07-02 14:47:02', '2024-07-02 14:47:02'),
(127, 5, 124, 'Mrs.', 'Carmen', 'Zuñiga', 'Gerente Vacations', '+52 55 1808 6255', 'carmen.zuniga@bcdtravel.com.mx', '5', '2024-07-02 14:57:31', '2024-07-02 14:57:31'),
(128, 5, 125, 'Mr.', 'Dinesh', 'Sapra', 'Senior Tour Consultant', '+1 647 534 1941', 'dinesh@tourcanvacations.com', '5', '2024-07-02 20:26:36', '2024-07-02 20:26:36'),
(129, 5, 125, 'Mr.', 'Vivek', 'Khanna', 'President', '+1 416 300 3454', 'vivek@tourcanvacations.com', '5', '2024-07-02 20:27:27', '2024-07-02 20:27:27'),
(130, 5, 90, 'Mrs.', 'Tricia', 'Prescher', 'Manager', '+1', 'tricia@travelcts.com', '5', '2024-07-03 13:22:59', '2024-07-03 13:22:59'),
(131, 5, 126, 'Mrs.', 'Emilie', 'Prudhomme', 'Product Manager Asia & Middle East (Chef de Produit) ', '+14388801253', 'Emilie.Prudhomme@travelbrands.com', '5', '2024-07-15 13:55:01', '2024-07-15 13:55:01'),
(132, 5, 126, 'Mrs.', 'Veronica', 'Angeli', 'Junior specialist, Products', '+1 4164851481', 'veronica.angeli@travelbrands.com', '5', '2024-07-15 13:56:50', '2024-07-15 13:56:50'),
(133, 5, 127, 'Mr.', 'Lieven', 'Bossaert', 'General Manager', '+32 (0)59 80 73 74', 'lieven@travelworld.be', '5', '2024-10-18 19:07:50', '2024-10-18 19:07:50'),
(134, 5, 127, 'Mr.', 'Prashant', 'Gora', 'Sales & Product Manager', '+32 (0) 59 80 73 74', 'prashant@travelworld.be', '5', '2024-10-18 19:09:15', '2024-10-18 19:09:15'),
(135, 5, 128, 'Mr.', 'Barry', 'Hammond', 'Product Manager USA / Canada, Worldwide', '+353 12311836', 'barry.hammond@sunway.ie', '5', '2024-11-18 19:03:24', '2024-11-18 19:03:24'),
(136, 5, 129, 'Mr.', 'Juan', 'Sanchez', 'Owner', '+44 7939 072549', 'juan@allabouttailormadetravel.com', '5', '2024-11-18 23:32:52', '2024-11-18 23:32:52'),
(137, 5, 130, 'Mr.', 'Christian', 'Jannelli', 'General Manager', '+44 20 3011 1452', 'chris@flightandpackages.com', '5', '2024-11-19 00:39:52', '2024-11-19 00:39:52'),
(138, 5, 131, 'Mr.', 'Phil', 'Hammond', 'Senior Asia Specialist', '+44 208 004 2345', 'phil@unforgettabletravelcompany.com', '5', '2024-11-22 01:29:23', '2024-11-22 01:29:23'),
(139, 5, 131, 'Mr.', 'Luke', 'Stapylton-Smith', 'Senior Asia Specialist (TBC)', '+44 208 004 2345', 'luke@unforgettabletravelcompany.com', '5', '2024-11-22 01:34:28', '2024-11-22 01:34:28'),
(140, 5, 132, 'Mrs.', 'Alice', 'Burns', 'Director', '+442081762009', 'alice@siroccoluxurytravel.com', '5', '2024-11-29 02:55:52', '2024-11-29 02:55:52'),
(141, 5, 132, 'Mrs.', 'Beth', 'Adam', 'Luxury Tailormade Travel Expert', '+442081762012', 'beth@siroccoluxurytravel.com', '5', '2024-11-29 02:56:54', '2024-11-29 02:56:54'),
(142, 5, 132, 'Mrs.', 'Lia', 'Vlachopoulou', 'Luxury Travel Consultant', '+442081762007', 'lia@siroccoluxurytravel.com', '5', '2024-11-29 02:57:54', '2024-11-29 02:57:54'),
(143, 11, 133, 'Mrs.', 'Andrea', 'Stadlhuber', 'Owner | Product, Marketing & Communications', '+49 171 1718017 ', 'andrea.stadlhuber@the-family-project.com', '11', '2024-11-29 21:41:38', '2024-11-29 21:41:38'),
(144, 5, 134, 'Mr.', 'Chris', 'Hawkins', 'Programme Director - Tailormade', '+44 1342 310592', 'chris.hawkins@tropicalsky.co.uk', '5', '2024-11-30 02:09:48', '2024-11-30 02:09:48'),
(145, 11, 135, 'Mrs.', 'Laileng', 'Lam', 'x', '+65 9626 5352     ', 'ae@asianescapes.com', '11', '2024-12-16 19:00:17', '2024-12-16 19:00:17'),
(146, 5, 136, 'Mr.', 'Michael', 'D\'Amico', 'President', '+1', 'michael@globalbasecamps.com', '5', '2025-01-03 01:41:15', '2025-01-03 01:41:15'),
(147, 5, 136, 'Mrs.', 'Laura', 'Hagler', 'Sales Manager', '+1', 'laura@globalbasecamps.com', '5', '2025-01-03 01:42:29', '2025-01-03 01:42:29'),
(148, 5, 137, 'Mrs.', 'Celeste', 'Rooke', 'Director of Operations', '+ 714 308 6830', 'celeste.rooke@contiki.com', '5', '2025-01-03 01:56:04', '2025-01-03 01:56:04'),
(149, 5, 138, 'Mr.', 'Leo', 'Papa', 'Senior Product Manager / Small Ship Cruising & Exotics', '203 289 9959', 'lpapa@tauck.com', '5', '2025-01-07 02:14:55', '2025-01-07 02:14:55'),
(150, 5, 138, 'Mrs.', 'Alicia', 'Decina', 'Product Manager', '475 775 1362', 'adecina@tauck.com', '5', '2025-01-07 02:15:42', '2025-01-07 02:15:42'),
(152, 11, 140, 'Ms.', 'Halle ', 'Eavelyn ', 'Ms', '+13102920688', 'halle.eavalyn@toursandretreat.com', '11', '2025-02-04 19:30:41', '2025-02-04 19:31:44'),
(153, 5, 142, 'Mrs.', 'Kim', 'Vincent', 'Director, Product Creation', '.', 'kvincent@globusfamily.com', '5', '2025-03-18 01:07:52', '2025-03-18 01:07:52'),
(154, 5, 143, 'Mrs.', 'Dinara', 'Gumarova', 'CEO', '+7 912 552 90 82', 'd.gumarova@hbpro.expert', '5', '2025-03-18 17:51:24', '2025-03-18 17:51:24'),
(155, 5, 143, 'Mrs.', 'Maria', 'Plotnikova', 'Director Contract & Development Department', '+7 912 709 00 39', 'm.plotnikova@hbpro.expert', '5', '2025-03-18 17:53:23', '2025-03-18 17:53:23'),
(156, 5, 88, 'Mrs.', 'Paola', 'Briata', 'Vice President of Contracting and Operations', '+1-617-210-6155', 'paolab@worldstrides.ca', '5', '2025-03-18 19:59:30', '2025-03-18 19:59:30'),
(157, 7, 144, 'Ms.', 'Monica ', 'Schmid', 'N/A', '  +49157344469185', 'monica@boutiquetours.de', '7', '2025-03-20 21:09:00', '2025-03-20 21:09:00'),
(158, 7, 145, 'Mr.', 'Robin ', 'Xie', 'Regional Product Manager', '+8613621875574', 'robin.xie@54traveler.com', '7', '2025-03-20 21:15:53', '2025-03-20 21:15:53'),
(159, 7, 146, 'Ms.', 'Brigitte', 'Rohrbach', 'N/A', '+41(0)791255000', 'thailandtravel.ch', '7', '2025-03-20 22:23:37', '2025-03-20 22:23:37'),
(160, 5, 147, 'Mrs.', 'Nadjiba', 'Taleb', 'Production Director', '+33 1 71 72 25 71', 'nadjiba@promosejours.com', '5', '2025-03-24 16:59:43', '2025-03-24 16:59:43'),
(161, 5, 148, 'Mrs.', 'Sylwia', 'Gorna', 'Director', '+48 501 464 810', 'info@podrozesylvia.pl', '5', '2025-03-24 23:42:54', '2025-03-24 23:42:54'),
(162, 5, 149, 'Mr.', 'Fabian', 'Fischer', '.', '+49 7961565802', 'info@myfet.de', '5', '2025-04-30 19:08:29', '2025-04-30 19:08:29'),
(163, 5, 138, 'Mrs.', 'Kelly', 'Rossiter', 'Senior Product Manager', '+1 203 919 4298', 'krossiter@tauck.com', '5', '2025-06-04 18:28:39', '2025-06-04 18:28:39'),
(164, 5, 150, 'Mrs.', 'Stefany', 'Sterling', 'Product Development Manager', '+1 206 254 0228', 'stefany.sterling@tcsworldtravel.com', '5', '2025-06-05 01:07:48', '2025-06-05 01:07:48'),
(165, 5, 151, 'Mrs.', 'Sara Marek', 'Kramer', 'Director Of Marketing', '1 (281) 394-0945', 'skramer@kerdowney.com', '5', '2025-06-07 00:47:58', '2025-06-07 00:47:58'),
(166, 5, 152, 'Mrs.', 'Nadah', 'Feteih', 'Founder', '+1 (617) 870-3718', 'nadah@mawacollective.com', '5', '2025-06-07 00:55:01', '2025-06-07 00:55:01'),
(167, 5, 153, 'Mrs.', 'Gabriella', 'Di Falco', 'CEO & Founder', '', 'gaby@electlifestyle.com', '5', '2025-06-07 01:00:14', '2025-06-07 01:00:14'),
(168, 5, 154, 'Mrs.', 'Alison', 'Ashton', 'Founder & CEO', '+1 206 919 0778', 'aashton@paxexpeditions.com', '5', '2025-06-09 22:04:05', '2025-06-09 22:04:05'),
(169, 5, 155, 'Mr.', 'Charlie', 'Thurston', 'Adventure Director - Europe & Asia', '+1 303 449 3711', 'charliet@nathab.com', '5', '2025-06-09 22:48:57', '2025-06-09 22:49:20'),
(170, 5, 156, 'Mrs.', 'Sarah', 'Brozna', 'Senior Director, Program Operations - Domestic', '+1', 'sarah.brozna@roadscholar.org', '5', '2025-06-09 23:37:57', '2025-06-09 23:37:57'),
(171, 5, 157, 'Mrs.', 'Lalka ', 'Morales', 'Founder, Luxury Travel Advisor', '+1 919 655 2403', 'lalka@onloctravel.com', '5', '2025-06-09 23:57:21', '2025-06-09 23:57:21'),
(172, 5, 158, 'Mrs.', 'Martina', 'Villa', 'Luxury Travel Designer', '+39 366 441 3363', 'martina.villa@bsktravel.com', '5', '2025-06-10 00:16:12', '2025-06-10 00:16:12'),
(173, 5, 159, 'Mrs.', 'Rita', 'Martins Soares', 'Owner & CEO', '+351 918 206 997', 'rita.soares@martins-soares.com', '5', '2025-06-10 01:14:22', '2025-06-10 01:14:22'),
(174, 5, 160, 'Mr.', 'Dave', 'Junco', 'VP Business Development', '+1 888 747 1011', 'dave@crankyconcierge.com', '5', '2025-06-10 01:24:06', '2025-06-10 01:24:06'),
(175, 5, 161, 'Mrs.', 'Barbara', 'Morini', 'Travel Consultant', '+39 339 4050921', 'b.morini@vertours.com', '5', '2025-06-10 01:28:36', '2025-06-10 01:28:36'),
(176, 5, 162, 'Mr.', 'Miguel', 'Tame', 'Luxury Travel Designer', '+52 55 8581 7924', 'mtame@cts.mx', '5', '2025-06-10 04:19:27', '2025-06-10 04:19:27'),
(177, 5, 162, 'Mrs.', 'Margarita', 'Guerrero', 'Luxury Travel Advisor', '+52 55 8525 2213', 'mguerrero@cts.mx', '5', '2025-06-10 04:22:45', '2025-06-10 04:22:45'),
(178, 5, 163, 'Mrs.', 'Mary', 'Steadman', 'Co Founder & Director or Partnerships', '+44 7464 142952', 'mary.steadman@luralifestyle.com', '5', '2025-06-10 04:59:28', '2025-06-10 04:59:28'),
(179, 5, 164, 'Mr.', 'Eric', 'Reader', 'Executive Vice President Partner', '+1 703 304 1024', 'eric.reader@ctltd.com', '5', '2025-06-10 05:13:16', '2025-06-10 05:13:16'),
(180, 5, 165, 'Mr.', 'Thiago', 'Fortunato', 'Co-Founder', '+13474919110', 'fortunato@cozytravelagency.com', '5', '2025-06-11 22:33:17', '2025-06-11 22:33:17'),
(181, 5, 90, 'Mr.', 'Michael', 'Edwards', 'Senior Vice President and General Manager', '+1 310 728 1855', 'michaele@travelcts.com', '5', '2025-06-11 23:34:29', '2025-06-11 23:34:29'),
(182, 5, 76, 'Mrs.', 'Cristina', 'Rodriguez', 'Head of Product & Business Development', '-', 'crodriguez@godwana.es', '5', '2025-06-12 00:09:41', '2025-06-12 00:09:41'),
(183, 5, 166, 'Mr.', 'Jack', 'Woodcock', 'Business Development Manager', '+44 7729 084 386', 'jack.woodcock@shyaviation.com', '5', '2025-06-12 00:14:55', '2025-06-12 00:14:55'),
(184, 5, 167, 'Mr.', 'Giacomo', 'Rigante', 'Founder & CEO', '+39 338 164 5555', 'giacomo@worldwidelux.com', '5', '2025-06-12 00:45:41', '2025-06-12 00:45:41'),
(185, 5, 168, 'Mrs.', 'Nina Pinto', 'Tamayo', 'Destination & Product Development', '+52 55 13795386', 'nina@hypejourneys.com', '5', '2025-06-12 00:52:56', '2025-06-12 00:52:56'),
(186, 5, 169, 'Mrs.', 'Asta', 'Birna Hauksdottir', 'Director of Sales and Marketing', '+354 7781253', 'info@polarisjourneys.com', '5', '2025-06-12 01:00:41', '2025-06-12 01:00:41'),
(187, 5, 170, 'Mr.', 'Marcus', 'Williams', 'Owner', '+1 832 833 2869', 'impressivetravels@gmail.com', '5', '2025-06-12 01:14:00', '2025-06-12 01:14:00'),
(188, 5, 171, 'Mr.', 'Tony', 'Freedman', 'Business Owner / Director', '+61 3 8080 2173', 'tony.freedman@travelassociates.au ', '5', '2025-06-12 21:41:16', '2025-06-12 21:41:16'),
(189, 5, 96, 'Mrs.', 'Ruth', 'Behar', 'Luxury Travel Advisor', '+52 669 155 0085', 'ruth.behar@nuba.com', '5', '2025-06-12 22:02:54', '2025-06-12 22:02:54'),
(190, 5, 172, 'Mr.', 'Dan', 'Calabretta', 'Luxury Travel Advisor', '+1 516 567 0864', 'dan@ellitravel.com', '5', '2025-06-12 22:23:43', '2025-06-12 22:23:43'),
(191, 5, 173, 'Mrs.', 'Fernanda', 'Credidio', 'Owner', '+', 'fernanda@travelandsoul.com.br', '5', '2025-06-12 23:33:32', '2025-06-12 23:33:32'),
(192, 5, 120, 'Mr.', 'Paul', 'Chin-Aleong', 'Luxury Travel Advisor', '+416 928 3113', 'pchinaleong@dt.com', '5', '2025-06-12 23:59:59', '2025-06-12 23:59:59'),
(193, 5, 120, 'Mrs.', 'Monique', 'Auzoux', 'Travel Advisor', '+416 604 273 1811', 'mauzoux@dt.com', '5', '2025-06-13 00:07:06', '2025-06-13 00:07:06'),
(194, 5, 120, 'Mrs.', 'Shelley', 'Fisher', 'Luxury Travel Professional', '+1 514 228 4330', 'sfisher@dt.com', '5', '2025-06-13 00:10:58', '2025-06-13 00:10:58'),
(195, 5, 174, 'Mr.', 'Juergen', 'Eberth', 'Managing Director', '+7 926 542 6126', 'office@private-travel-club.com', '5', '2025-06-13 00:36:27', '2025-06-13 00:36:27'),
(196, 5, 175, 'Mrs.', 'Theresa', 'Chu-Bermudez', 'Owner & Travel Designer', '', 'theresa@getoutcustomtravels.com', '5', '2025-06-13 01:13:29', '2025-06-13 01:13:29'),
(197, 5, 176, 'Mr.', 'John', 'Rios', 'Independent Travel Agent', '+1', 'john@f1s.com', '5', '2025-06-13 01:16:44', '2025-06-13 01:16:44'),
(198, 5, 177, 'Mr.', 'Christer', 'Forsberg', 'CEO', '+46 (0)90 15 49 59', 'christer@unigloble.se', '5', '2025-11-01 04:25:36', '2025-11-01 04:52:36'),
(199, 5, 178, 'Mr.', 'Remi', 'Jorgensen', 'Head of New Markets', '+47 450 59 615', 'remi@larsmadlandreiser.no', '5', '2025-11-01 04:56:06', '2025-11-01 04:56:06'),
(200, 5, 179, 'Mrs.', 'Helen', 'Oksanen', 'Private Travel Designer', '+358 40 708 9425', 'helen.oksanen@helensjourneys.fi', '5', '2025-11-01 05:15:22', '2025-11-01 05:17:27'),
(201, 5, 180, 'Mr.', 'Don', 'Jayatilake', 'CEO', '+46 8 771 8 222', 'don@orienttours.se', '5', '2025-11-01 05:33:29', '2025-11-01 05:33:29'),
(202, 5, 181, 'Mr.', 'Claus', 'Brask Nielsen', 'Head of FIT Product & Sales', '+45 8712 6617', 'cbn@risskovrejser.dk', '5', '2025-11-01 06:15:09', '2025-11-01 06:15:09'),
(203, 5, 182, 'Mrs.', 'Ksenija', 'Kasleva', 'Sales Manager', '+37 12 7079 359', 'ksenija@antario.lv', '5', '2025-11-01 06:28:19', '2025-11-01 06:28:19'),
(204, 5, 183, 'Mr.', 'Tom', 'Seppala', 'Manager', '+358 207 451 402', 'tom.seppala@mrtravel.fi', '5', '2025-11-01 06:38:34', '2025-11-01 06:38:34'),
(205, 5, 184, 'Mrs.', 'Birgitte', 'Christensen', 'Business Development Manager', '+45 77 33 55 00', 'bich@profilrejser.dk', '5', '2025-11-01 06:49:15', '2025-11-01 06:49:15'),
(206, 5, 185, 'Mrs.', 'June', 'Nielsen', 'COO & Owner', '+45 33 15 00 77', 'june@drommerejser.dk', '5', '2025-11-01 06:57:44', '2025-11-01 06:57:44'),
(207, 5, 185, 'Mrs.', 'Ida', 'Lundahl', 'Sales Manager & Owner', '+45 33 15 00 77', 'ida@drommerejser.dk', '5', '2025-11-01 06:58:45', '2025-11-01 06:58:45'),
(208, 5, 186, 'Mr.', 'Michael', 'Demorit', 'Founder', '+', 'kontakt@travisto.se', '5', '2025-11-04 12:43:27', '2025-11-04 12:43:27'),
(209, 5, 186, 'Mrs.', 'Zara', 'Losell', 'Founder', '+', 'kontakt@travisto.se', '5', '2025-11-04 12:44:53', '2025-11-04 12:44:53'),
(210, 5, 187, 'Mr.', 'Kimmo', 'Asikainen', 'Founder', '+46 76 250 29 09', 'boka@travelzmart.se', '5', '2025-11-04 13:07:02', '2025-11-04 13:07:02'),
(211, 5, 188, 'Mrs.', 'Stéphanie', 'Patoine', 'Présidende et Directrice Générale', '1 877 977 4080', 'stephanie@levoyagistedequebec.com', '5', '2025-11-13 02:26:56', '2025-11-13 02:26:56'),
(212, 5, 189, 'Mr.', 'Vivek', 'Desai', 'Destination Specialist', '+44 (0) 20 8901 7320', 'vivek@indusexperiences.co.uk', '5', '2025-11-13 19:50:48', '2025-11-13 19:50:48'),
(213, 5, 190, 'Mr.', 'Shuban', 'Kotwal', 'Product Director', '07715 999 739', 'shuban@southalltravel.com', '5', '2025-11-13 23:20:33', '2025-11-13 23:20:33'),
(214, 5, 191, 'Ms.', 'Cassie', 'Stickland', 'Product Manager', '+44', 'Cassie.Stickland@titantravel.co.uk', '5', '2025-11-14 18:31:06', '2025-11-14 18:31:06'),
(215, 5, 192, 'Mr.', 'Johnson Sunday', 'Akogun', 'CEO', '+447366412765 ', 'johnsona@celgastravelsandtours.com', '5', '2025-11-14 22:28:17', '2025-11-14 22:28:17'),
(216, 5, 193, 'Mr.', 'Nwachukwu', 'Kingsley', 'Director', '+234 703 851 7449', 'nwachukwukingsley12@gmail.com', '5', '2025-11-14 22:53:53', '2025-11-14 22:53:53'),
(217, 5, 194, 'Mr.', 'Ole', 'Graunting', 'Destination Manager / Product Owner', '+45 86 22 71 81', 'ole@viktorsfarmor.dk', '5', '2025-11-17 20:04:43', '2025-11-17 20:04:43'),
(218, 5, 195, 'Mrs.', 'Lolita', 'Hakobyan', 'Head of Incoming Department', '+374 91 414 992', 'incoming@tourism.am', '5', '2025-11-17 22:42:30', '2025-11-17 22:42:30'),
(219, 5, 196, 'Ms.', 'Lea', 'Ftouni', 'Operations Director', '+961 01 815 600', 'lea.ftouni@telcotravel.com', '5', '2025-11-17 23:11:49', '2025-11-17 23:11:49'),
(220, 5, 197, 'Mrs.', 'Helen', 'Wheat', 'Destination Manager - Asia', '+44 782 736 9679', 'helen.wheat@travelbag.co.uk', '5', '2025-11-18 01:23:56', '2025-11-18 01:23:56'),
(221, 5, 199, 'Mrs.', 'Holly', 'Russel', 'Product Executive & Sustainability Expert', '+44 20 7393 1000', 'holly@major.travel', '5', '2025-11-20 02:13:03', '2025-11-20 02:13:03');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `event_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'No Event', '2023-02-21 17:24:55', '2023-02-21 17:24:55'),
(2, 1, 'Further East Nov 22', '2023-02-21 17:26:15', '2023-03-14 14:01:37'),
(3, 1, 'ITB 2023 + Sales Calls NL,BE,UK', '2023-03-14 13:43:16', '2023-03-14 13:43:16'),
(9, 11, 'Further East Nov 24', '2023-11-14 12:36:21', '2024-11-29 21:16:47'),
(10, 0, 'WTM 2023 + Sales call Germany', '2023-11-14 16:06:48', '2023-11-14 16:07:39'),
(11, 7, 'ATM May 2024', '2024-05-10 20:06:28', '2024-05-10 20:06:28'),
(12, 5, 'L.E. Miami 2024 + North America sales call', '2024-06-13 01:18:02', '2024-06-13 01:18:31'),
(13, 5, 'WTM 2024', '2024-11-18 19:16:44', '2024-11-18 19:16:44'),
(14, 0, 'USTOA 2024 + sales call', '2025-01-03 01:43:16', '2025-01-03 01:43:16'),
(15, 0, 'ITB 2025 + Sales calls', '2025-03-18 17:57:10', '2025-03-18 17:57:10'),
(16, 0, 'ATTA Denver 2025', '2025-06-07 00:48:23', '2025-06-07 00:48:23'),
(17, 5, 'L.E. Miami 2025', '2025-06-07 01:00:30', '2025-06-07 01:00:30'),
(18, 5, 'LATAM Fam Trip (Leo) 2025 (Thailand)', '2025-06-10 04:20:07', '2025-06-10 04:20:07'),
(19, 0, 'WTM 2025', '2025-11-11 23:22:24', '2025-11-11 23:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2023_02_27_040104_create_sessions_table', 1),
(10, '2023_02_27_112057_create_events_table', 1),
(11, '2023_02_27_153549_create_companies_table', 1),
(12, '2023_03_13_124547_create_contacts_table', 1),
(13, '2023_03_15_101836_create_notes_table', 1),
(14, '2023_04_07_102353_create_send_mails_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `contact_id`, `event_id`, `company_id`, `title`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, 'Meeting with Global Travel Moments', '<div>Notes: 4 *&amp; 5*. UK and US markets, book a lot of beach-only. A lot of honeymooners and couples in the 50s &amp; 60s. Currently booking through Kuoni / Carrier (UK) or A &amp; K US. <em>Follow up with presentations.</em></div>', '2023-02-21 17:29:11', '2023-02-22 09:35:53'),
(2, 1, 2, 2, 2, 'Meeting with Chic Location', '<div>Work from home small TOV very worried about recension coming up, not many bookings to Asia yet after the pandemic. Currently using Asian Trails (ID), Diethelm (TH), and Asia Plus (VN). Looking for a change possibly in ID. <em>Herman will follow up.</em></div>', '2023-02-22 09:27:52', '2023-02-22 09:36:43'),
(3, 1, 3, 2, 3, 'Meeting with Cliud 10 Travel', '<div>Most of the clientele from the East coast knows Paul well. Usually, bookings hotels direct not through DMC. For Thailand using Smiling Albino. Open to using us in other destinations. <em>Follow up cc Tom/Paul.</em></div>', '2023-02-22 09:31:30', '2023-02-22 09:38:19'),
(4, 1, 4, 2, 4, 'Meeting with Trips & Ships Luxury Travel', '<div>Had a Thailand and Japan enquiry and would send it over to Marc but never did. Travel Leaders /Innernova affiliated. Books are currently with Kensington sometimes but are ready to go direct to DMCs. <em>Follow up cc Tom/Paul</em>.</div>', '2023-02-22 09:34:23', '2023-02-22 09:34:23'),
(5, 1, 5, 2, 5, 'Meeting with SSR Holidays', '<div>Knows the people from TO-DMC well, former partners. Has 22,000 agents across India. For hotels, he does direct or via bed bank. Not a hot lead. <em>Follow up? introduce and hand over to Widi.</em></div>', '2023-02-22 09:42:00', '2023-02-22 09:42:00'),
(6, 1, 6, 2, 6, 'Meeting with Wish Viagens & Turismo', '<div>Already knows Leo well – Very happy to give us a chance when an Asia request comes up. <em>Herman to reintroduce Leo.</em></div>', '2023-02-22 09:44:31', '2023-02-22 09:44:31'),
(7, 1, 7, 2, 7, 'Meeting with Con Questa', '<div>Concierge + service from the Netherlands. Ajax team as their client and many ex-players, some celebrities also. 75 elite members paying + 1100 affiliate members. Starting to use DMCs for Asia, they were not offering Asia yet. <em>Hot lead, Herman to follow up.</em></div>', '2023-02-22 09:47:40', '2023-02-22 09:47:40'),
(8, 1, 8, 2, 8, 'Meeting with Seamless Travel Agency', '<div>Local TA, one of 110 agents affiliated with <a href=\"https://departurelounge.com/\">departurlounge.com</a> (<em>virtuoso</em>). Actively looking for a DMC in Asia. <em>Follow up cc Tom/Paul.</em></div>', '2023-02-22 09:57:06', '2023-02-22 09:57:06'),
(9, 1, 10, 2, 9, 'Meeting with The Accomplished Traveller', '<div>Top-end travel, 90% USA clients. Do all hotels direct, currently working with DA in many destinations. Good meeting but I don’t see them making a change to ICS now. <em>Follow up cc Tom/Paul.</em></div>', '2023-02-22 10:11:46', '2023-02-22 10:11:46'),
(10, 1, 11, 2, 10, 'Meeting with Eraso Travel', '<div>The old guy running a small tour operator out of Florida. D Now using A &amp; K in many of our destinations but looking for DMC in some of our destinations. <em>Follow up cc Tom/Paul.</em></div>', '2023-02-22 10:15:06', '2023-02-22 10:15:06'),
(11, 1, 12, 2, 11, 'Meeting with Avila Reizen', '<div>Is working with Khiri in many of our destinations. Herman knows Tim well from his Khiri days. Wants to focus more on Asia (<em>they are a Latin-America specialist</em>) Currently working with 1 DMC (Khiri) per destination but open to working with multiple in the future possibly. <em>Herman and Marc to keep in touch with Tim. HH Followed up with presentations.</em></div>', '2023-02-22 10:19:22', '2023-02-22 10:19:22'),
(12, 1, 13, 2, 12, 'Meeting with Viajan Turismo & Expedicoes', '<div>Brazilian living in San Fransisco. Clientele is Brazilians (mostly) and some Americans. Looking for SEA DMC. <em>HH Followed up with presentations, and introduced to Tom, Paul and Leo.</em></div>', '2023-02-22 10:21:26', '2023-02-22 10:21:26'),
(13, 1, 14, 2, 13, 'Meeting with Origin.me', '<div>The tech-driven travel company, 90% of clients are from the USA. Book hotels directly. <em>Herman to follow up with the ICS presentation, HH Followed up with presentations.</em></div>', '2023-02-22 10:52:53', '2023-02-22 10:52:53'),
(14, 1, 15, 2, 14, 'Meeting with Cookson Adventures', '<div>The high-end Adventure travel company, that only do about 35 trips per year. Very specialized in highly tailored adventures. Mostly small groups and multi-gen families. <em>Herman to send ICS STYLE presentations, HH Followed up with presentations.</em></div>', '2023-02-22 10:54:04', '2023-02-22 10:54:04'),
(15, 1, 16, 2, 15, 'Meeting with Stagings', '<div>The small luxury operator from Latvia, sells lots of Africa but wants to do more in Asia. Currently working with A &amp; K in SEA. <em>Looking for DMC in Japan HH has introduced to Carsten</em></div>', '2023-02-22 10:56:40', '2023-02-22 10:56:40'),
(16, 1, 17, 2, 16, 'Meeting with Prana Travel Design', '<div>German high-end TO working with several agents across the company. Currently working with Exo in most of our destinations but are open to trying ICS when there’s a possibility. <em>Herman to follow up. HH Followed up with presentations.</em></div>', '2023-02-22 11:01:36', '2023-02-22 11:01:36'),
(17, 1, 18, 2, 17, 'Meeting with Exotic Tour / Mistral Tour', '<div>Exoctic your &gt; Indonesia focussed TO, working with Pacto but complaining about response time. Herman to follow up. For Thailand and Indochina, their brand is Mistral, he’s ok for us to connect with Antonio Dirrico (see above) for those destinations.<em> HH Followed up with presentations.</em></div>', '2023-02-22 11:39:40', '2023-02-22 11:39:40'),
(18, 1, 19, 2, 18, 'Meeting with Ailes', '<div>Top luxury operator (Traveller Made) who has offices in Switzerland, Marrakech, and Paris. Actively looking for a DMC in Thailand, possibly elsewhere in Indochina too. In Indonesia working with TOP Indonesia, there is no reason to change. Marc to follow up for TH. <em>HH Followed up with presentations and introduced Marc.</em></div>', '2023-02-22 12:08:34', '2023-02-22 12:08:34'),
(19, 1, 20, 2, 19, 'Meeting with 6 Degrees', '<div>Knows us well, and has travelled with us. Will use us for any SEA itinerary. <em>Follow up cc Tom/Paul.</em></div>', '2023-02-22 12:10:45', '2023-02-22 12:10:45'),
(20, 1, 21, 2, 20, 'Meeting with Embark Beyond', '<div>Collective of 150 luxury agents, mostly East Coast, know us through Paul and Tom,&nbsp;<em>Follow up cc Tom/Paul.</em></div>', '2023-02-22 12:25:11', '2023-02-22 12:25:11'),
(21, 1, 22, 2, 21, 'Meeting with Born to Travel', '<div>Reconnect with Paul &amp; Tom?<em> Follow up cc Tom/Paul</em></div>', '2023-02-22 12:26:08', '2023-02-22 12:26:08'),
(22, 1, 23, 2, 22, 'Meeting with Belo Viaja', '<div>Mexican high-end agents, curating long trips to SEA, usually 3 to 4 weeks including Thailand, Indochina, Bali, and Maldives. Great meeting and very happy to start working with ICS. Introduce to Leo and follow up with the ICS presentation. <em>HH Followed up with presentations and introduced Marc.</em></div>', '2023-02-22 12:27:09', '2023-02-22 12:27:09'),
(23, 1, 24, 2, 23, 'Meeting with Geographic Expeditions', '<div>Very attractive account, tailor-made, active itineraries, adventure, hotels included. Currently very much in bed with DA (have been for a long time) are contemplating moving to Asia Concierge. Have heard of us but are not very familiar with ICS. Impressed with STYLE and I will send over our presentation but there is a small chance of them moving to ICS soon. <em>HH Followed up with presentations.</em></div>', '2023-02-22 13:37:38', '2023-02-22 13:37:38'),
(24, 1, 26, 2, 24, 'Meeting with Truffle Pig', '<div>I know Trufflepig well from my Khiri time. Worked with them for years. We mostly talked about Indonesia and travel in general, not a hot lead for ICS at this moment, unfortunately. They are very loyal to their DMCs. HH will keep in touch with him though.&nbsp;</div>', '2023-02-22 13:45:43', '2023-02-22 13:45:43'),
(25, 1, 27, 2, 25, 'Meeting with Luxe & Nyx', '<div>Doing trips for luxury leisure. Couples manly. Have about 35 staff throughout. Thailand, Bali, Vietnam, and Cambodia. Working with DA currently. Open to trying us. Knows Paul. <em>Follow up cc Tom/Paul</em></div>', '2023-02-22 13:48:24', '2023-02-22 13:48:24'),
(26, 1, 28, 2, 26, 'Meeting with The Passionist', '<div>Currently booking everything through Asia Travel Specialist (based in the UK) who then use their preferred DMC. However Rene does have a say in this, and he wants to try ICS. Was a great meeting. Herman to follow up.&nbsp;<em>HH Followed up with presentations</em></div>', '2023-02-22 13:49:20', '2023-02-22 13:49:20'),
(27, 1, 29, 2, 27, 'Meeting with Paveway Explores', '<div>Came to FE only for Indonesia really. Discussed a 7-day program for Bali. <em>Herman to follow up.</em></div>', '2023-02-22 13:51:07', '2023-02-22 13:51:07'),
(28, 1, 30, 2, 28, 'Meeting with Lisa Lindblad Travel Design', '<div>New York based agency, African specialist, came to show to learn about Asia. Has 2 enquiries for SEA. Will send it to us but hasn’t yet. …to follow up. Books some hotels and guides direct in Europe and Africa, but for Asia plans to use DMC for all. Good lead. <em>Follow up cc Tom/Paul</em></div>', '2023-02-22 13:52:26', '2023-02-22 13:52:26'),
(29, 1, 31, 2, 29, 'Meeting with Adventum Travel', '<div>Small Australian TO looking for a DMC in SEA. Impressed with ICS presentations (STYLE). Doing many multi-gen trips to our region. <em>Marc/Herman to follow up</em></div>', '2023-02-22 13:54:01', '2023-02-22 13:54:01'),
(30, 1, 32, 2, 30, 'Meeting with Hello Word / Surrey Hills', '<div>Small TO from near Melbourne, doing mostly Europa and SEA, and little Indonesia.&nbsp;<em>Marc/Herman to follow up</em></div>', '2023-02-22 14:01:10', '2023-02-22 14:01:10'),
(31, 1, 33, 2, 31, 'Meeting with TRUVI', '<div>An outbound luxury company from Jakarta. Experiential outbound travel is in its infancy, he’s very much educating his travellers that travel is about more than a nice hotel. Tough market but some potential for Indonesian groups to SEA 10-12 pax. <em>Marc/Herman to follow up, HH followed up with presentations</em></div>', '2023-02-22 14:02:05', '2023-02-22 14:02:05'),
(32, 1, 34, 2, 32, 'Meeting with Perez–Maldonado', '<div>Hot lead. Introduce to Leo. Specialized in Asia honeymoons and multi-gen travel. Long trip. Currently with A&amp;K and Exo but looking for a change. Very good chance for ICS! <em>HH has introduced Leo</em></div>', '2023-02-22 14:03:05', '2023-02-22 14:03:05'),
(33, 1, 35, 2, 33, 'Meeting with Panache World', '<div>Traveller Made agency. High-end Indian. Knows the people behind the tripfactory well. In Indonesia with TOP Indonesia, not looking for a change. In other countries with EASIA, is open to change. Marc/Carsten to follow up?&nbsp;<em>HH has followed up and introduced to Carsten/Marc</em></div>', '2023-02-22 14:04:27', '2023-02-22 14:04:27'),
(34, 1, 36, 2, 34, 'Meeting with Chic Voyage', '<div>Traveller Made agency. Herman has a good personal relationship with Minette. Formerly with Khiri but open to try ICS for any next inquiry. <em>Herman/Marc to keep in touch. HH followed up with presentations</em></div>', '2023-02-22 14:05:41', '2023-02-22 14:05:41'),
(35, 1, 37, 2, 35, 'Meeting with Allure Travel', '<div>Another Australian agency, has low potential. Not interested in Indonesia but is interested in other SEA destinations. Impressed with the STYLE presentation. <em>Herman to send.</em></div>', '2023-02-22 14:06:34', '2023-02-22 14:06:34'),
(36, 1, 38, 2, 36, 'Meeting with Teranui by Tselana Travel', '<div>Not on our list for appointments but came to the table to specifically talk about Indonesia. Which we did. Urgently need a DMC here. <em>Herman to follow up.</em></div>', '2023-02-22 14:07:21', '2023-02-22 14:07:21'),
(37, 1, 39, 3, 38, 'Pelikaan Travel Group', '<div>27 Feb - Herman &amp; Pim met with Bert (Commercial and Operational Director). The group has various companies but for us interesting would be their group of travel agents (TA) and independent travel agents (ZRA\'s), currently all their agents are booking with TO\'s but Bert wants to promote booking direct with DMC\'s (us). A large group of their TA\'s will have an incentive trip this March and they will discuss working direct with DMC\'s there. Herman to follow up with Bert in second half of March.</div>', '2023-03-14 14:05:50', '2023-03-14 14:05:50'),
(38, 1, 45, 3, 39, 'Travel Boutique', '<div>27-2 Herman and Pim met with Debbie at their home / office in Ulvenhout. Just a general catch up and informal meeting. Everything running well in Indonesia. Is using us already in Thailand and will use is in Vietnam as well once Marc has set up.</div>', '2023-03-14 14:21:53', '2023-03-14 14:21:53'),
(39, 1, 46, 3, 37, 'Travel XL', '<div>27-2 Herman &amp; Pim met with Peter and Patrick (both directors of Travel XL). This large consortium of TA\'s has worked with ICS pre-pandemic and a handful of agents are doing this still. However the majority books via tour operators. Peter, Patrick and ICS want to regain the trust of the TA\'s and make them book direct with ICS. In second half of March, Herman will do a zoom presentation and we will also send materials for their news letter to re-introduce us to all the TA\'s.</div>', '2023-03-14 14:28:33', '2023-03-14 14:28:33'),
(40, 1, 41, 3, 40, 'TOOKU / Anders Dan Anders', '<div>28-2. Herman had very good meeting with Nicky and Gwendoline. So Anders dan Anders is the brand for the group series. For this they have a small own dmc in Bali to supply work permits for their tour leaders. For their high-end FIT brand <strong>TOOKU</strong>, they currently work with Panorama with whom they have a good 8year old relationship. (group name for the company is master-tour) I am sure we are better than Panorama for high-end travel and they will give us a chance, as they are not happy with response time of panorama. Nicky will come to Indonesia this summer and I have invited her to do some unique ICS tours so we can showcase our strength. Herman will follow up.</div>', '2023-03-14 15:27:36', '2023-03-14 15:27:36'),
(41, 1, 42, 3, 41, 'Talisman', '<div>28-2. Herman met with owner and co-founder Don. Talisman is one of the best high-end touroperators of NL. Average file is 20k plus. Have a strong and loyal relation with Khiri, but appreciated me keeping in touch with them. Annelies &amp; Marjolijn with whom I have a good relation were not at the meeting but are still both at the company. I will keep in touch with them and try to persuade to try ICS out. In Indonesia or any of our other destinations.</div>', '2023-03-14 15:32:06', '2023-03-14 15:32:06'),
(42, 1, 43, 3, 42, 'Tico Reizen Amsterdam', '<div>2-3. Herman met with Charissa, one of the directors in Amsterdam. High-end operator from the Netherlands, average file pp 12k and up. For Charissa, it\'s all about personal relationships and appreciated me coming to meet her. She wills end us her next enquiry and compare price/quality to Khiri with whom they currently work. Herman to keep in touch with Charissa.</div>', '2023-03-14 15:49:17', '2023-03-14 15:49:17'),
(43, 1, 44, 3, 43, 'Zeppelin', '<div>28-2 Herman met with Jessie (owner) at her office in Laarne, near Gent. She is currently doing all by herself and coming back from a longbreak (burn-out). For Indonesia works with Happy Trails for the mid range budget trip but is willing to try us for the higher-end proposals. IS also looking to work with us in Vietnam and needs a DMC in the Philipines. Herman has connected Carsten re. the Philipines. And Herman to keep in touch with her re. Indonesia.&nbsp;</div>', '2023-03-17 08:29:13', '2023-03-17 08:29:13'),
(44, 1, 47, 3, 44, 'GCS', '<div>Marc and Herman, met with Brian and Alexandra at ITB. We discussed their various brands and opportunities and that we need to update pricing. Herman to follow up with Laura on this. Have instructed inbound to update pricing. Herman to work with GCS for groups and their other brands such a Great Value Vacations. Want to do groups with guaranteed departures.</div>', '2023-03-17 08:42:30', '2023-04-17 02:42:36'),
(45, 1, 48, 3, 45, 'Lotus Travel', '<div>9-3. Herman met with Elisabeth at ITB. Discussed updating of existing 15 packages. For now just need updated rates currently only until October31. Product and hotel offering still ok. Want to change payment conditions, I referred them to Marc to discuss this. Big company part of FIT reisen. We can increase the business with them if we deliver newsletter content. Going to 12.000 travellers in Germany. Happy with ICS, response time is good but urgently need new rates fo next year.&nbsp;</div>', '2023-03-17 08:46:50', '2023-11-13 21:57:59'),
(52, 5, 53, 10, 45, 'Update on Thailand products', '<div>Needs island hopping programs + Northern Thailand &amp; Laos&nbsp;<br>They are interested in getting online tariff too, but reported that Exo was doing the same and they complained about the \"reporting part\" of it. E.g.: every time Lotus checks a rate online, it\'s considered as a request automatically by Exo system, so conversion rate is obviously very low (which Exo \"complains\" about).&nbsp;</div>', '2023-11-14 16:31:57', '2023-11-14 16:31:57'),
(53, 5, 54, 10, 48, 'Opportunities for Thailand & Hong-Kong', '<div>Julien met with Harald in Munich.&nbsp;<br>They want to stop working with TO in Germany because decrease in knowledge and expertise (post covid effect), so very open to work with DMCs directly.&nbsp;<br><br>Very high end clientele. Often go on Expedition ships and need post trip arrangements. Their clients usually book one way ticket and some travel for months...<br>They love sailing trips, I told them about Enrico already ! they said it would be great to have 2 weeks options around Phuket to replace their current sample programs in Mediterranean sea.&nbsp;<br>They might come to Thailand in February 2024. 6 pax. Julien &amp; Enrico sent a sample program in Gulf of Thailand.&nbsp;<br>They will also need operator in HK for shore excursions.&nbsp;<br><br></div>', '2023-11-14 21:42:02', '2023-11-14 21:42:02'),
(54, 5, 55, 10, 49, 'Business opportunities for Japan & China', '<div>Julien met with Sara at WTM (used to work with Travel Department in the past, they have another brand called TD active that focused on younger clientele).&nbsp;<br>they are looking for another DMC in Japan, introduced to our partner there already by email.&nbsp;<br>Leah Parmeshwar also contacted Julien after the show as they are looking for a DMC in China. Julien sent series (3 programs, 10 departures in 2024, 10 to 40 pax) to both our current partner and another one to make sure we provide rates.&nbsp;</div>', '2023-11-14 22:06:39', '2023-11-14 22:06:39'),
(55, 5, 57, 10, 50, 'Update on Thailand & Bali 2024 packages', '<div>Julien met with Laura and Alexandra at WTM.&nbsp;<br>Need all ICS countries contact list: sent by Julien.&nbsp;<br>Extension of rates for Bali flash sale need to be done (Herman working on it) Thailand: extended to middle of the year, need for the rest of the year.</div><div>Interested in Japan. Packages. julien to put them in contact: done.&nbsp;</div><div>Jacky Cooral honeymoon GCS January 24. Proposed a dinner at the Seen.</div>', '2023-11-15 16:00:59', '2023-11-15 16:00:59'),
(56, 5, 58, 10, 51, 'Update on D-Reizen new tailor made department', '<div>Julien met with Jutta, Dominique and Kimberly (following a conjunction of connections on LinkedIn and emails crossed with different person, Jutta &amp; Julien agreed to meet at WTM)<br>D-Reizen: same&nbsp; group as Prijsvrij. Big network of travel agencies in the Netherlands. In contact with Khiri already.&nbsp;<br>They are launching a tailor made department and they have recruited Dominque and Kimberly, 2 very young staff who just graduated and won a sales competition (TBC).&nbsp;<br>They want to start with few destinations first and Thailand is part of it.&nbsp;<br><br>They want 4 classic itineraries, including 1 for families. Dutch style: so mix of soft adventure and classics.&nbsp;<br><br>Julien sent 3 programs and working on family, proposed to work in 3 phases to accompany the \"tailormakingzation\" of the brand. Phase 1: multiday itineraries (done) / phase 2: breaking down these itineraries in modules / phase 3: breaking down the modules in day trips and transfers. All will depend on how the market / their clientele react and what they need. Julien also proposed online or onsite (including fams) trainings.&nbsp;&nbsp;</div>', '2023-11-16 17:44:48', '2023-11-16 17:44:48'),
(57, 5, 60, 10, 52, '2025 group series', '<div>Julien met with Martin, Joe &amp; Dominic (Julien worked with them in the past)&nbsp;</div><div>They are specialized in young travelers groups&nbsp;</div><div>Pre-Covid they used to have approx. 300 pax per year in Thailand if I’m not wrong, so good volume but unsurprisingly price and margins are low.&nbsp;</div><div>In 2024, according to their website that they have 5 itineraries, 63 departures in total…And they estimate 20 average pax per departure average...</div><div>They are all set for 2024 but they seem to have some doubts with they current DMC (potentially Khiri…). So they want us to requote <strong>only one </strong>of their program to test the waters with us: <strong>Camp Thailand Ultimate Adventure.&nbsp;</strong></div><div>They mentioned that most of people who signed up for their tours in 2023 and 2024 are girls. So they want to have a more “boy friendly” program to add to their 2025 programs. Working on all this.&nbsp;</div><div>&nbsp;</div>', '2023-11-17 19:43:15', '2023-11-17 19:43:15'),
(58, 5, 61, 10, 53, 'Thailand launch', '<div>Julien met with Zee.&nbsp;<br>Need few sample programs to launch Thailand on their website.&nbsp;<br>3 programs sent.</div>', '2023-11-17 23:19:50', '2023-11-17 23:19:50'),
(59, 5, 64, 10, 56, 'Considering a new DMC in Thailand?', '<div>Julien had lunch with Matthias in Munich.<br>small TO but quite modern and creative. All staff work from home, no office.&nbsp;<br>they bought It\'s your Trip during Covid.&nbsp;<br>They try to always put a \"wildlife\" or at least \"nature\" touch in each stop.&nbsp;<br>They are keen to change DMC in Thailand as their current one is very slow.&nbsp;<br>Matthias asked to receive 1 classic product and 1 new signature one mixing classic and nature. Julien already sent both (one is focusing on Khao Sok that they don\'t seem to sell, ,looking at their website) + island hopping combining eastern islands + Cambodia to push for other ICS destinations too.&nbsp;</div>', '2023-12-04 20:09:01', '2023-12-04 20:09:01'),
(60, 5, 67, 12, 67, 'Send honeymoon focused products. ', '<div>Specialized in honeymoon. Knows Paul.&nbsp;<br>ICS Thailand had a booking in 2023. Hong by Starlight.&nbsp;<br>Based in Minneapolis.</div>', '2024-06-23 08:40:53', '2024-06-23 08:40:53'),
(61, 5, 68, 12, 68, 'Send presentation', '<div>Knows Paul</div>', '2024-06-23 08:57:00', '2024-06-23 08:57:00'),
(62, 5, 69, 12, 69, 'not happy with current supplier', '<div>Send presentations with unique products.&nbsp;<br>Propose a webinar&nbsp;</div>', '2024-06-23 08:58:13', '2024-06-23 08:58:13'),
(63, 5, 70, 12, 82, 'Send presentation', '<div>need to send presentation and remind we do Japan (she didn\'t know)</div>', '2024-06-23 09:20:35', '2024-06-23 09:20:35'),
(64, 5, 71, 12, 70, 'one request for Japan / Singapore', '<div>one RQ for a couple, Richard Silberman &amp; his wife.&nbsp;<br>need spacious rooms. 5 stars. suites. Michelin stars restaurants.&nbsp;<br>like spa / wellness. 2-3 weeks.&nbsp;<br>Already sent to Carsten. Handled by his team&nbsp;</div>', '2024-06-23 09:46:40', '2024-06-23 09:46:40'),
(65, 5, 72, 12, 83, 'organize a call with Jordan', '<div>Met Kim at L.E.<br>She sent a follow up email so we can organize a call with Jordan Rush who is in charge of sales.&nbsp;</div>', '2024-06-25 03:36:21', '2024-06-25 03:36:21'),
(66, 5, 73, 12, 11, 'Meeting with Hilda', '<div>Avila is working on 3 different brands now: venture (off the beaten tracks, glamping...), comfort,&nbsp; and unique products.&nbsp;<br>Send unique experiences.&nbsp;<br>They would like to set up a call with with Freek and Sonja about Indonesia costing</div>', '2024-06-25 03:48:28', '2024-06-25 03:48:28'),
(67, 5, 74, 12, 71, 'Meeting with Jodi and her colleague', '<div>Jodi was with a colleague who lives 5 months of the year in Thailand, and knows it very well.&nbsp;<br>She loved our Eastern islands program + Cambodia. Especially Koh Kood.&nbsp;<br>Jodi also likes our uniques products (send presentation).&nbsp;</div>', '2024-06-25 04:19:00', '2024-06-25 04:19:00'),
(68, 5, 75, 12, 85, 'Meeting about Thailand, Indonesia & Malaysia (China at a later stage)', '<div>They use Easia as well (always have 2 DMCs per destination). And for now they don’t plan to change. They are also discussing with Exo and Smiling Albino and possibly with DA as I remember that they were working with them in Japan.&nbsp;</div><div>The feeling they have now with Khiri is that they can only handle their “classic business”, while they find Easia much more creative. Meeting with artists, specialists etc. Khiri used to do that years ago (local encounters) but stopped and now became more “mainstream”.&nbsp;</div><div>Mark spent some time with Daniel at Smiling Albino and was very impressed with their products and network, but they feel he won’t be able to handle such a big volume. They might use them from time to time for very special requests.&nbsp;</div><div><br></div><div>I do think we might have a chance for Thailand one day, I sent him a presentation&nbsp; to show how we can sell the country <strong>differently </strong>and sent to Mark in my follow up email. Mark said there could be an opportunity for other brands in the group for Thailand (Travel Edge and Ensemble).&nbsp;<br><br>He is asking to get similar presentations for Malaysia and Indonesia. Cartsen and Herman to reach out to him.&nbsp;</div><div><br><br></div>', '2024-06-27 13:17:41', '2024-06-27 13:17:41'),
(69, 5, 78, 12, 87, 'update on Thailand & Asia in general', '<div>Meeting with Moira, Shirley and Linda.&nbsp;<br>gave them some update on Thailand. Shirley and I will organize a call for their group sales team to update them on possible and potential activities in Thailand. they always sell&nbsp; BKK, CNX and HKT so they need to get creative.&nbsp;<br>Foodie tour would be good.&nbsp;<br>They liked the Sak Yant experience, as well as rice planting.&nbsp;<br><br>they told me S.Korea is getting very popular (mostly as an alternative to Japan).&nbsp;<br><br>they insisted to know the name of new GM in Indonesia.&nbsp;<br><br>already sent them an email to update on all of this.<br><br></div>', '2024-06-27 19:27:37', '2024-06-27 19:27:37'),
(70, 5, 76, 12, 86, 'Meeting about Thailand ', '<div>they are very loyal to Exo, but said they liked the idea about having another program in Thailand with Uthai Thani.&nbsp;<br>Sent them 2 programs and 1 presentation.&nbsp;<br>waiting for their reply&nbsp;<br><br></div>', '2024-06-27 19:28:42', '2024-06-27 19:28:42'),
(71, 5, 82, 12, 88, 'Update on ICS', '<div>Wes explained to me that he had some doubts about ICS since Covid. there were some issues pre Covid and just after Covid so we was wondering about our financial stability. I explained about the new structure of the company.&nbsp;<br>Our Chapman program will be ran again in Jan 2025.&nbsp;<br>But we need to get a bit more creative now to gain their trust again and show our capacity to handle more groups.&nbsp;<br>He asked me about our contacts with local corporation and multinational companies based in Thailand as it\'s key for them to arrange corporate meetings for their academic programs. it\'s time for us to do some networking and expand our contacts beyond travel industry.&nbsp;<br>I shared some ideas with him. Wes asked questions about how we train our guides, our vehicles etc. He wants us now to quote their VN KH and TH program as well as potentially other itineraries.&nbsp;<br><br>Sent him a follow up email and shared the \"off the beaten tracks\" thailand presentation.&nbsp;</div>', '2024-06-27 20:12:28', '2024-06-27 20:12:28'),
(72, 5, 83, 12, 89, 'Meeting about Asia', '<div>have a lot of repeat clients.&nbsp;<br>Spouse programs during corporate events.<br>interested in Japan.&nbsp;</div>', '2024-06-27 21:29:50', '2024-06-27 21:29:50'),
(73, 5, 84, 12, 73, 'Feedback on past bookings', '<div>Audrey just joined few months ago but shared some feedbacks from her colleagues on ICS. positive on operations side but lacking of creativity. too much by the book.&nbsp;<br>Send presentation about \"off the beaten tracks\" in thailand&nbsp;</div>', '2024-06-27 21:42:22', '2024-06-27 21:42:22'),
(74, 5, 85, 12, 74, 'Issue with a current request', '<div>had some problem about elephant riding few months ago.&nbsp;<br>+ a current request that was overpriced.&nbsp;<br><br></div>', '2024-06-27 21:48:38', '2024-06-27 21:48:38'),
(75, 5, 87, 12, 77, 'Meeting about Asia', '<div>send presentation&nbsp;</div>', '2024-06-28 00:53:14', '2024-06-28 00:53:14'),
(76, 5, 89, 12, 78, 'change DMC in Asia', '<div>Meeting with Sandra and Adriana separately at L.E. Miami.&nbsp;<br>both asked a presentation to be loaded in their internal system (already sent), 5 best sellers experiences&nbsp;<br>Adriana has a request for 5 days in BKK. She liked the idea of having 1 day by boat and 1 day by car.&nbsp;<br>Sent follow up email</div>', '2024-06-28 01:25:36', '2024-06-28 01:25:36'),
(77, 5, 91, 12, 92, 'Meeting about Asia', '<div>mostly honeymoon in Indo.&nbsp;<br>send presentation&nbsp;</div>', '2024-06-28 14:31:41', '2024-06-28 14:31:41'),
(78, 5, 92, 12, 94, 'Feedback on past bookings', '<div>great feedbacks on the 2024 booking with had with them.&nbsp;<br>only complaint was about Koh Phi Phi, too touristy.&nbsp;</div>', '2024-06-28 14:45:00', '2024-06-28 14:45:00'),
(79, 5, 93, 12, 95, 'Send presentation', '<div>send on Thailand products&nbsp;</div>', '2024-06-28 15:05:33', '2024-06-28 15:05:33'),
(80, 5, 97, 12, 97, 'Meeting Asia ', '<div>Needs to receive newsletter&nbsp;<br>I sent off beaten tracks presentation&nbsp;</div>', '2024-06-28 19:22:39', '2024-06-28 19:22:39'),
(81, 5, 109, 12, 108, 'request for Bali', '<div>Sandie asked for a comparative quote from us in Bali.&nbsp;<br>already in progress&nbsp;</div>', '2024-06-28 22:12:12', '2024-06-28 22:12:12'),
(82, 5, 129, 12, 125, 'Update on partnership', '<div>had meeting and lunch with Vivek and Dinesh in Toronto.&nbsp;<br>I apologized about the recent hiccups on pricing. I could see that Dinesh was really upset but we will fix it.&nbsp;<br><br>talked about new products, guide interviews...<br><br>Vivek mentioned he had a 100 dentists group in Kenya &amp; Tanzania soon. Very loyal group that travels with him every year. Try to get them for Thailand ?</div>', '2024-07-02 20:29:35', '2024-07-02 20:29:35'),
(83, 5, 131, 12, 126, 'Training with the sales team', '<div>following the online training we organized a last summer about the 4 island hopping programs, we did the same with \"Thailand by train\" and \"Thailand overland\" (including Uthai Thani) that we have created for them. This time with Emilie and Veronica onsite in Montreal and the whole sales team remotely.&nbsp;<br>Emilie wants to do a fam trip for 22 agents for the overland one. Travel Brands wants to work with us for all FIT and groups now, and keep the other DMC for SIC only.&nbsp;<br><br>Emilie mentioned that the long stays are working very well for them as people in Montreal want to avoid hard winters. to follow up on this&nbsp;</div>', '2024-07-15 13:59:40', '2024-07-15 13:59:40'),
(85, 5, 133, 3, 127, 'Need Hua Hin product', '<div>Lieven mentioned that they need a product aroudn Hua Hin.&nbsp;<br>He introduced Prashant, new product manager.&nbsp;<br>We also talked about tariffs. He is very interested. &nbsp;</div>', '2024-10-18 19:10:46', '2024-10-18 19:10:46'),
(86, 5, 135, 13, 128, 'Need Thailand and Indonesia packages', '<div>Julien met with Barry at WTM. they want Thailand and Indonesia packages.&nbsp;<br>Already sent requests. both country working on it</div>', '2024-11-18 19:17:40', '2024-11-18 19:17:40'),
(87, 5, 137, 13, 130, 'Thailand packages', '<div>Julien met with Chris.&nbsp;<br>Chris was a little frustrated with the communication with ICS travel consultant a couple of years ago. needs to resume discussion.&nbsp;<br>needs a free &amp; easy Bangkok + Khao Lak &amp; Khao Sok package&nbsp;</div>', '2024-11-19 00:41:26', '2024-11-19 00:41:26'),
(88, 5, 140, 13, 132, 'Send experiences', '<div>Julien met with Alice, Lia and Beth<br>showed them our \"unique experiences\" and they were very interested.&nbsp;<br>They feel DA and Exo are now too big and want to move on.&nbsp;<br>Couples and families.&nbsp;</div>', '2024-11-29 03:08:35', '2024-11-29 03:08:35'),
(89, 11, 143, 9, 133, 'FE 2024 Meeting with Andrea. ', '<div>Had a good meeting with Andrea and her husband. We introduced ICS and what is the strong points that we are having, namely response time and on hand management. Luke is familiar with them and the requests as they are currently working with EXO Travel. Email follow up has been sent and Andrea has responded and keen to try the ICS services.&nbsp;</div>', '2024-11-29 21:48:41', '2024-11-29 21:48:41'),
(90, 5, 144, 13, 134, 'Alternative beach destinations in Thailand', '<div>Julien met with Chris&nbsp;<br>He\'s looking for alternative beach destinations&nbsp;<br>Sent 4 programs on Nov 29&nbsp;</div>', '2024-11-30 02:10:57', '2024-11-30 02:10:57'),
(91, 11, 145, 1, 135, 'Meeting with Laileng in Bali', '<div>On Thursday, November 12, 2024, Luke met with Laileng over lunch at The Patra Hotel during her visit to Bali with her family.<br>During the meeting, Laileng shared some important feedback:<br><strong>Business Competitiveness:</strong><br>- They have lost some business to competitors offering lower rates.<br>- Some Turkish residents in Bali have started arranging trips for Turkish visitors, offering similar programs to what we provide with AE but with more budget-conscious options. For example, while we include the best menu options, they opt for the cheapest alternatives.<br><strong>Hotel Alternatives:</strong><br>- Laileng expressed interest in alternative hotels such as Ayodya and several 4-star properties in Seminyak.<br>- Luke will follow up by sending her the rates for these hotels.<br><strong>Meal Cost Adjustments:</strong><br>- ICS needs to consider suggesting lower meal rates without compromising quality. For example, instead of offering Salad + Soup + Main Course + Dessert, we - could simplify the menu by removing either the soup or salad.<br>- Luke will review this approach with Wawan in the coming days.<strong><br>Positive Relationship:</strong><br>- Laileng is overall happy with ICS in Indonesia.<br>- She will continue to promote and support ICS.<br>- She appreciates having a dedicated staff to handle her needs.<br><strong>Next Steps:</strong><br>- Send hotel rates for Ayodya and selected 4-star properties in Seminyak.<br>- Discuss meal rate adjustments with Wawan to ensure competitive pricing.<br>- Review the mark up policy we are having with them.<br>- Continue maintaining strong communication and service to support Laileng\'s business and relationship with ICS.<br><br><br></div>', '2024-12-16 19:08:56', '2024-12-16 19:08:56'),
(92, 5, 146, 14, 136, 'opportunities for Thailand', '<div>Michael is ok with Khiri now but still think that it\'s not as good as it used to be. He tried DA (David visited him), but then nothing. very slow turnaround time.&nbsp;<br>Julien showed him offbeat presentation, he liked the ideas. And he\'s happy to know turnaround time is one of our USP.&nbsp;<br>He asked me to do a presentation to his sales team.&nbsp;<br>I sent the presentation to Laura and we agreed on an online meeting end of Jan 2025</div>', '2025-01-03 01:46:43', '2025-01-03 01:46:43'),
(93, 5, 148, 14, 137, 'ask for introduction to Asia team', '<div>Julien quickly met with Celeste Rooke who cancelled our meeting few min before as she is not in charge of Asia. But I talked to her and will send our presentation</div>', '2025-01-03 01:57:43', '2025-01-03 01:57:43'),
(94, 11, 152, 1, 140, 'Meeting with Halle Eavalyn', '<div>I previously worked with Halle at my previous company, where I handled her retreat group in Bali. She is currently in Bali, hosting a group of 50 repeat guests. We had a great conversation about potential collaboration with ICS for her future groups.<br>Her company specializes in organizing tours and retreats with a strong focus on spirituality and wellness. Given her established presence in Bali and the loyalty of her repeat guests, this presents a promising opportunity to partner with ICS for future retreats.</div>', '2025-02-04 19:38:23', '2025-02-04 19:38:23'),
(95, 5, 153, 14, 142, 'Work with other brands in the group?', '<div>Julien met with Kim&nbsp;<br>talked about proposing a Thailand only itinerary&nbsp;</div>', '2025-03-18 01:09:14', '2025-03-18 01:09:14'),
(96, 5, 154, 15, 143, 'Looking for a partner in Thailand', '<div>Marc &amp; Julien met with them&nbsp;<br>looking for a DMC in Thailand<br>Julien sent Thailand programs</div>', '2025-03-18 17:58:50', '2025-03-18 17:58:50'),
(97, 5, 160, 15, 147, 'Northern Thailand series', '<div>Julien met with Nadjiba via Santi at Kapa senses (same group).&nbsp;<br>She is asking for Nothern thailand series that we do for LE.&nbsp;<br>translate, quote and send.&nbsp;</div>', '2025-03-24 17:03:18', '2025-03-24 17:03:18'),
(98, 5, 165, 16, 151, 'Julien met Sara Kramer', '<div>Loved blind massage<br>Asked about orang utangs indo&nbsp;<br>Said SEA was a bit slow. Japan top top&nbsp;<br>China pickinhg up&nbsp;<br><strong>She has 2 kids. Send family package&nbsp;<br><br>Sent Thailand offbeat, Thailand all year round and ICS Active presentations. Added her on&nbsp;distribution list&nbsp;<br></strong><br></div>', '2025-06-07 00:49:48', '2025-06-07 00:49:48'),
(99, 5, 164, 16, 150, 'Julien met Stefany', '<div>already have DMCs for their world tours. But could be interested for FIT business .&nbsp;<br>Loved the blind massage, sak yant&nbsp;<br><br>Sent Thailnd offbeat, Style by ICS presentations&nbsp;</div>', '2025-06-07 00:52:23', '2025-06-07 00:52:23'),
(100, 5, 166, 16, 152, 'Julien met Nadah', '<div>We\'d love to see if Thailand or any other countries you represent could be a potential destination for one of our future experiences, I\'ve shared a little bit below of what we look for and would love to see any sample proposals from you and your team:&nbsp;</div><div><br></div><ul><li><strong>Duration:</strong> 11 days / 10 nights – if budget does not allow then fewer days</li><li><strong>Group Size:</strong> 16–18 participants</li><li><strong>Tour Style:</strong> Soft adventure, with a mix of scenic sightseeing, light hikes, and other unique local activities</li><li><strong>Accommodation:</strong> Comfortable property (nothing too rustic, but budget-conscious)</li><li><strong>Guide:</strong> Dedicated local guide throughout</li><li><strong>Sales Model:</strong> Nadah will sell individual spots into the group</li><li>Also interested in Indonesia. Sent a th program and ICS active presentation</li></ul>', '2025-06-07 00:56:06', '2025-06-07 00:56:06'),
(101, 5, 167, 17, 153, 'Julien met Gabriella', '<div>added newsletter distribution list&nbsp;<br>sent thailand offbeat and Style by ICS presentation</div>', '2025-06-07 01:01:43', '2025-06-07 01:01:43'),
(102, 5, 163, 16, 138, 'Tauck plans to launch a new brand', '<div>Julien met with Kelly&nbsp;<br><br>loved thailand offbeat experiences (especially sad yant and blind massage)&nbsp;<br><br>Sent thailand offbeat, Thailand all year round and ICS active presentation&nbsp;</div>', '2025-06-07 01:03:34', '2025-06-07 01:03:34'),
(103, 5, 168, 16, 154, 'Julien met Alison', '<div>Sent presentation thailand offbeat &amp; agenda</div><div>She liked the Phong Nha caves: send expe. products &amp; &nbsp;china expeditions</div><div>Liked the public transport day trips<br><br></div>', '2025-06-09 22:06:12', '2025-06-09 22:06:12'),
(104, 5, 169, 16, 155, 'Julien met with Charlie', '<div>loved the Thailand all year round&nbsp;<br>asked for an itinerary covering 2-3 national parks.&nbsp;<br><br></div>', '2025-06-09 22:53:44', '2025-06-09 22:53:44'),
(105, 5, 170, 16, 156, 'Julien met with Sarah', '<div>sarah is not Asia specialist, but will share our presentations with relevant teams&nbsp;<br>She loved blind massage idea. intro to thai boxing&nbsp;<br><br>She asked if only staff was handling multi country requests, it seems very important for them&nbsp;</div>', '2025-06-09 23:40:00', '2025-06-09 23:40:00'),
(106, 5, 171, 17, 157, 'Julien met Lalka', '<div>Put her in contact with Paul&nbsp;<br><br>Liked hacker craft boat</div>', '2025-06-09 23:58:18', '2025-06-09 23:58:18'),
(107, 5, 172, 17, 158, 'Julien met Martina', '<div>interested in Malayia<br>send honeymoon in thailand&nbsp;<br>agent hub&nbsp;<br>presentation&nbsp;</div>', '2025-06-10 00:18:42', '2025-06-10 00:18:42'),
(108, 5, 176, 18, 162, 'Julien met with Miguel', '<div>We met Miguel at Rosewood BKK for welcome dinner (Latam fam trip organized by Leo)&nbsp;</div>', '2025-06-10 04:21:15', '2025-06-10 04:21:15'),
(109, 5, 178, 17, 163, 'Julien met Mary', '<div>Mary too many rqs for Japan&nbsp;<br>never went to Thailand!<br>loves wellness<br>sent wellness program&nbsp;</div>', '2025-06-10 05:14:22', '2025-06-10 05:14:22'),
(110, 5, 179, 17, 164, 'meeting missed', '<div>Eric couldn\'t come but passed by quickly&nbsp;<br>sent follow up</div>', '2025-06-10 05:14:58', '2025-06-10 05:14:58'),
(111, 5, 180, 17, 165, 'Julien met with Thiago', '<div><strong>Cozy - Serependians&nbsp;</strong></div><div>They have 5 advisors</div><div>looks for Asia DMC&nbsp;</div><div>&nbsp;he loved China, Japan</div><div>wanst to come to TH, VN, KH&nbsp;</div><div>turnouarnd time is key&nbsp;</div><div>wants access to Hub&nbsp;</div><div><br><br></div>', '2025-06-11 22:34:26', '2025-06-11 22:34:26'),
(112, 5, 181, 17, 90, 'Julien Met with Michael', '<div>shared Thailand offbeat and Style</div>', '2025-06-11 23:35:24', '2025-06-11 23:35:24'),
(113, 5, 83, 17, 89, 'Julien met again with Marianthi', '<div>resend thailand offbeat and Style</div>', '2025-06-11 23:39:49', '2025-06-11 23:39:49'),
(114, 5, 91, 17, 92, 'Julien met again with Mariana', '<div>sent updated th offbeat and Style</div>', '2025-06-11 23:46:18', '2025-06-11 23:46:18'),
(115, 5, 182, 17, 76, 'Julien met Cristina', '<div>Cristina showed some interest to Indonesia</div>', '2025-06-12 00:10:23', '2025-06-12 00:10:23'),
(116, 5, 183, 17, 166, 'Julien Met Jack', '<div>private jet company&nbsp;<br>they are looking for experiences only<br>sent offbeat and Style&nbsp;</div>', '2025-06-12 00:22:59', '2025-06-12 00:22:59'),
(117, 5, 184, 17, 167, 'Julien met with Giacomo', '<div>Sent thailand offbeat</div>', '2025-06-12 00:46:13', '2025-06-12 00:46:13'),
(118, 5, 185, 17, 168, 'Julien met with Nina', '<div>send offbeat th presentation and Style</div><div>access to the Hub&nbsp;</div><div>love guide bios ideas</div>', '2025-06-12 00:54:19', '2025-06-12 00:54:19'),
(119, 5, 186, 17, 169, 'Julien met with Asta', '<div>send logins once Agent Hub is ready</div><div>send th offbeat presentation&nbsp;</div><div>lived in Malaysia and SG 10 years</div>', '2025-06-12 01:06:46', '2025-06-12 01:06:46'),
(120, 5, 187, 17, 170, 'Julien met with Marcus', '<div>come in BKK September 4 days&nbsp;</div><div>japan&nbsp;</div><div>indonesia - Bali in Feb&nbsp;</div>', '2025-06-12 01:15:02', '2025-06-12 01:15:02'),
(121, 5, 188, 17, 171, 'Julien met with Tony', '<div>One request for BKK, Khanom<br>confirmed</div>', '2025-06-12 21:42:01', '2025-06-12 21:42:01'),
(122, 5, 189, 17, 96, 'Julien met with Ruth', '<div>they have a rq for&nbsp;<br>Seoul&nbsp;</div><div>Shanghai,</div><div>Hong-Kong&nbsp;</div><div>Bangkok</div><div>Singapore&nbsp;</div><div><br>check viasa procedures for mexicans &nbsp;</div><div><br></div><div>access to the hub&nbsp;</div><div><br></div>', '2025-06-12 22:04:02', '2025-06-12 22:04:02'),
(123, 5, 190, 17, 172, 'Julien met with Dan', '<div>very interested in JP</div><div>CHina</div><div>woring in Asia Concierge&nbsp;</div><div>pty him in contcat with Paul&nbsp;</div><div>payment terms&nbsp;</div><div>liked bind massae&nbsp;</div>', '2025-06-12 22:24:14', '2025-06-12 22:24:14'),
(124, 5, 191, 17, 173, 'Julien met with Fernanda', '<div>transparency about guides</div><div>have a lot of families</div>', '2025-06-12 23:34:16', '2025-06-12 23:34:16'),
(125, 5, 192, 17, 120, 'Julien met with Paul', '<div>was in BKK in February</div><div>based in TOronto&nbsp;</div><div>met witrh Lisa, Paul&nbsp;</div><div><br></div><div>summer travel&nbsp;</div><div>Family business</div><div><br><br></div>', '2025-06-13 00:02:30', '2025-06-13 00:02:30'),
(126, 5, 195, 17, 174, 'Julien met with Juergen', '<div>Juergen is German and his wife is Russian&nbsp;<br>They want to expand on both markets</div>', '2025-06-13 00:41:42', '2025-06-13 00:41:42'),
(127, 5, 196, 17, 175, 'Julien met with Theresa', '<div>lot of business in Japan<br>have groups sometimes</div>', '2025-06-13 01:14:40', '2025-06-13 01:14:40'),
(128, 5, 66, 19, 60, 'VN & S.Korea', '<div>exchanged some ideas on how to promote VN with Riskja. Sent a presentation&nbsp;<br><br>Put Carsten and Birgit in contact for S. Korea.&nbsp;</div>', '2025-11-11 23:23:17', '2025-11-11 23:23:17'),
(129, 5, 140, 19, 132, 'Alice, Lea, BEth ', '<div>THey are ready to move with us. sent all our themed packages<br>Alice is planning trip to VN&nbsp;</div>', '2025-11-13 02:19:13', '2025-11-13 02:19:13'),
(130, 5, 214, 19, 191, 'Julien met with Cassie', '<div>Cassie is looking for new iti in Thailand. We will be part of the bid 2026.&nbsp;</div>', '2025-11-14 18:31:58', '2025-11-14 18:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('riskiandrean31@gmail.com', '$2y$10$eSDoqlTGH5oc2x/RC5VUVedvCV9spfu4FYrZ5AEv0lKNDhVJhb7pe', '2023-04-12 03:21:20');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `send_mails`
--

CREATE TABLE `send_mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Fq0c5UL4pwORgqCKqDRIsSzHqVdL36WFoM6vAnOy', NULL, '171.103.248.209', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiN1RpYmxaS1JCb1MzdFdYMUhpQmE5TTQ3RTJzWXBOMU5mUnhVbVl2SCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1MjoiaHR0cDovL2ljcy1ub3Rlcy5pbmZpbml0eWZyZWVhcHAuY29tL2FsbENvbnRhY3RzP2k9MSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwOi8vaWNzLW5vdGVzLmluZmluaXR5ZnJlZWFwcC5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765850517),
('jCmEeYsqnI1jKy5hSNAkzZUzzmrli46i2pSvCtH0', NULL, '202.93.153.68', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkx3aUc4UFNlcXZ3cFVPUGI4QU9zVEZwTVNPc3g2YjFYcGRrVFpobSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDc6Imh0dHBzOi8vaWNzLW5vdGVzLmluZmluaXR5ZnJlZWFwcC5jb20vbG9naW4/aT0xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765420581),
('mObmj4VFqsgVrovCOb8UL4h95n6MVIpBu1fRs4GZ', NULL, '175.45.186.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ3VQY3NmdjhzOVFJUHRDek41anBxM3NjVGhNaUhFWTlVeGR3QWd0WiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1NToiaHR0cHM6Ly9pY3Mtbm90ZXMuaW5maW5pdHlmcmVlYXBwLmNvbS9mb3JtSW5wdXROb3RlP2k9MSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQzOiJodHRwczovL2ljcy1ub3Rlcy5pbmZpbml0eWZyZWVhcHAuY29tL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765184929),
('OaRw8hUyLZAvguyMZaCALqEhZ4xSI02BAqVs3lNy', NULL, '103.106.216.69', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkVZSHFkNjU3TEZjZ25IWkFteldQRXpXSnZVYjRjY25nZzBBU2pDMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHBzOi8vaWNzLW5vdGVzLmluZmluaXR5ZnJlZWFwcC5jb20vP2k9MSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1765187138),
('Od4tNNyi9Gv05sWmN1ktOHo0T1O6QoCnmfEziNhF', 9, '119.15.85.231', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiS1lGQ3pIS0NQUnBaUHRDc05FVUl2SmFKa1pKZVRNcnpsellNcm40ViI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ4OiJodHRwczovL2ljcy1ub3Rlcy5pbmZpbml0eWZyZWVhcHAuY29tL2V2ZW50cz9pPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo5O3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJG5DaDkzY3BFZTVDUU1UUzVhQmVoOHV6YUEyeFQyajR5U3ljcEhQNlA1NUlGeC9DN3lsVlZXIjt9', 1765420577),
('otgOgcMDd5gJTpaspFfqJVwiLUFRsXXsAiyq4KpA', NULL, '103.135.25.106', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQnBHRWpMSXhKVndoblJzQ0E3SlVrcm1oeEtDa0E2Vkp5aGRFMm9EbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vaWNzLW5vdGVzLmluZmluaXR5ZnJlZWFwcC5jb20vbG9naW4iO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjQ3OiJodHRwczovL2ljcy1ub3Rlcy5pbmZpbml0eWZyZWVhcHAuY29tL2NvbXBhbmllcyI7fX0=', 1765187142),
('wJv5jo9Wq41yVzWAZ5yBP4G3sYMOhyqLKywRh5xZ', NULL, '36.50.157.21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoickJTS3NEZk9uWWozVUhJSm8wS3NxNks3RGNtS3kyZlRKWjJ4QzZVYSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0ODoiaHR0cHM6Ly9pY3Mtbm90ZXMuaW5maW5pdHlmcmVlYXBwLmNvbS9ldmVudHM/aT0yIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vaWNzLW5vdGVzLmluZmluaXR5ZnJlZWFwcC5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765184927),
('XWUYGIZYHDf3X7JwEMmaYTSBgooMuU0I5xoUR2PJ', NULL, '38.43.64.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiajRUME10alM0V24xR2FrMDNYbDdKY0VOeVdzQUhhMUlZbjE4ZEF1WCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo1MToiaHR0cHM6Ly9pY3Mtbm90ZXMuaW5maW5pdHlmcmVlYXBwLmNvbS9jb21wYW5pZXM/aT0xIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHBzOi8vaWNzLW5vdGVzLmluZmluaXR5ZnJlZWFwcC5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765187156);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'herman\'s Team', 1, '2023-04-12 01:31:51', '2023-04-12 01:31:51'),
(2, 2, 'yoga\'s Team', 2, '2023-04-12 03:21:14', '2023-04-12 03:21:14'),
(3, 3, 'marc\'s Team', 3, '2023-04-12 08:38:03', '2023-04-12 08:38:03'),
(4, 4, 'carsten\'s Team', 4, '2023-04-12 08:38:33', '2023-04-12 08:38:33'),
(5, 5, 'Julien\'s Team', 1, '2023-11-11 15:52:28', '2023-11-11 15:52:28'),
(6, 6, 'IT\'s Team', 1, '2023-11-14 12:29:35', '2023-11-14 12:29:35'),
(7, 7, 'SuSu\'s Team', 1, '2024-05-10 17:14:14', '2024-05-10 17:14:14'),
(8, 8, 'Aaron\'s Team', 1, '2024-05-10 17:16:15', '2024-05-10 17:16:15'),
(9, 9, 'Narith\'s Team', 1, '2024-06-04 13:43:55', '2024-06-04 13:43:55'),
(10, 10, 'Ngurah\'s Team', 1, '2024-07-23 19:49:25', '2024-07-23 19:49:25'),
(11, 11, 'Lukman\'s Team', 1, '2024-11-19 17:44:59', '2024-11-19 17:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Herman Hoven', 'herman@icstravelgroup.com', NULL, '$2y$10$hqo9m80onuTsAZyQ1AKkJuxAJrBo85HlUmX4s9OxgigmeCA6jQ0dS', NULL, NULL, NULL, 'wlMSbPTWgdoQbnXtIFRll0OSRf4gDq7Uf3Qbg5h9z7GH1MeX78jziUL8m0L8', NULL, NULL, '2023-02-21 17:21:43', '2024-02-19 13:30:31'),
(2, 'Yoga Rizky', 'yoga@icstravelgroup.com', NULL, '$2y$10$pbmt7R9v.TOTMX.CkOA39.az2aPk4I82sAU55.lxV4r.nSkyEF/Z6', NULL, NULL, NULL, 'vYQoPxyCtZC3gPp4w8XXMT4GCxAMP5vLfs30CtqDTxcLDKwngRxwKSWUzbFR', NULL, NULL, '2023-02-23 09:56:43', '2024-02-15 19:38:43'),
(3, 'Marc de Swart', 'marc@icstravelgroup.com', NULL, '$2y$10$dTyubYbCtEaMl8Ryye5eK.KTIWXVjBt3.Qbp5m2qyWQ3r3z0qT7.i', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-23 12:27:07', '2023-02-23 12:27:07'),
(4, 'Carsten Schmidt', 'carsten@icstravelgroup.com', NULL, '$2y$10$q700R3Fg1xYwRi9zCd83..0nuj1ph8eLodtovu8I3RggL5oudje2u', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-23 12:27:44', '2023-02-23 12:27:44'),
(5, 'Julien Monnerie', 'julien@icstravelgroup.com', NULL, '$2y$10$4BV5xbVQ3eApV3n3XtJlnuUR1bP507UkCt9Lw2bqY1sEsVtF987oe', NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-11 15:52:28', '2023-11-11 15:52:28'),
(6, 'IT Indonesia', 'it-id@icstravelgroup.com', NULL, '$2y$10$J9Q7Ug4f5BgH8NS3meJ1UufIR5zgafaFVD4GJrI8GoMK.PKV/vWN.', NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-14 12:29:35', '2023-11-14 12:29:35'),
(7, 'SuSu Tran', 'susujd@jdtoursvietnam.com', NULL, '$2y$10$joJ1tdYrfI.ekP8kAhaPdO.Gotggh5pJxV8POh2ii8.AlYTEZVdnO', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-10 17:14:13', '2025-03-14 22:40:22'),
(8, 'Aaron Edgington', 'aaron@jdtoursvietnam.com', NULL, '$2y$10$/KGMgH5BFv7JSgoXnUUgF.OZqolDURKpEoTymyjPeMC0rim3cENi2', NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-10 17:16:15', '2024-05-10 17:16:15'),
(9, 'Narith', 'narith@integratedcustomerservices.com', NULL, '$2y$10$nCh93cpEe5CQMTS5aBeh8uzaA2xT2j4ySycpHP6P55IFx/C7ylVVW', NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-04 13:43:55', '2024-06-04 13:43:55'),
(10, 'Ngurah', 'ngurah@icstravelgroup.com', NULL, '$2y$10$pNww7F1dKm15ppyNtqI11.njCKdvpAXVpvG.YvjcTaO6YCdEDfsQa', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 19:49:25', '2024-07-23 19:49:25'),
(11, 'Lukman Tassaka', 'lukman@icstravelgroup.com', NULL, '$2y$10$YRG5I0HQ2bSSiJZbl.ISXu5tplLPggYTr/k/QZVT1HJ6h9W2qYUla', NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-19 17:44:59', '2024-11-19 17:44:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `send_mails`
--
ALTER TABLE `send_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `send_mails`
--
ALTER TABLE `send_mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
