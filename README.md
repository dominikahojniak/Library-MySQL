# Library-SQL

Welcome to the SQL Library! Our library allows you to borrow books, audiobooks, magazines and comics, as well as reserve available materials. It works by registering users who can borrow library resources and receive notifications about due dates and fees.

## Table of Contents
- [Database conceptual model](#database-conceptual-model)
- [Usage](#usage)

## Database conceptual model

Below is the conceptual model of the database structure that was implemented in this project:

<img src="https://github.com/dominikahojniak/Library-SQL/assets/122748213/568c8012-fdfa-46e7-8fd1-1567a1d06050" width=”50%” height=”50%”></img>

There are eight main tables in the database:
- `uzytkownicy`: Stores user information.
- `wypozyczenia_uzytkownicy`: Zawiera informacje o zamówieniach, takie jak identyfikator zamówienia, data i koszt.
- `Products`: Tabela produktów z danymi o produktach, takie jak identyfikator, nazwa i cena.

## Usage

Example SQL queries that can be executed using this library:

# Execute a SELECT query
query = 'SELECT * FROM users WHERE username = ?'
username = 'example_user'
result = connection.execute(query, (username,))


## Author

This project was created by a group of 4 people as a form of final project for the course Databases.

