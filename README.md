# Main URL

- https://calculator-api-main.herokuapp.com/

## Installation and Usage

### Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed Docker
- You have installed Docker Compose

### Installation

1. Clone this repository
1. If using WSL:
   1. Run `sudo chown -R yourusername:yourusername slc-los/`
1. Make a copy of the `.env.sample` file, saving it as `.env`
1. Run `docker-compose build`
1. Run `docker-compose run --rm calc-rails bundle install`
1. Run `docker-compose run --rm calc-rails rails db:create`
1. Run `docker-compose run --rm calc-rails rails db:migrate`

### Usage

1. Run `docker-compose up`

# Specs

if you want to run the specs please run `docker-compose run --rm calc-rails rspec .` in project's home directory.
