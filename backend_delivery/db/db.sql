USE udemy_delivery;

CREATE TABLE user(
 id BIGINT PRIMARY KEY AUTO_INCREMENT,
 email varchar(180) NOT NULL UNIQUE,
 name varchar(90) NOT NULL,
 lastname varchar(90) NOT NULL,
 phone varchar(90) NOT NULL UNIQUE,
 image varchar(255) NULL,
 password varchar(90) NOT NULL,
 created_at TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP
);