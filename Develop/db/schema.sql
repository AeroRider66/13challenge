-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;
-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

\c employee_db;

CREATE TABLE category
  id SERIAL PRIMARY KEY INT NOT NULL
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
    id SERIAL PRIMARY KEY INT NOT NULL,
    title VARCHAR(30) UNIQUE NOT NULL,
    salary DECIMAL NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT NOT NULL,
    manager_id INT,
    FOREIGN KEY (role_id) REFERENCES role(id),
    FOREIGN KEY (manager_id) REFERENCES employee(id)
);



* `Category`

    * `id`

        * Integer.

        * Doesn't allow null values.

        * Set as primary key.

        * Uses auto increment.

    * `category_name`

        * String.

        * Doesn't allow null values.

* `Product`

    * `id`

        * Integer.

        * Doesn't allow null values.

        * Set as primary key.

        * Uses auto increment.

    * `product_name`

        * String.

        * Doesn't allow null values.

    * `price`

        * Decimal.

        * Doesn't allow null values.

        * Validates that the value is a decimal.

    * `stock`

        * Integer.

        * Doesn't allow null values.

        * Set a default value of `10`.

        * Validates that the value is numeric.

    * `category_id`

        * Integer.

        * References the `Category` model's `id`.

* `Tag`

    * `id`

        * Integer.

        * Doesn't allow null values.

        * Set as primary key.

        * Uses auto increment.

    * `tag_name`

        * String.

* `ProductTag`

    * `id`

        * Integer.

        * Doesn't allow null values.

        * Set as primary key.

        * Uses auto increment.

    * `product_id`

        * Integer.

        * References the `Product` model's `id`.

    * `tag_id`

        * Integer.

        * References the `Tag` model's `id`.