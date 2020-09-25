#Basic Technical Test (M. Ilkham Fauzi)

## Prerequisites
```shell
- docker version : 19.03.12
- ruby version : 2.7.1
- rails version: 2.7.1
- PostgreSQL: 12.2  
```

## clone
- clone this repo to your local using 
```shell
git clone git@github.com:ilham-fauzi/booking-project.git
$ cd booking-project
```
## create .env file from existing .env.example file
```shell
$ cp .env.example .env
```

## copy and paste this code to .env file
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

## Intallation
> init docker and build then run migration
```shell
$ sh init.sh
$ Enter your command: init
```

## Data seed
> data seed <optional>
```shell
$ sh init.sh
$ Enter your command: seed
```

## Start application
```shell
$ sh init.sh
$ Enter your command: run
```

## API documentation URL 
> this documentation API url
```shell
singup from browser using github 
$ login using github go to browser <a href="http://localhost:3001" target="_blank">`http://localhost:3001`</a>

>> schedule list
$ GET http://localhost:3001/api/book
>> booking schedule doctor
$ POST http://localhost:3001/api/book
** success case **
using params: 
{
    "doctor_id": 7, // see through database table schedule to get doctor_id
    "hospital_id": 4, // see through database table schedule to get hospital_id
    "booked_date": "2020-09-24 00:00",
    "user_id": 10 // see through database table schedule to get user_id
}
>> booking schedule list
$ GET http://localhost:3001/api/schedule
```

## unit testing
> run unit testing by console
```shell
$ --- sorry it is not finish yet, coz i need more time to learn RSPEC testing ---
```

## my word
```shell
$ hope you will accept this altought it is far from expectation cos this is my firts time using ruby and rails framework
```

