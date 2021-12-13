# Main URL Endpoint

- https://calculator-api-main.herokuapp.com/

## Details

RoR API Calaculate endpoint App

This App is using Docker, CircleCI and Heroku for automatic test and deployment or for Continues Integration.

## Installation and Usage

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed Docker
- You have installed Docker Compose

### Installation

1. Clone this repository
1. Run `docker-compose build`
1. Run `docker-compose run --rm calc-rails bundle install`
1. Run `docker-compose run --rm calc-rails rails db:create`
1. Run `docker-compose run --rm calc-rails rails db:migrate`

### Developement Usage

1. Run `docker-compose up`

### Specs

if you want to run the specs please run `docker-compose run --rm calc-rails rspec .` in project's home directory.

### App usage

Endpoint `/calculate`

1. Receive a form submission with two numbers A and B and an operation (`SUM`, `SUB`, `TIMES`, or `DIVIDE`).
2. It should return 200 response with the result of the operation.

Example:

```
curl -X POST 'http://localhost:3000/calculate' \
--form 'A="100"' \
--form 'B="50"' \
--form 'OPERATION="SUM"'
```

Response:

```
{
  "result": 150
}
```
