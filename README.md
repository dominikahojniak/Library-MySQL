# Library-SQL

Welcome to the SQL Library! Our library allows you to borrow books, audiobooks, magazines and comics, as well as reserve available materials. It works by registering users who can borrow library resources and receive notifications about due dates and fees.

## Table of Contents
- [Database conceptual model](#database-conceptual-model)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)

## Database conceptual model

Below is the conceptual model of the database structure that was implemented in this project:

<img src="https://github.com/dominikahojniak/Library-SQL/assets/122748213/568c8012-fdfa-46e7-8fd1-1567a1d06050" width=”50%” height=”50%”></img>

## Getting Started

To get started with the SQL Library, follow these steps:

1. **Installation**: You can install the library via [package manager](#) or download it directly from our GitHub repository.

2. **Dependencies**: Make sure you have the required database driver installed for your specific database (e.g., mysql, sqlite, postgres, etc.).

3. **Include the Library**: Include the library in your project by importing it.

## Usage

Here's a basic example of how to use the SQL Library to execute a simple SQL query:

```python
from sql_library import SQLConnector

# Initialize a database connection
connection = SQLConnector('your_database_url', 'your_username', 'your_password')

# Execute a SELECT query
query = 'SELECT * FROM users WHERE username = ?'
username = 'example_user'
result = connection.execute(query, (username,))

# Process the query results
for row in result:
    print(row)

# Close the database connection when done
connection.close()


## Author

This project was created by a group of 4 people as a form of final project for the course Databases.

