/**
  Mock data to provide an example of how to import a file from the command line.

  Normally I would use a hash method to compare passwords.
  @example
  mysql -u $USER -p < import.sql
 */

CREATE SCHEMA `server_database`;

CREATE TABLE IF NOT EXISTS server_database.users (
    id INT,
    username VARCHAR(20),
    password VARCHAR(40)
);

INSERT INTO server_database.users (id, username, password) VALUE
    (1, 'lshugg0', 'Egqyf5y9y'),
    (2, 'jshemwell1', 'CwCa9LTJo1hG'),
    (3, 'wgeelan2', 'AlTHDGnrIe'),
    (4, 'cbeaton3', '7Z1hcqCm9MYN'),
    (5, 'cnappin4', '6afMgZ'),
    (6, 'dcowins5', 'MiKWUAOq6t3'),
    (7, 'aclegg6', 'NSpc8M5Vbtn'),
    (8, 'khayle7', 'T82g3RdByTu'),
    (9, 'noruane8', 'gFVdLnmF'),
    (10, 'rextil9', 'W621UVupLR');
