# game_tracker
🎮 Game Tracker Database System
Project Overview
This is a full-stack database application designed to manage and track video games, developers, and user ratings. The project focuses on a normalized PostgreSQL backend and a Python command-line interface (CLI).

🛠️ Key Features
Normalized Relational Schema: Tables for Games, Developers, Genres, Users, and Ratings ensure data integrity.

Security: Implements parameterized queries in Python to prevent SQL Injection attacks.

Exception Handling: Built-in logic to handle NOT NULL constraints (like missing release dates) and Foreign Key violations (like invalid Developer IDs) without crashing the app.

Performance Optimization: Includes B-Tree indexes on frequently queried columns for faster data retrieval.

🚀 How to Run the Project
1. Database Setup
Execute the following in your terminal to build the tables and load initial data:

Bash
psql -U postgres -d game_tracker -f schema.sql
psql -U postgres -d game_tracker -f seed.sql
2. Start the Application
Run the Python interface:

Bash
python3 app.py
📂 Project Files
schema.sql: Table structures and relational constraints.

seed.sql: Initial data for developers and genres.

app.py: The Python CLI application for secure database interaction.

performance_report.md: Detailed analysis of query performance and indexing.

🛡️ Security & Error Handling Implementation
The application uses the %s placeholder syntax for all SQL executions, ensuring user input is treated strictly as data. The interface also handles common database errors—such as missing releasedate values or invalid devid entries—by providing clear feedback to the user and rolling back failed transactions.