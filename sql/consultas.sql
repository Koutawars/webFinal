INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Leticia');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Medellin');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Arauca');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Barranquilla');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Santa Marta');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Bogotá');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Cartagena');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Tunja');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Valledupar');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Neiva');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Armenia');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Ibague');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Cúcuta');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Bucaramanga');
INSERT INTO `city` (`id`, `name`) VALUES (NULL, 'Riohacha');

INSERT INTO `speciality` (`id`, `name`) VALUES (NULL, 'Quimica');
INSERT INTO `speciality` (`id`, `name`) VALUES (NULL, 'Historia');
INSERT INTO `speciality` (`id`, `name`) VALUES (NULL, 'Geografia');
INSERT INTO `speciality` (`id`, `name`) VALUES (NULL, 'Literatura');
INSERT INTO `speciality` (`id`, `name`) VALUES (NULL, 'Ficción');

INSERT INTO `category` (`id`, `name`) VALUES (NULL, 'Best Seller');
INSERT INTO `category` (`id`, `name`) VALUES (NULL, 'Novelas');
INSERT INTO `category` (`id`, `name`) VALUES (NULL, 'Revistas');
INSERT INTO `category` (`id`, `name`) VALUES (NULL, 'Ensayos');
INSERT INTO `category` (`id`, `name`) VALUES (NULL, 'Documentos');

INSERT INTO `author` (`id`, `name`) VALUES (NULL, 'H.P. Lovecraft');
INSERT INTO `author` (`id`, `name`) VALUES (NULL, 'George R.R');
INSERT INTO `author` (`id`, `name`) VALUES (NULL, 'J.R.R Tolkien');
INSERT INTO `author` (`id`, `name`) VALUES (NULL, 'J.K. Rowling');
INSERT INTO `author` (`id`, `name`) VALUES (NULL, 'Hajime Isayama');

INSERT INTO `editorial` (`id`, `name`) VALUES (NULL, 'Ariel');
INSERT INTO `editorial` (`id`, `name`) VALUES (NULL, 'Alianza');
INSERT INTO `editorial` (`id`, `name`) VALUES (NULL, 'McGrawnHill');
INSERT INTO `editorial` (`id`, `name`) VALUES (NULL, 'Universidad del Magdalena');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Necromicon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 90-12345', '200000', '20', '0', '0', '0');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Lord of the Rings', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 91-123456', '150000', '15', '2', '1','1');
                    
INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Harry Potter', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 92-1234567', '250000', '40', '1', '2','2');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Game of Throne', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 93-12345678', '100000', '30', '3', '2','3');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Shingeky no Kyojin', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 94-123456789', '50000', '70', '4', '3','4');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Tales of Cthulhu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 90-1234511', '230000', '30', '0', '0', '0');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'The Hobbit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 91-12345611', '180000', '46', '2', '1','1');
                    
INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Fantastic Beasts', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 92-123456711', '140000', '14', '1', '2','2');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'BloodMoon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 93-1234567811', '70000', '55', '3', '2','3');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Dragon Ball Z', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 94-12345678911', '25000', '100', '4', '3','4');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'the Rat in the Wall', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 90-1234555', '40000', '30', '0', '0', '0');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'The Silmarillion', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 91-12345666', '350000', '10', '2', '1','1');
                    
INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Beedle the Bard', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 92-123456777', '30000', '5', '1', '2','2');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Fire and blood', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 93-1234567888', '180000', '80', '3', '2','3');

INSERT INTO `book` (`id`, `name`,`description`, `isbn`,`price`, `stock`, `author_id`,`editorial_id`, `speciality_id`) VALUES (NULL, 'Tate No Yusha', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet lorem
                    elit, sed pulvinar mauris sagittis in. Cras fermentum egestas felis. Nam at venenatis justo. Donec
                    in elit interdum, accumsan est et, consectetur justo.', 'isbn 94-12345678999', '5000', '150', '4', '3','4');
