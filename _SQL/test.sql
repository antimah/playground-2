-- MySQL dump 10.13  Distrib 8.0.25, for macos10.14 (x86_64)
--
-- Host: localhost    Database: blogdb
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_id_unique` (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'est','2021-07-19 11:10:48','2021-07-19 11:10:48'),(2,'nostrum','2021-07-19 11:10:48','2021-07-19 11:10:48'),(3,'quia','2021-07-19 11:10:48','2021-07-19 11:10:48'),(4,'molestiae','2021-07-19 11:10:48','2021-07-19 11:10:48'),(5,'recusandae','2021-07-19 11:10:48','2021-07-19 11:10:48'),(6,'ipsa','2021-07-19 11:10:48','2021-07-19 11:10:48'),(7,'perspiciatis','2021-07-19 11:10:48','2021-07-19 11:10:48'),(8,'quaerat','2021-07-19 11:10:48','2021-07-19 11:10:48'),(9,'fuga','2021-07-19 11:10:48','2021-07-19 11:10:48'),(10,'iure','2021-07-19 11:10:48','2021-07-19 11:10:48'),(11,'dicta','2021-07-19 11:10:48','2021-07-19 11:10:48'),(12,'id','2021-07-19 11:10:48','2021-07-19 11:10:48'),(13,'exercitationem','2021-07-19 11:10:48','2021-07-19 11:10:48'),(14,'aut','2021-07-19 11:10:48','2021-07-19 11:10:48'),(15,'animi','2021-07-19 11:10:48','2021-07-19 11:10:48');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'asdasddwdd',1,16,'2021-07-19 12:22:24','2021-07-19 12:22:24'),(2,'wud u mean bruv',1,17,'2021-07-19 18:59:51','2021-07-19 18:59:51');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_06_12_191927_create_posts_table',1),(5,'2021_06_16_171648_create_categories_table',1),(6,'2021_07_15_180935_create_comments_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_id_unique` (`id`),
  UNIQUE KEY `posts_title_unique` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'Qui ut provident molestiae et optio odio sed corporis.','Deleniti minima incidunt nulla in est aliquid soluta. In incidunt quaerat tenetur sit et aliquam.','Voluptas perspiciatis perspiciatis fugit non omnis illo est excepturi. Consectetur officiis at adipisci quia assumenda atque dignissimos. Quis quo dolores atque ut ipsa. Id quam voluptatem esse est officiis. Eligendi molestiae ratione dolorem pariatur.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(2,2,2,'Voluptatibus deleniti et a voluptates.','Quam delectus quas dolor velit architecto. Tempora quia sequi atque placeat fuga.','Quia alias non sunt consequatur ad eveniet quo. Dolores soluta dolor deleniti rem sint. Reprehenderit rerum quia asperiores qui inventore in inventore.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(3,3,3,'Ut laudantium iusto quis.','Libero eius debitis consequatur est aliquid harum quaerat ut. Est rerum nihil modi a.','Voluptas voluptatem asperiores est. Enim autem non repellendus facere occaecati. Maxime laudantium ad voluptate tempore non blanditiis excepturi sed.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(4,4,4,'Repellat tempore sit qui magnam voluptas et.','Voluptas cumque occaecati voluptatem esse in. Assumenda nobis ea velit quas odit.','Non aut accusamus doloremque est facere ut amet. Et ipsum ab quibusdam consectetur explicabo qui voluptatem. Quisquam labore voluptate beatae soluta sunt. Accusamus cumque autem animi temporibus adipisci.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(5,5,5,'Eum fuga ipsa sapiente molestiae eum.','Incidunt laboriosam deleniti harum pariatur quia cupiditate. Unde voluptatibus odit et sunt tempora ducimus fugit. Quia soluta voluptatem quia ex expedita consequatur officiis nam.','Itaque aut vero corporis quia. Veniam quidem autem occaecati aliquid sed nihil quo. Repellat fugiat dolor exercitationem dolore eaque voluptates libero sunt.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(6,6,6,'Quam error vel non magni architecto ex.','Architecto quis rerum quibusdam qui cum perspiciatis et est. Vitae cum doloribus dolorem non.','Omnis eveniet cumque ea perferendis. Qui veritatis quae qui ducimus cum quo dolores.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(7,7,7,'Debitis consequuntur omnis et quas.','Delectus quis vel adipisci magni doloremque porro et. Rerum cupiditate enim vel et. Consequuntur dolorum minus saepe qui expedita quis.','Minima expedita corporis autem vero soluta quae. Voluptas deserunt dolorem totam unde placeat a et. Velit quidem provident quaerat distinctio impedit.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(8,8,8,'Debitis repellat qui asperiores enim expedita modi.','Rerum sint numquam consequatur ut similique. Maxime corporis doloremque ea eos.','Ut nobis voluptatem cumque culpa. Voluptate et aut dolores fuga mollitia modi. Dolor vitae debitis inventore quas. Reiciendis qui perferendis qui ab enim. Sint aut repellendus dolores ullam.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(9,9,9,'Fugit quisquam animi dolore magnam.','Magnam et voluptatibus omnis quis nihil in est necessitatibus. Omnis et ut est occaecati in. Consequatur tempore sint beatae ratione laborum.','Et officia perspiciatis ipsam voluptatem nemo aut voluptatem praesentium. Dolores voluptate velit quia qui voluptatum. Perspiciatis consequatur natus voluptas.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(10,10,10,'Facilis dolorum molestiae voluptatem officiis.','Aliquid vel delectus nobis quasi consequatur atque ad. Temporibus non nisi exercitationem sunt deleniti voluptas accusamus. Laboriosam eum voluptas aut cupiditate.','Ut adipisci hic amet qui et a. Quo vero veniam repudiandae est voluptas. Quas quia laboriosam id aperiam. Dolore ea tempora nostrum laborum amet animi.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(11,11,11,'Occaecati eos veniam ut et repellat dolores.','Enim sed recusandae labore nulla asperiores. Nobis facilis optio aut recusandae.','Dignissimos atque illo est quo et quia quia. Maiores eos debitis dolorum. Esse adipisci voluptatem voluptas nihil minima.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(12,12,12,'Voluptates odio est impedit asperiores dolores dolor alias.','Magnam et minima excepturi dolores asperiores enim. Delectus laudantium possimus qui.','Voluptas quos eum provident nihil consequatur numquam aliquam. Architecto qui praesentium eum ut voluptas quia ut. Voluptatem voluptas voluptatem at corporis ad inventore cum. Fugiat et sunt sit itaque non voluptas. Doloribus quisquam non sit perspiciatis soluta quos.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(13,13,13,'Illum eveniet ab reiciendis adipisci in odio.','Adipisci in quisquam est. Ut nihil corrupti repellat vel est adipisci aut corrupti. Similique facere sunt nisi ipsam.','Omnis veniam quidem recusandae est veritatis consequatur nam. Et rem culpa qui eos enim voluptas voluptates ut. Consectetur dolor voluptatem dolorum ut quibusdam non aut sit. Eos facilis hic accusamus magni aut.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(14,14,14,'Consectetur aperiam laudantium minus fugit sit.','Atque veritatis voluptas nobis dolor amet sit. Ut eos est eum esse itaque repudiandae asperiores.','Quis ipsa incidunt qui fugiat. Est eos molestias occaecati voluptas. Quia voluptates explicabo sapiente. Nisi in unde et eius. Sit quisquam doloremque aperiam facere aliquid dolores.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48'),(15,15,15,'Corporis doloribus non id commodi molestias omnis.','Sed sed sapiente rerum repellendus eligendi odio magnam. Ut qui nihil voluptatem illum ea. Ducimus nihil omnis deleniti iusto iste sed qui.','Eligendi iure libero eos id adipisci autem sit mollitia. Officiis eligendi quia sit voluptatem. Est alias quia quaerat sit cum.',NULL,'2021-07-19 11:10:48','2021-07-19 11:10:48');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'flatley.cortez','Clifton Jacobi','maryam.daniel@example.org','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','TxD6L7yeYg','2021-07-19 11:10:48','2021-07-19 11:10:48'),(2,'sid.ferry','Heidi Block','franecki.matteo@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','NQ4ZK2WArp','2021-07-19 11:10:48','2021-07-19 11:10:48'),(3,'loma.hartmann','Jerry Ernser','solon.anderson@example.net','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','ZcECHw0PnP','2021-07-19 11:10:48','2021-07-19 11:10:48'),(4,'wschiller','Melany Goyette','rwest@example.net','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','6Ze0uWdMrJ','2021-07-19 11:10:48','2021-07-19 11:10:48'),(5,'margaret38','Mrs. Lois Kertzmann DDS','clarabelle.koss@example.net','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Vt21NlfbZ3','2021-07-19 11:10:48','2021-07-19 11:10:48'),(6,'lorenza.dickinson','Dr. Alison Shanahan','yvonne63@example.org','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4qDMnbeYfO','2021-07-19 11:10:48','2021-07-19 11:10:48'),(7,'juwan85','Raegan Feeney','cleveland.bashirian@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','RANyJ8yysQ','2021-07-19 11:10:48','2021-07-19 11:10:48'),(8,'cassie46','Dr. Leonor Batz IV','ckuhlman@example.org','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','UqdIAbyEew','2021-07-19 11:10:48','2021-07-19 11:10:48'),(9,'nschroeder','Camren Cole','pollich.hailie@example.net','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','gBTwRHbQFg','2021-07-19 11:10:48','2021-07-19 11:10:48'),(10,'hunter48','Dr. Cyrus Padberg','champlin.berniece@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','y4qFi1IRJA','2021-07-19 11:10:48','2021-07-19 11:10:48'),(11,'tcarter','Lincoln Hermiston','justus.gibson@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','T3sYzGqNDM','2021-07-19 11:10:48','2021-07-19 11:10:48'),(12,'emil88','Mrs. Trycia Johns Jr.','satterfield.neoma@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','YULN4NxdZC','2021-07-19 11:10:48','2021-07-19 11:10:48'),(13,'miller.jeanette','Alyson Carroll','rodolfo28@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bbSv9yVIXw','2021-07-19 11:10:48','2021-07-19 11:10:48'),(14,'mfranecki','Dr. Brionna Harris V','evangeline43@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','lgPLVt6XcI','2021-07-19 11:10:48','2021-07-19 11:10:48'),(15,'feeney.aglae','Mr. Hudson Paucek I','jesus.dibbert@example.com','2021-07-19 11:10:48','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','563SjOPkIo','2021-07-19 11:10:48','2021-07-19 11:10:48'),(16,'kamber','koko','koko@gmx.com',NULL,'$2y$10$lpbWQcw1SF8dgzgmCkcf1efEBTG9PQPWUqlU6d66XXlCIWjqGEcaq',NULL,'2021-07-19 12:18:21','2021-07-19 12:18:21'),(17,'kamberz','kamber','kamber@gmx.com',NULL,'$2y$10$09OtACU9ylnfG7pWCi62/OzWYF5lfyRNPiIAA4TAHdU2X1QacDUMG',NULL,'2021-07-19 18:59:03','2021-07-19 18:59:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-21 18:25:45
