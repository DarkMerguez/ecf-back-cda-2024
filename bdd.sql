CREATE DATABASE mcdo;
USE mcdo;
CREATE TABLE user(
     id INT PRIMARY KEY AUTO_INCREMENT,
     role INT
     );
CREATE TABLE category(
     id INT PRIMARY KEY AUTO_INCREMENT,
     title TINYTEXT
     );
CREATE TABLE cart(
     id INT PRIMARY KEY AUTO_INCREMENT,
     isPaid BIT DEFAULT 0,
     userId INT UNIQUE,
     FOREIGN KEY (userId) REFERENCES user(id)
     );
CREATE TABLE `order`(
     id INT PRIMARY KEY AUTO_INCREMENT,
     status BIT DEFAULT 0,
     date DATETIME,
     cartId INT,
     FOREIGN KEY (cartId) REFERENCES cart(id)
     );
CREATE TABLE product(
     id INT PRIMARY KEY AUTO_INCREMENT,
     name TINYTEXT,
     price FLOAT,
     description TEXT,
     categoryId INT,
     FOREIGN KEY (categoryId) REFERENCES category(id)
     );
CREATE TABLE ProductCart(
     quantity INT,
     productId INT,
     cartId INT,
     PRIMARY KEY (productId,cartId),
     FOREIGN KEY (productId) REFERENCES product(id),
     FOREIGN KEY (cartId) REFERENCES cart(id)
     );
CREATE TABLE ProductOrder(
     quantity INT,
     productId INT,
     orderId INT,
     PRIMARY KEY (productId,orderId),
     FOREIGN KEY (productId) REFERENCES product(id),
     FOREIGN KEY (orderId) REFERENCES `order`(id)
     );
