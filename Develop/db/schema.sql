-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;
-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

\c ecommerce_db;


CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL NOT NULL CHECK (price >= 0),
    stock INT NOT NULL CHECK (stock >= 0) DEFAULT 10,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE tag (
    id SERIAL PRIMARY KEY,
    tag_name VARCHAR(255) NOT NULL
);

CREATE TABLE ProductTag (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

