CREATE DATABASE Bible;
USE Bible;
CREATE TABLE Bible(
    id INT PRIMARY KEY AUTO_INCREMENT,
    book VARCHAR(30) NOT NULL,
    chapter INT NOT NULL,
    verse INT NOT NULL,
    text TEXT,
    UNIQUE KEY no_overlap (book, chapter, verse)  ## 이 3가지 값이 같은 행이 있어서는 안된다는 의미임.
);
