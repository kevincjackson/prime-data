-- SQLITE SETTINGS
.headers on     -- show headings
.mode column    -- left align results

-- CREATE primes
CREATE TABLE primes (number int, pos int);

-- INSERT a few values 
INSERT INTO primes (number, pos) VALUES (2, 1), (3, 2), (5, 3), (7, 4);

-- DELETE table
DELETE FROM primes;