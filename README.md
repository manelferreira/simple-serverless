# Simple Serverless

This is a simple serverless project I created to help me in the development of [Serverless sequelize migrations](https://github.com/manelferreira/serverless-sequelize-migrations).

## Usage
This is for local development only, and the database environment variables were commited here because there is no need to prepare the project for multiple environments.

### Dev.sh bash
There is a bash file with some helper functions to setup local environment. To use it, open the terminal on the root directory of the project and run:
```bash
source dev.sh
```
The following functions are currently available:
```
start_infra ................... Creates and runs the PostgreSQL container using docker-compose
db_create ..................... Runs a SQL script to create a DB on the PostgreSQL container
db_destroy .................... Stops and removes the PostgreSQL container
```


### Using the serverless sequelize migrations plugin
There are two options to use the plugin.
1) Using npm package: 
```
In the serverless.yml plugin's section, configure the plugin as: 
- serverless-sequelize-migrations
```

2) Using local project: 
```
In the serverless.yml plugin's section, configure the plugin as: 
- ./local_plugins/serverless-sequelize-migrations

You must also clone the plugins GitHub project on the parent directory of this project. There is a configured symlink pointing to a folder in this location.
```

###  Run serverless function locally

You can invoke your function locally by using the following command:

```bash
serverless invoke local --function hello
```

Which should result in response similar to the following:

```
{
    "statusCode": 200,
    "body": "{\n  \"message\": \"Go Serverless v3.0! Your function executed successfully!\",\n  \"input\": \"\"\n}"
}
```
