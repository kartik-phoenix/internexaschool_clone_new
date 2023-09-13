-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 13, 2023 at 03:57 PM
-- Server version: 8.0.34-0ubuntu0.22.04.1
-- PHP Version: 8.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_school_update`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_calendars`
--

CREATE TABLE `academic_calendars` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_id` bigint UNSIGNED DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instructions` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `points` int DEFAULT NULL,
  `resubmission` tinyint(1) NOT NULL DEFAULT '0',
  `extra_days_for_resubmission` int DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_submissions`
--

CREATE TABLE `assignment_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `assignment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `points` int DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = Pending/In Review , 1 = Accepted , 2 = Rejected , 3 = Resubmitted',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` int NOT NULL,
  `student_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `type` tinyint NOT NULL COMMENT '0=Absent, 1=Present',
  `date` date NOT NULL,
  `remark` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'SC', 1, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(2, 'ST', 1, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(3, 'OBC', 1, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(4, 'General', 1, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `name`, `medium_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '9', 2, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(2, '10', 2, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_sections`
--

CREATE TABLE `class_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `section_id` int NOT NULL,
  `class_teacher_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_sections`
--

INSERT INTO `class_sections` (`id`, `class_id`, `section_id`, `class_teacher_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(2, 1, 2, NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(3, 2, 1, NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(4, 2, 2, NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(5, 2, 3, NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_subjects`
--

CREATE TABLE `class_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Compulsory / Elective',
  `subject_id` int NOT NULL,
  `elective_subject_group_id` int DEFAULT NULL COMMENT 'if type=Elective',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elective_subject_groups`
--

CREATE TABLE `elective_subject_groups` (
  `id` bigint UNSIGNED NOT NULL,
  `total_subjects` int NOT NULL,
  `total_selectable_subjects` int NOT NULL,
  `class_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `publish` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_classes`
--

CREATE TABLE `exam_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `class_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE `exam_marks` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_timetable_id` int NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `teacher_review` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_status` tinyint(1) NOT NULL COMMENT '1=Pass, 0=Fail',
  `session_year_id` int NOT NULL,
  `grade` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `student_id` int NOT NULL,
  `total_marks` int NOT NULL,
  `obtained_marks` int NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `grade` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_timetables`
--

CREATE TABLE `exam_timetables` (
  `id` bigint UNSIGNED NOT NULL,
  `exam_id` int NOT NULL,
  `class_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `total_marks` int NOT NULL,
  `passing_marks` int NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_choiceables`
--

CREATE TABLE `fees_choiceables` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `fees_type_id` int DEFAULT NULL,
  `is_due_charges` tinyint NOT NULL COMMENT '0 - no 1 - yes',
  `total_amount` double NOT NULL,
  `session_year_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `payment_transaction_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_classes`
--

CREATE TABLE `fees_classes` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` int NOT NULL,
  `fees_type_id` int NOT NULL,
  `choiceable` tinyint NOT NULL COMMENT '0 - no 1 - yes',
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_paids`
--

CREATE TABLE `fees_paids` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int DEFAULT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `mode` smallint DEFAULT NULL COMMENT '0 - cash 1 - cheque 2 - online',
  `payment_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double NOT NULL,
  `is_fully_paid` tinyint NOT NULL DEFAULT '1' COMMENT '0 - no 1 - yes',
  `date` date NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees_types`
--

CREATE TABLE `fees_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `modal_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_thumbnail` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 = File Upload, 2 = Youtube Link, 3 = Video Upload, 4 = Other Link',
  `file_url` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint UNSIGNED NOT NULL,
  `starting_range` int NOT NULL,
  `ending_range` int NOT NULL,
  `grade` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `installment_fees`
--

CREATE TABLE `installment_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `due_charges` int NOT NULL COMMENT 'in percentage (%)',
  `session_year_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_rtl` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '1=>active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_topics`
--

CREATE TABLE `lesson_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `lesson_id` int NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mediums`
--

CREATE TABLE `mediums` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mediums`
--

INSERT INTO `mediums` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Hindi', NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47'),
(2, 'English', NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47'),
(3, 'Gujarati', NULL, '2023-09-12 08:27:47', '2023-09-12 08:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_01_044234_create_settings_table', 1),
(6, '2022_04_01_091033_create_permission_tables', 1),
(7, '2022_04_01_105826_all_tables', 1),
(8, '2022_04_27_072441_parent_changes', 1),
(9, '2022_04_28_105419_add_day_name_to_timetables_table', 1),
(10, '2022_04_29_164836_add_class_section_id_to_timetables', 1),
(11, '2022_05_03_053843_add_lesson_files', 1),
(12, '2022_05_06_071034_create_holidays_table', 1),
(13, '2022_05_11_063841_add_sliders', 1),
(14, '2022_05_13_041458_add_date_to_session_years_table', 1),
(15, '2022_05_16_045021_add_class_secion_id_to_attendances', 1),
(16, '2022_05_19_053446_add_fcm_id_to_users', 1),
(17, '2022_05_31_133456_add_reset_request_to_users', 1),
(18, '2022_06_03_060653_create_student_sessions_table', 1),
(19, '2022_06_07_065946_create_languages_table', 1),
(20, '2022_07_18_044243_is_rtl_in_language', 1),
(21, '2022_07_25_103347_create_exams_table', 1),
(22, '2022_11_11_065720_fees_module', 1),
(23, '2022_12_08_044452_generate_roll_number', 1),
(24, '2022_12_12_033204_online_exam_module', 1),
(25, '2023_02_14_164618_update_online_exam_to_class_section', 1),
(26, '2023_06_02_100137_change_fee_choiceable_to_class', 1),
(27, '2023_06_02_100328_create_installment_fees_table', 1),
(28, '2023_06_05_104000_create_paid_installment_fees_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(29, 'App\\Models\\User', 11),
(30, 'App\\Models\\User', 11),
(31, 'App\\Models\\User', 11),
(37, 'App\\Models\\User', 11),
(38, 'App\\Models\\User', 11),
(39, 'App\\Models\\User', 11),
(40, 'App\\Models\\User', 11),
(29, 'App\\Models\\User', 12),
(30, 'App\\Models\\User', 12),
(31, 'App\\Models\\User', 12),
(37, 'App\\Models\\User', 12),
(38, 'App\\Models\\User', 12),
(39, 'App\\Models\\User', 12),
(40, 'App\\Models\\User', 12);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 7),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12);

-- --------------------------------------------------------

--
-- Table structure for table `online_exams`
--

CREATE TABLE `online_exams` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `subject_id` bigint UNSIGNED NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exam_key` bigint NOT NULL,
  `duration` int NOT NULL COMMENT 'in minutes',
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_questions`
--

CREATE TABLE `online_exam_questions` (
  `id` bigint UNSIGNED NOT NULL,
  `class_subject_id` bigint UNSIGNED NOT NULL,
  `question_type` tinyint NOT NULL COMMENT '0 - simple 1 - equation based',
  `question` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_answers`
--

CREATE TABLE `online_exam_question_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `answer` bigint UNSIGNED NOT NULL COMMENT 'option id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_choices`
--

CREATE TABLE `online_exam_question_choices` (
  `id` bigint UNSIGNED NOT NULL,
  `online_exam_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `marks` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_question_options`
--

CREATE TABLE `online_exam_question_options` (
  `id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL,
  `option` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_exam_student_answers`
--

CREATE TABLE `online_exam_student_answers` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `online_exam_id` bigint UNSIGNED NOT NULL,
  `question_id` bigint UNSIGNED NOT NULL COMMENT 'online exam question choice id',
  `option_id` bigint UNSIGNED NOT NULL,
  `submitted_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paid_installment_fees`
--

CREATE TABLE `paid_installment_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `class_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED NOT NULL,
  `installment_fee_id` bigint UNSIGNED NOT NULL,
  `session_year_id` bigint UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `due_charges` double(8,2) DEFAULT NULL,
  `date` date NOT NULL,
  `payment_transaction_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `email`, `mobile`, `occupation`, `image`, `dob`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Sachin', 'Tendulkar', 'Male', 'father@gmail.com', '1234567890', 'Cricketer', 'parents/user.png', NULL, '2023-09-12 08:27:48', '2023-09-12 08:27:48', NULL),
(2, 3, 'Ajit', 'Tendulkar', 'Male', 'guardian@gmail.com', '1234567890', 'Job', 'parents/user.png', NULL, '2023-09-12 08:27:48', '2023-09-12 08:27:48', NULL),
(3, 5, 'Bhadresh', 'patel', 'Male', 'bhadresh.phoenixbs@gmail.com', '990979988', 'Cricketer', 'parents/1694593599-father.jpg', '2023-09-03', '2023-09-13 08:26:39', '2023-09-13 08:26:39', NULL),
(4, 6, 'hardika', 'patel', 'Female', 'hardika.phoenixbs@gmail.com', '990990099', 'Job', 'parents/1694593599-mother.jpg', '2023-09-03', '2023-09-13 08:26:40', '2023-09-13 08:26:40', NULL),
(5, 8, 'kartik', 'patel', 'Male', 'kartik.phoenixbs@gmail.com', '9909877900', 'Cricketer', 'parents/1694594546-father.jpg', '2023-09-03', '2023-09-13 08:42:26', '2023-09-13 08:42:26', NULL),
(6, 9, 'sanjana', 'patel', 'Female', 'sandip.phoenix@gmail.com', '9009980099', 'Job', 'parents/1694594546-mother.jpg', '2023-09-03', '2023-09-13 08:42:27', '2023-09-13 08:42:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` int NOT NULL,
  `class_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `mode` smallint NOT NULL DEFAULT '2' COMMENT '0 - cash 1 - cheque 2 - online',
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_fee` smallint NOT NULL DEFAULT '0' COMMENT '0 - compulosry_full , 1 - installments , 2 -optional',
  `payment_gateway` smallint DEFAULT NULL COMMENT '1 - razorpay 2 - stripe',
  `order_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'order_id / payment_intent_id',
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` tinyint NOT NULL COMMENT '0 - failed 1 - succeed 2 - pending',
  `total_amount` double NOT NULL,
  `date` datetime DEFAULT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'role-list', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(2, 'role-create', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(3, 'role-edit', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(4, 'role-delete', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(5, 'medium-list', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(6, 'medium-create', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(7, 'medium-edit', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(8, 'medium-delete', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(9, 'section-list', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(10, 'section-create', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(11, 'section-edit', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(12, 'section-delete', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(13, 'class-list', 'web', '2023-09-12 08:27:56', '2023-09-12 08:27:56'),
(14, 'class-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(15, 'class-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(16, 'class-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(17, 'subject-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(18, 'subject-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(19, 'subject-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(20, 'subject-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(21, 'teacher-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(22, 'teacher-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(23, 'teacher-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(24, 'teacher-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(25, 'class-teacher-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(26, 'class-teacher-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(27, 'class-teacher-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(28, 'class-teacher-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(29, 'parents-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(30, 'parents-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(31, 'parents-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(32, 'parents-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(33, 'session-year-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(34, 'session-year-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(35, 'session-year-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(36, 'session-year-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(37, 'student-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(38, 'student-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(39, 'student-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(40, 'student-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(41, 'category-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(42, 'category-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(43, 'category-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(44, 'category-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(45, 'subject-teacher-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(46, 'subject-teacher-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(47, 'subject-teacher-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(48, 'subject-teacher-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(49, 'timetable-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(50, 'timetable-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(51, 'timetable-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(52, 'timetable-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(53, 'attendance-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(54, 'attendance-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(55, 'attendance-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(56, 'attendance-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(57, 'holiday-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(58, 'holiday-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(59, 'holiday-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(60, 'holiday-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(61, 'announcement-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(62, 'announcement-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(63, 'announcement-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(64, 'announcement-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(65, 'slider-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(66, 'slider-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(67, 'slider-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(68, 'slider-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(69, 'class-timetable', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(70, 'teacher-timetable', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(71, 'student-assignment', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(72, 'subject-lesson', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(73, 'class-attendance', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(74, 'exam-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(75, 'exam-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(76, 'exam-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(77, 'exam-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(78, 'exam-upload-marks', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(79, 'setting-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(80, 'fcm-setting-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(81, 'assignment-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(82, 'assignment-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(83, 'assignment-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(84, 'assignment-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(85, 'assignment-submission', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(86, 'email-setting-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(87, 'privacy-policy', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(88, 'contact-us', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(89, 'about-us', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(90, 'student-reset-password', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(91, 'reset-password-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(92, 'student-change-password', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(93, 'promote-student-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(94, 'promote-student-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(95, 'promote-student-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(96, 'promote-student-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(97, 'language-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(98, 'language-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(99, 'language-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(100, 'language-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(101, 'lesson-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(102, 'lesson-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(103, 'lesson-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(104, 'lesson-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(105, 'topic-list', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(106, 'topic-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(107, 'topic-edit', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(108, 'topic-delete', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(109, 'class-teacher', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(110, 'terms-condition', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(111, 'assign-class-to-new-student', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(112, 'exam-timetable-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(113, 'grade-create', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(114, 'update-admin-profile', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(115, 'exam-result', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(116, 'fees-type', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(117, 'fees-classes', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(118, 'fees-paid', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(119, 'fees-config', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(120, 'manage-online-exam', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2023-09-12 08:27:57', '2023-09-12 08:27:57'),
(2, 'Teacher', 'web', '2023-09-12 08:27:58', '2023-09-12 08:27:58'),
(3, 'Parent', 'web', '2023-09-12 08:27:58', '2023-09-12 08:27:58'),
(4, 'Student', 'web', '2023-09-12 08:27:58', '2023-09-12 08:27:58');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(79, 1),
(80, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(37, 2),
(45, 2),
(49, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(78, 2),
(81, 2),
(82, 2),
(83, 2),
(84, 2),
(85, 2),
(101, 2),
(102, 2),
(103, 2),
(104, 2),
(105, 2),
(106, 2),
(107, 2),
(108, 2),
(115, 2),
(120, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(2, 'B', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(3, 'C', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `session_years`
--

CREATE TABLE `session_years` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `include_fee_installments` tinyint NOT NULL DEFAULT '0' COMMENT '0 - no 1 - yes',
  `fee_due_date` date NOT NULL DEFAULT '2023-09-12',
  `fee_due_charges` int NOT NULL DEFAULT '0' COMMENT 'in percentage (%)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session_years`
--

INSERT INTO `session_years` (`id`, `name`, `default`, `start_date`, `end_date`, `include_fee_installments`, `fee_due_date`, `fee_due_charges`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2022-23', 1, '2022-06-01', '2023-04-30', 0, '2023-09-12', 0, '2023-09-12 08:27:47', '2023-09-12 10:47:11', NULL),
(2, '2023', 0, '2023-06-01', '2024-04-30', 0, '2023-09-12', 0, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(3, '2024', 0, '2024-06-01', '2025-04-30', 0, '2023-09-12', 0, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(4, '2025', 0, '2025-06-01', '2026-04-30', 0, '2023-09-12', 0, '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `message`) VALUES
(1, 'school_name', 'Internexa School'),
(2, 'school_email', 'admin@gamil.com'),
(3, 'school_phone', '9876543210'),
(4, 'school_address', 'India'),
(5, 'time_zone', 'Asia/Kolkata'),
(6, 'date_formate', 'd-m-Y'),
(7, 'time_formate', 'h:i A'),
(8, 'theme_color', '#4C5EA6'),
(9, 'session_year', '1'),
(10, 'system_version', '1.0.7'),
(11, 'update_warning_modal', '1'),
(12, 'mail_mailer', 'smtp'),
(13, 'email_configration_verification', '1'),
(14, 'mail_host', 'smtp.gmail.com'),
(15, 'mail_port', '587'),
(16, 'mail_username', 'sd125075@gmail.com'),
(17, 'mail_password', 'atjvynxicbhvinae'),
(18, 'mail_encryption', 'tls'),
(19, 'mail_send_from', 'sd125075@gmail.com'),
(20, 'school_tagline', 'Test'),
(21, 'online_payment', '1'),
(22, 'logo1', 'logo/u9JvGPZY2DiQKOX4ddLS8QujCTJsNtTsxcoapbZh.svg'),
(23, 'logo2', 'logo/bKNSOPbYqDJRPQp0XbLapU4U31tk7umDuUAHy7Ia.svg'),
(24, 'favicon', 'logo/rNzDaNIfirTa48D21hvLmiKJteUmqIbMWK0UbThW.svg'),
(25, 'fcm_server_key', 'AAAAlK23jQY:APA91bEHMJQ_Q9XUW6iklhYV7uHMKkrT5IzQ6JkMS8cvWsNR7DSjxvfR81nLDrmqfOa7yAYqQZQHx3um-zSCjZcsIfNaBMNYwdSb1mteVI4XdATksp1bm0PRidl5WUZMPIfYv5qoI6ZY'),
(26, 'privacy_policy', '<p>Effective Date: 24-08-2023</p>\n<p><strong>Introduction</strong></p>\n<p>At Internexa School, we are committed to safeguarding the privacy and security of our students, parents, staff, and other stakeholders. This Privacy Policy outlines how we collect, use, disclose, and protect personal information within our school community. By interacting with Internexa School, you consent to the practices described in this policy.</p>\n<p><strong>Information We Collect</strong></p>\n<p>We collect and process various types of personal information to fulfill educational and administrative purposes. This includes, but is not limited to:</p>\n<ol>\n<li>\n<p>Student Information: This may include names, contact details, birthdates, academic records, health information, and photographs.</p>\n</li>\n<li>\n<p>Parent/Guardian Information: We collect contact details and emergency contact information for effective communication.</p>\n</li>\n<li>\n<p>Staff Information: For our employees, we collect personal and contact details, payroll information, and professional qualifications.</p>\n</li>\n<li>\n<p>School Activities: Information related to student participation in school events, extracurricular activities, and trips.</p>\n</li>\n<li>\n<p>Online Platforms: When using our digital platforms, we may collect IP addresses, browser information, and usage patterns for technical and analytical purposes.</p>\n</li>\n</ol>\n<p><strong>How We Use Information</strong></p>\n<p>We use personal information for the following purposes:</p>\n<ol>\n<li>\n<p>Education and Administration: To provide educational services, manage student records, and communicate with parents/guardians.</p>\n</li>\n<li>\n<p>Safety and Security: To ensure the well-being of our students and staff, including emergency notifications.</p>\n</li>\n<li>\n<p>Communication: To share school updates, events, and important information.</p>\n</li>\n<li>\n<p>Research and Analytics: To improve our educational programs and services.</p>\n</li>\n<li>\n<p>Legal and Regulatory Compliance: To fulfill our legal obligations.</p>\n</li>\n</ol>\n<p><strong>Information Sharing</strong></p>\n<p>We may share personal information with:</p>\n<ol>\n<li>\n<p>School Personnel: Relevant staff members for educational and administrative purposes.</p>\n</li>\n<li>\n<p>Third-Party Service Providers: We may engage trusted third parties to assist with various functions such as IT services, transportation, and catering.</p>\n</li>\n<li>\n<p>Legal Authorities: To comply with legal obligations or respond to legal requests.</p>\n</li>\n<li>\n<p>Parents/Guardians: Information may be shared as needed for the welfare of students.</p>\n</li>\n</ol>\n<p><strong>Data Security</strong></p>\n<p>We implement technical and organizational measures to protect personal information from unauthorized access, disclosure, alteration, or destruction. While we strive to maintain the highest standards of security, no method of data transmission or storage is entirely secure.</p>\n<p><strong>Your Choices</strong></p>\n<p>You have the right to access, correct, and delete your personal information. If you wish to do so or have any concerns about your data, please contact our designated Data Protection Officer (DPO)&nbsp;</p>\n<p><strong>Changes to the Privacy Policy</strong></p>\n<p>This Privacy Policy may be updated from time to time. We will notify you of significant changes through our official communication channels.</p>\n<p><strong>Consent</strong></p>\n<p>By continuing to engage with Internexa School, you consent to the collection, use, and sharing of your personal information as described in this Privacy Policy.</p>\n<p>&nbsp;</p>'),
(27, 'contact_us', '<p><strong>Internexa School</strong></p>\n<div class=\"TzHB6b cLjAic\" data-hveid=\"CFQQAA\" data-ved=\"2ahUKEwjy5O6W7vmAAxURamwGHYJzByAQ04gCKAB6BAhUEAA\">\n<div>\n<div class=\"sATSHe\">\n<div>\n<div class=\"B03h3d V14nKc i8qq8b ptcLIOszQJu__wholepage-card wp-ms\" data-hveid=\"CFAQAA\">\n<div class=\"UDZeY OTFaAf\">\n<div class=\"ceacV\">\n<div class=\"noQ1ef QsDR1c\">\n<div class=\"wDYxhc\" lang=\"en-IN\" data-attrid=\"kc:/local:edit info\" data-md=\"140\" data-hveid=\"CD8QAA\" data-ved=\"2ahUKEwjy5O6W7vmAAxURamwGHYJzByAQkG16BAg_EAA\">\n<div class=\"NgDbBb\">\n<div><strong>Address</strong>: 926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat &ndash; INDIA</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>'),
(28, 'about_us', '<div class=\"PQbOE W2lMue\">\n<div class=\"u9sbk W2lMue\" role=\"heading\" aria-level=\"3\">From Internexa School</div>\n</div>\n<div>Internexa School has provide Best Education With Discipline and Spirituality knowledge in KG SECTION,PRIMARY SECTION,SECONDARY SECTION,HIGHER SECONDARY SECTION (GUJ.MED/ENG.MED) for inquiry call on +91 7574010909</div>'),
(29, 'terms_condition', '<p><strong>Effective Date: 24-08-2023</strong></p>\n<p>These Terms &amp; Conditions (\"Terms\") outline the rules and guidelines for using the services and platforms provided by Internexa School . By accessing or using any of our services, you agree to abide by these Terms. If you do not agree with these Terms, please refrain from using our services.</p>\n<p><strong>1. Acceptable Use</strong></p>\n<p>1.1. You agree to use our services for lawful purposes only and in a manner consistent with applicable laws and regulations.</p>\n<p>1.2. You shall not engage in any activity that could disrupt, damage, or impair our services or networks.</p>\n<p><strong>2. User Accounts</strong></p>\n<p>2.1. Access to certain features of our services may require you to create a user account. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>\n<p>2.2. You must provide accurate and complete information when creating an account. You shall promptly update any changes to this information.</p>\n<p><strong>3. Content Usage</strong></p>\n<p>3.1. Any content provided by [School Name], including but not limited to text, images, videos, and documents, is intended solely for informational and educational purposes.</p>\n<p>3.2. You shall not reproduce, distribute, modify, or create derivative works based on our content without prior written consent.</p>\n<p><strong>4. Data Privacy</strong></p>\n<p>4.1. We collect and process personal information in accordance with our Privacy Policy. By using our services, you consent to our data practices as described therein.</p>\n<p>4.2. You are responsible for any personal data you share through our services, and you must obtain necessary consents before sharing any personal information.</p>\n<p><strong>5. Intellectual Property</strong></p>\n<p>5.1. All intellectual property rights related to our services, including but not limited to trademarks, logos, and content, are owned or licensed by Internexa School.</p>\n<p>5.2. You shall not use our intellectual property without our prior written consent.</p>\n<p><strong>6. Limitation of Liability</strong></p>\n<p>6.1. Internexa School is not liable for any direct, indirect, incidental, consequential, or punitive damages arising from the use of our services.</p>\n<p>6.2. We strive to provide accurate and up-to-date information, but we do not guarantee the accuracy, completeness, or reliability of our content.</p>\n<p><strong>7. Termination</strong></p>\n<p>7.1. We reserve the right to suspend, terminate, or restrict your access to our services at our discretion, without prior notice, if you violate these Terms or engage in any prohibited activities.</p>\n<p><strong>8. Changes to Terms</strong></p>\n<p>8.1. These Terms may be updated from time to time. We will notify users of any significant changes through appropriate communication channels.</p>\n<p><strong>9. Governing Law</strong></p>\n<p>9.1. These Terms are governed by the laws of (Eighty-sixth Amendment) Act, 2002. Any disputes arising from or related to these Terms shall be subject to the exclusive jurisdiction of the courts in Article 21-A&nbsp;.</p>\n<p><strong>10. Contact Information</strong></p>\n<p>10.1. If you have any questions or concerns about these Terms, please contact us at +91 7574010909.</p>\n<p>By using our services, you acknowledge that you have read, understood, and agreed to these Terms &amp; Conditions. If you do not agree with these Terms, please discontinue the use of our services.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'sliders/1694515762-pexels-rdne-stock-project-8364026 (1).jpg', '2023-09-12 10:49:22', '2023-09-12 10:49:22'),
(2, 'sliders/1694515787-pexels-max-fischer-5212695.jpg', '2023-09-12 10:49:47', '2023-09-12 10:49:47'),
(3, 'sliders/1694595077-pexels-rdne-stock-project-8364026 (1).jpg', '2023-09-13 08:51:17', '2023-09-13 08:51:17'),
(4, 'sliders/1694595091-pexels-thirdman-8926648.jpg', '2023-09-13 08:51:31', '2023-09-13 08:51:31'),
(5, 'sliders/1694595103-pexels-max-fischer-5212700.jpg', '2023-09-13 08:51:43', '2023-09-13 08:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `category_id` int NOT NULL,
  `admission_no` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_number` int DEFAULT NULL,
  `caste` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admission_date` date NOT NULL,
  `blood_group` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new_admission` tinyint NOT NULL DEFAULT '1',
  `father_id` int DEFAULT NULL,
  `mother_id` int DEFAULT NULL,
  `guardian_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `class_section_id`, `category_id`, `admission_no`, `roll_number`, `caste`, `religion`, `admission_date`, `blood_group`, `height`, `weight`, `is_new_admission`, `father_id`, `mother_id`, `guardian_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 3, 1, '12345667', 1, 'Hindu', 'Hindu', '2022-04-01', 'B+', '5.5', '59', 1, 1, 2, 3, '2023-09-12 08:27:48', '2023-09-13 08:36:29', '2023-09-13 08:36:29'),
(2, 7, 1, 4, '2022-232', 1, 'Patel', 'Hindu', '2023-09-13', 'A+', '168', '59', 1, 3, 4, 0, '2023-09-13 08:26:40', '2023-09-13 08:26:40', NULL),
(3, 10, 2, 4, '2022-233', 1, 'Patel', 'Hindu', '2023-09-13', 'A+', '168', '59', 1, 5, 6, 0, '2023-09-13 08:42:27', '2023-09-13 08:42:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_online_exam_statuses`
--

CREATE TABLE `student_online_exam_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `online_exam_id` bigint UNSIGNED NOT NULL,
  `status` tinyint NOT NULL COMMENT '1 - in progress 2 - completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_sessions`
--

CREATE TABLE `student_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `result` tinyint NOT NULL DEFAULT '1' COMMENT '1=>Pass,0=>fail',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1=>continue,0=>leave',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_subjects`
--

CREATE TABLE `student_subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `session_year_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_color` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `medium_id` int NOT NULL,
  `type` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Theory / Practical',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `code`, `bg_color`, `image`, `medium_id`, `type`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Maths', 'MA', '#5031f7', 'subject.png', 2, 'Practical', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(2, 'Science', 'SC', '#5031f7', 'subject.png', 2, 'Practical', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(3, 'English', 'EN', '#5031f7', 'subject.png', 2, 'Theory', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(4, 'Gujarati', 'GJ', '#5031f7', 'subject.png', 2, 'Theory', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(5, 'Sanskrit', 'SN', '#5031f7', 'subject.png', 2, 'Theory', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(6, 'Hindi', 'HN', '#5031f7', 'subject.png', 2, 'Theory', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(7, 'Computer', 'CMP', '#5031f7', 'subject.png', 2, 'Practical', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL),
(8, 'PT', 'PT', '#5031f7', 'subject.png', 2, 'Practical', '2023-09-12 08:27:47', '2023-09-12 08:27:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subject_teachers`
--

CREATE TABLE `subject_teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `class_section_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `qualification` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `qualification`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 11, 'test', '2023-09-13 08:46:23', '2023-09-13 08:46:23', NULL),
(2, 12, 'BSC', '2023-09-13 08:48:54', '2023-09-13 08:48:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` bigint UNSIGNED NOT NULL,
  `subject_teacher_id` int NOT NULL,
  `class_section_id` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `note` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day` int NOT NULL COMMENT '1=monday,2=tuesday,3=wednesday,4=thursday,5=friday,6=saturday,7=sunday',
  `day_name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_id` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `current_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `reset_request` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `fcm_id`, `email_verified_at`, `password`, `mobile`, `image`, `dob`, `current_address`, `permanent_address`, `status`, `reset_request`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'super', 'admin', 'male', 'admin@gmail.com', NULL, NULL, '$2y$10$hhSgv6iKxZiAUyulDYzOU.6RDia7Q2TCc/aOf3K.imloBa4bOIU4i', '9909990090', 'user/1694515404-appLogo.png', '1970-01-01', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', 1, 0, NULL, '2023-09-12 08:23:36', '2023-09-12 10:45:16', NULL),
(2, 'Sachin', 'Tendulkar', 'Male', 'father@gmail.com', NULL, NULL, '$2y$10$igfMV7zIYp7MrnN5kY3Ui.x7hJQfrE69VlNIsd.riIYKnxzrhjipu', '1234567890', 'parents/user.png', NULL, 'Mumbai', 'Mumbai', 1, 0, NULL, '2023-09-12 08:27:48', '2023-09-13 08:49:42', '2023-09-13 08:49:42'),
(3, 'Anjali', 'Tendulkar', 'Female', 'mother@gmail.com', NULL, NULL, '$2y$10$ZpPnKbzYG3P7dsHQyOGlSOh2ZFytadBmaZPirgiDFnrWL6nA.Hq3y', '1234567890', 'parents/user.png', NULL, 'Mumbai', 'Mumbai', 1, 0, NULL, '2023-09-12 08:27:48', '2023-09-13 08:49:54', '2023-09-13 08:49:54'),
(4, 'Arjun', 'Tendulkar', 'Male', 'student@gmail.com', NULL, NULL, '$2y$10$HOuKtv.DNi0QJkKrPBOTSeiRspqrOW27P1Izo6yJYNYApLICopnRm', '1234567890', 'students/user.png', NULL, 'Mumbai', 'Mumbai', 1, 0, NULL, '2023-09-12 08:27:48', '2023-09-13 08:36:29', '2023-09-13 08:36:29'),
(5, 'Bhadresh', 'patel', 'Male', 'bhadresh.phoenixbs@gmail.com', NULL, NULL, '$2y$10$BXWBCP3QLdXR.XcOWPtrT.z9gXLT7DctAR4iRqnAPuqvG6BXdTa/a', '990979988', 'parents/1694593599-father.jpg', '2023-09-03', NULL, NULL, 1, 0, NULL, '2023-09-13 08:26:39', '2023-09-13 08:26:39', NULL),
(6, 'hardika', 'patel', 'Female', 'hardika.phoenixbs@gmail.com', NULL, NULL, '$2y$10$4OxbvnW7nelqqZs3Er.mWOP.yJe1F3bCaaUoxBkRHzUzayoYLhrg6', '990990099', 'parents/1694593599-mother.jpg', '2023-09-03', NULL, NULL, 1, 0, NULL, '2023-09-13 08:26:40', '2023-09-13 08:26:40', NULL),
(7, 'rajesh', 'patel', 'male', '2022-232', NULL, NULL, '$2y$10$SP49jTmiGjshdjQrVpOuY.nYFMfKAwPB9xp0UloPaU28He2uoFQly', '990999009', 'students/1694593600-stu2.jpg', '2023-09-13', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', 1, 0, NULL, '2023-09-13 08:26:40', '2023-09-13 08:26:40', NULL),
(8, 'kartik', 'patel', 'Male', 'kartik.phoenixbs@gmail.com', NULL, NULL, '$2y$10$1.HxHml5vFB0MR599ZWx5u1oqTHMzFRUuxp/UFPCVp8wqXTwxnhH.', '9909877900', 'parents/1694594546-father.jpg', '2023-09-03', NULL, NULL, 1, 0, NULL, '2023-09-13 08:42:26', '2023-09-13 08:42:26', NULL),
(9, 'sanjana', 'patel', 'Female', 'sandip.phoenix@gmail.com', NULL, NULL, '$2y$10$I2JSC.D9HZEYqlCvQg0tJezusJjWGfa60LoRbz3xVM9IAn4Pr7yuy', '9009980099', 'parents/1694594546-mother.jpg', '2023-09-03', NULL, NULL, 1, 0, NULL, '2023-09-13 08:42:27', '2023-09-13 08:42:27', NULL),
(10, 'jenis', 'patel', 'male', '2022-233', NULL, NULL, '$2y$10$Xj8F863Exn9n.s2xixvEleXi56jbIG0w6orgKNl6/8ELF66Wl0DcO', '123123131', 'students/1694594547-stu3.jpg', '2023-09-13', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', 1, 0, NULL, '2023-09-13 08:42:27', '2023-09-13 08:42:27', NULL),
(11, 'naina', 'patel', 'female', 'sandip.phoenixbs@gmail.com', NULL, NULL, '$2y$10$JOVmsInA41jeZaKh/QTgSOpDpq3Sx0iSG/9PXP11QT.DboYkFy9yC', '9909999009', 'teachers/1694594820-teach2.jpg', '2023-09-03', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', 1, 0, NULL, '2023-09-13 08:46:23', '2023-09-13 08:47:00', NULL),
(12, 'mayuri', 'desai', 'male', 'ankur.phoenixbs@gmail.com', NULL, NULL, '$2y$10$oqZlye0yfuqHdc6PxOQjEupvddRBuaKytPhWnOEVCLvCGQzcV5p0S', '6354111323', 'teachers/1694598405-teacher1.jpg', '2023-09-04', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', '926, Gala Empire, Drive in Rd, Gurukul, Ahmedabad - 380052 Gujarat – INDIA', 1, 0, NULL, '2023-09-13 08:48:54', '2023-09-13 09:47:14', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_table_type_table_id_index` (`table_type`,`table_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_sections`
--
ALTER TABLE `class_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subjects`
--
ALTER TABLE `class_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_classes`
--
ALTER TABLE `exam_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fees_choiceables`
--
ALTER TABLE `fees_choiceables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_choiceables_payment_transaction_id_index` (`payment_transaction_id`);

--
-- Indexes for table `fees_classes`
--
ALTER TABLE `fees_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_paids`
--
ALTER TABLE `fees_paids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fees_types`
--
ALTER TABLE `fees_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_modal_type_modal_id_index` (`modal_type`,`modal_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `installment_fees`
--
ALTER TABLE `installment_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `installment_fees_session_year_id_index` (`session_year_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_schools`
--
ALTER TABLE `master_schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mediums`
--
ALTER TABLE `mediums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exams_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `online_exams_subject_id_index` (`subject_id`),
  ADD KEY `online_exams_session_year_id_index` (`session_year_id`);

--
-- Indexes for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_questions_class_subject_id_index` (`class_subject_id`);

--
-- Indexes for table `online_exam_question_answers`
--
ALTER TABLE `online_exam_question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_answers_question_id_index` (`question_id`),
  ADD KEY `online_exam_question_answers_answer_index` (`answer`);

--
-- Indexes for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_choices_online_exam_id_index` (`online_exam_id`),
  ADD KEY `online_exam_question_choices_question_id_index` (`question_id`);

--
-- Indexes for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_question_options_question_id_index` (`question_id`);

--
-- Indexes for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `online_exam_student_answers_student_id_index` (`student_id`),
  ADD KEY `online_exam_student_answers_online_exam_id_index` (`online_exam_id`),
  ADD KEY `online_exam_student_answers_question_id_index` (`question_id`),
  ADD KEY `online_exam_student_answers_option_id_index` (`option_id`);

--
-- Indexes for table `paid_installment_fees`
--
ALTER TABLE `paid_installment_fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paid_installment_fees_class_id_index` (`class_id`),
  ADD KEY `paid_installment_fees_student_id_index` (`student_id`),
  ADD KEY `paid_installment_fees_parent_id_index` (`parent_id`),
  ADD KEY `paid_installment_fees_installment_fee_id_index` (`installment_fee_id`),
  ADD KEY `paid_installment_fees_session_year_id_index` (`session_year_id`),
  ADD KEY `paid_installment_fees_payment_transaction_id_index` (`payment_transaction_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session_years`
--
ALTER TABLE `session_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_online_exam_statuses_student_id_index` (`student_id`),
  ADD KEY `student_online_exam_statuses_online_exam_id_index` (`online_exam_id`);

--
-- Indexes for table `student_sessions`
--
ALTER TABLE `student_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_subjects`
--
ALTER TABLE `student_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_calendars`
--
ALTER TABLE `academic_calendars`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment_submissions`
--
ALTER TABLE `assignment_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_sections`
--
ALTER TABLE `class_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `class_subjects`
--
ALTER TABLE `class_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elective_subject_groups`
--
ALTER TABLE `elective_subject_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_classes`
--
ALTER TABLE `exam_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_marks`
--
ALTER TABLE `exam_marks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_timetables`
--
ALTER TABLE `exam_timetables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_choiceables`
--
ALTER TABLE `fees_choiceables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_classes`
--
ALTER TABLE `fees_classes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_paids`
--
ALTER TABLE `fees_paids`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees_types`
--
ALTER TABLE `fees_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `installment_fees`
--
ALTER TABLE `installment_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_topics`
--
ALTER TABLE `lesson_topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_schools`
--
ALTER TABLE `master_schools`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mediums`
--
ALTER TABLE `mediums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `online_exams`
--
ALTER TABLE `online_exams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_answers`
--
ALTER TABLE `online_exam_question_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paid_installment_fees`
--
ALTER TABLE `paid_installment_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `session_years`
--
ALTER TABLE `session_years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_sessions`
--
ALTER TABLE `student_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_subjects`
--
ALTER TABLE `student_subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subject_teachers`
--
ALTER TABLE `subject_teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fees_choiceables`
--
ALTER TABLE `fees_choiceables`
  ADD CONSTRAINT `fees_choiceables_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `installment_fees`
--
ALTER TABLE `installment_fees`
  ADD CONSTRAINT `installment_fees_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exams`
--
ALTER TABLE `online_exams`
  ADD CONSTRAINT `online_exams_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exams_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_questions`
--
ALTER TABLE `online_exam_questions`
  ADD CONSTRAINT `online_exam_questions_class_subject_id_foreign` FOREIGN KEY (`class_subject_id`) REFERENCES `class_subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_answers`
--
ALTER TABLE `online_exam_question_answers`
  ADD CONSTRAINT `online_exam_question_answers_answer_foreign` FOREIGN KEY (`answer`) REFERENCES `online_exam_question_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_question_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_choices`
--
ALTER TABLE `online_exam_question_choices`
  ADD CONSTRAINT `online_exam_question_choices_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_question_choices_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_question_options`
--
ALTER TABLE `online_exam_question_options`
  ADD CONSTRAINT `online_exam_question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `online_exam_student_answers`
--
ALTER TABLE `online_exam_student_answers`
  ADD CONSTRAINT `online_exam_student_answers_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `online_exam_question_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `online_exam_question_choices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `online_exam_student_answers_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paid_installment_fees`
--
ALTER TABLE `paid_installment_fees`
  ADD CONSTRAINT `paid_installment_fees_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_installment_fee_id_foreign` FOREIGN KEY (`installment_fee_id`) REFERENCES `installment_fees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_payment_transaction_id_foreign` FOREIGN KEY (`payment_transaction_id`) REFERENCES `payment_transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_session_year_id_foreign` FOREIGN KEY (`session_year_id`) REFERENCES `session_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `paid_installment_fees_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_online_exam_statuses`
--
ALTER TABLE `student_online_exam_statuses`
  ADD CONSTRAINT `student_online_exam_statuses_online_exam_id_foreign` FOREIGN KEY (`online_exam_id`) REFERENCES `online_exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_online_exam_statuses_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
