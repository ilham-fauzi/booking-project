# Basic Technical Test (M. Ilkham Fauzi)

## Prerequisites
```shell
- docker version : 19.03.12
- ruby version : 2.7.1
- rails version: 2.7.1
- PostgreSQL: 12.2  
```

## Clone
clone this repo to your local using command
```shell
$ git clone git@github.com:ilham-fauzi/booking-project.git
$ cd booking-project
```
## Create .env file from existing .env.example file
```shell
$ cp .env.example .env
```

## Copy and paste this code to .env file
```shell
DATABASE_USER=
DATABASE_PASSWORD=
DATABASE_NAME=
DATABASE_HOST=
DATABASE_PORT=

RAILS_ENV=development
RACK_ENV=development

GITHUB_APP_ID=
GITHUB_APP_SECRET=
```

## Installation and Running the Program
1. init and build docker then run database migration. 
Start from this command:

    ```shell
    $ sh init.sh
    ```
    Then type `init`
    ```shell
    $ Enter your command: init
    ```

2. Data seed. Use command:

    ```shell
    $ sh init.sh
    ```
    Then type `seed`
    ```shell
    $ Enter your command: seed
    ```

3. Start the application. Use command:

    ```shell
    $ sh init.sh
    ```
    Then type `run`
    ```shell
    $ Enter your command: run
    ```
4. Run your browser and type http://localhost:3001/ (Login page).

## Login
While you are at http://localhost:3001/ in your browser, you can either sign up using your email account or login directly using your Github account.

## API Documentation URL 
To access API use port 3001 (***http://localhost:3001/***).

### API Book Route
| Route                   | HTTP | DESC                             | Body                          |
| ----------------------- | ---- | -------------------------------- | -                             |
| api/book                | GET  | Booking list                     | -                             |
| api/book                | POST | Booking doctor schedule          | [Example body](#example-body) |

#### Example Body
```json
{   
    "doctor_id": 7,
    "hospital_id": 4,
    "booked_date": "2020-09-24 00:00",
    "user_id": 10
}
```
### API Schedule Route

| Route                   | HTTP | DESC                             |
| ----------------------- | ---- | -------------------------------- |
| api/schedule            | GET  | Doctor schedule list             |


## Unit testing
Running unit testing by console
```
--- My apologize for not being able to finish the unit testing. ---- `#1589F0`
```

## Final Thought
```
Thank you for giving an opportunity to do the test. Although this might be far from expectations, I did my best since this is my first time using ruby and rails framework. `#1589F0`
```

