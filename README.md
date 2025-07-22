# String Calculator API

A simple **String Calculator** built with **Ruby on Rails** that allows you to add numbers from a string input. It supports several features including:

- **Comma-separated numbers**
- **Newline-separated numbers**
- **Custom delimiters**
- **Handling negative numbers with error reporting**
- **Ignoring numbers greater than 1000**

This project follows **Test-Driven Development (TDD)** principles to ensure maintainable, well-tested code.

## Features

- **Basic operations**: Add numbers from a string input.
- **Supports newlines and commas**: Handles both newline `\n` and comma `,` as valid delimiters.
- **Custom delimiters**: Supports specifying custom delimiters at the start of the string (e.g., `//;\n1;2`).
- **Negative numbers handling**: Throws an exception with a detailed message if negative numbers are passed.
- **Numbers greater than 1000 are ignored**.

## Installation

### Prerequisites

Ensure you have the following installed:

- **Ruby** 3.x or higher
- **Rails** 7.x or higher

### Steps to Install and Run Locally

1. **Clone the Repository**:

    ```bash
    git clone https://github.com/yourusername/string_calculator.git
    cd string_calculator
    ```

2. **Install Dependencies**:

    Make sure you have all required gems:

    ```bash
    bundle install
    ```

3. **Set up the Database**:

    If you're using the default database (SQLite):

    ```bash
    rails db:create
    rails db:migrate
    ```

    Alternatively, if you're using PostgreSQL, ensure your `config/database.yml` is correctly set and then run:

    ```bash
    rails db:create
    rails db:migrate
    ```

4. **Run Tests**:

    This project follows **Test-Driven Development (TDD)** principles. To ensure everything works as expected, run the RSpec tests:

    ```bash
    rspec
    ```

5. **Start the Rails Server**:

    After setting up the application, you can start the Rails server:

    ```bash
    rails server
    ```

    Your app will be available at `http://localhost:3000`.

---

## API Documentation

### **POST** `/api/v1/string_calculators/add`

This API endpoint receives a string of numbers and returns their sum. It supports multiple delimiters, handles newlines, and throws errors for negative numbers.

#### Request Parameters:

- **numbers** (string, required): A comma-separated string or newline-separated string of numbers.

#### Example Request:

```bash
curl -X POST "http://localhost:3000/api/v1/string_calculators/add" \
  -d "numbers=1,2,3" \
  -H "Content-Type: application/x-www-form-urlencoded"

