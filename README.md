# QuoteNation

QuoteNation is a participatory web application where users share their quotes, enriching lives one quote at a time. Explore a diverse collection across various categories and contribute your own insights to inspire others.

## Features

- Browse popular quotes by category: Inspirational, Love, Life, Happiness, Friendship, Success, Wisdom, Humor, Motivation, Courage.
- Submit new quotes to share with the community.
- User authentication and session management.
- Artistic, creative and Responsive design for desktop (not mobiles).


## Technologies Used

- Node.js
- Express.js
- PostgreSQL
- EJS (Embedded JavaScript)
- HTML/CSS/JavaScript

## Setup

### Prerequisites

- Ensure Node.js is installed on your deviece.
- Ensure PostgreSQL is installed and ensure it's running.

### Set up the PostgreSQL database 

- **Windows:**
  - Open Command Prompt or PowerShell.
  - Type:
    ```
    cd "C:\Program Files\PostgreSQL\15\bin"
    ```
    Replace `"C:\Program Files\PostgreSQL\15\bin"` with your PostgreSQL installation's `bin` folder path.

- **macOS/Linux:**
  - Open Terminal.
  - Type:
    ```
    cd /usr/local/bin
    ```
    Adjust the path based on your PostgreSQL installation directory.

### Database

- Copy the path of `data.sql` in the `database` folder of the project.
- in the terminal type (for windows) :
  ```
  psql -U <username (usally postgres)> -d postgres -f "C:\path\to\data.sql"
  ```
- in the terminal type (for mac/linux) :
  ```
  psql -U <username (usally postgres)> -d postgres -f /path/to/data.sql

  ```
  Audjust the `data.sql` file path and `username`.







