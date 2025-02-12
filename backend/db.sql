-- Create Database and Use it
CREATE DATABASE IF NOT EXISTS react_node_app;
USE react_node_app;

-- Create Author Table
CREATE TABLE `author` ( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `name` VARCHAR(255) NOT NULL, 
  `birthday` DATE NOT NULL, 
  `bio` TEXT NOT NULL, 
  `createdAt` DATE NOT NULL, 
  `updatedAt` DATE NOT NULL, 
  PRIMARY KEY (`id`) 
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Create Book Table
CREATE TABLE `book` ( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `title` VARCHAR(255) NOT NULL, 
  `releaseDate` DATE NOT NULL, 
  `description` TEXT NOT NULL, 
  `pages` INT NOT NULL, 
  `createdAt` DATE NOT NULL, 
  `updatedAt` DATE NOT NULL, 
  `authorId` INT DEFAULT NULL, 
  PRIMARY KEY (`id`), 
  KEY `FK_author_book` (`authorId`), 
  CONSTRAINT `FK_author_book` FOREIGN KEY (`authorId`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Insert Data into Author Table
INSERT INTO `author` (`id`, `name`, `birthday`, `bio`, `createdAt`, `updatedAt`) VALUES 
(1,'J.K. Rowling','1965-07-31','British author best known for writing the Harry Potter series.','2024-05-29','2024-05-29'),
(3,'Jane Austen','1775-12-16','English novelist known for her wit, social commentary, and romantic stories.','2024-05-29','2024-05-29'),
(4,'Harper Lee','1960-07-11','American novelist best known for her Pulitzer Prize-winning novel To Kill a Mockingbird.','2024-05-29','2024-05-29'),
(5,'J.R.R. Tolkien','1954-07-29','British writer best known for The Hobbit and The Lord of the Rings.','2024-05-29','2024-05-29'),
(6,'Mary Shelley','1818-03-03','British novelist best known for Frankenstein.','2024-05-29','2024-05-29'),
(7,'Douglas Adams','1979-10-12','English science fiction writer, humorist, and dramatist.','2024-05-29','2024-05-29');

-- Insert Data into Book Table
INSERT INTO `book` (`id`, `title`, `releaseDate`, `description`, `pages`, `createdAt`, `updatedAt`, `authorId`) VALUES 
(1,'Harry Potter and the Sorcerer\'s Stone','1997-07-26','The first book in the Harry Potter series.','223','2024-05-29','2024-05-29',1),
(3,'Harry Potter and the Chamber of Secrets','1998-07-02','The second book in the Harry Potter series.','251','2024-05-29','2024-05-29',1),
(4,'Pride and Prejudice','1813-01-28','A novel about manners and relationships in early 19th-century England.','224','2024-05-29','2024-05-29',3),
(5,'Harry Potter and the Prisoner of Azkaban','1999-07-08','The third book in the Harry Potter series.','317','2024-05-29','2024-05-29',1),
(6,'Harry Potter and the Goblet of Fire','2000-07-08','The fourth book in the Harry Potter series.','636','2024-05-29','2024-05-29',1),
(7,'The Hitchhiker\'s Guide to the Galaxy','1979-10-12','A comic science fiction novel.','184','2024-05-29','2024-05-29',7),
(8,'Frankenstein','1818-03-03','A Gothic novel about scientific responsibility and creation.','211','2024-05-29','2024-05-29',6),
(9,'The Lord of the Rings: The Fellowship of the Ring','1954-07-29','The first book in The Lord of the Rings trilogy.','482','2024-05-29','2024-05-29',5);
