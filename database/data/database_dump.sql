USE mydb;


-- Create your tables here
DROP TABLE IF EXISTS sample;
CREATE TABLE sample (
id INT(11) NOT NULL AUTO_INCREMENT ,
sample VARCHAR(128) NULL DEFAULT NULL ,
PRIMARY KEY (id)
);

INSERT INTO sample (sample) VALUES 
('Java'),
('JSP'),
('Servlet'),
('Nice!');
