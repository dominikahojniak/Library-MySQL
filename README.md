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

- Displaying how many copies of a given item are on loan
- Showing what role a given user plays
- Displaying which titles a given user has rented
- View reserved titles by a given user:

```
CREATE OR REPLACE VIEW `view_uzytkownicy_rezerwacje` AS
SELECT
  u.`imie`,
  u.`nazwisko`,
  COALESCE(k.`tytul`, a.`tytul`, c.`tytul`, ko.`tytul`) AS `zarezerwowany_tytul`
FROM
  `uzytkownicy` u
LEFT JOIN
  `rezerwacje` r ON u.`ID_uzytkownicy` = r.`ID_uzytkownicy`
LEFT JOIN
  `ksiazki` k ON r.`ID_ksiazki` = k.`ID_ksiazki`
LEFT JOIN
  `audiobooki` a ON r.`ID_audiobooka` = a.`ID_audiobooka`
LEFT JOIN
  `czasopisma` c ON r.`ID_czasopisma` = c.`ID_czasopisma`
LEFT JOIN
  `komiksy` ko ON r.`ID_komiksy` = ko.`ID_komiksy`;
```

## Author

This project was created by a group of 4 people as a form of final project for the course Databases.

