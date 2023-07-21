#!/bin/bash
RESTORE='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\e[0;33m'

export PROJ_BASE="$(dirname ${BASH_SOURCE[0]})"
CD=$(pwd)
cd $PROJ_BASE
export PROJ_BASE=$(pwd)

export DB_CONTAINER_NAME=simple_serverless_pg

export DB_HOST='localhost'
export DB_PORT=5433
export DB_NAME='simple_sls'
export DB_USER='sls_user'
export DB_PASSWORD='sls_password'

cd $CD

function devhelp {
    echo -e "${GREEN}devhelp${RESTORE}                Shows this ${RED}guide${RESTORE}"
    echo -e ""     
    echo -e "${GREEN}start_infra${RESTORE}            Creates and ${RED}runs PostgreSQL${RESTORE} container using docker-compose"
    echo -e ""     
    echo -e "${GREEN}db_create${RESTORE}              Runs a ${RED}SQL script to create a DB${RESTORE} on the PostgreSQL container"
    echo -e ""     
    echo -e "${GREEN}db_destroy${RESTORE}             Stops ${RED}and removes PostgreSQL${RESTORE} container"
}

function start_infra {
    CD=$(pwd)
    cd $PROJ_BASE
    docker-compose up
    cd $CD
    return $exitcode
}

function db_create {
    CD=$(pwd)
    PGPASSWORD=postgres psql -U postgres -h $DB_HOST -p $DB_PORT -f $PROJ_BASE/database/create_database.sql
    exitcode=$?
    cd $CD
    return $exitcode
}

function db_destroy {
    CD=$(pwd)
    cd $PROJ_BASE/
    docker container stop ${DB_CONTAINER_NAME}
    docker container rm ${DB_CONTAINER_NAME}

    exitcode=$?
    cd $CD
    return $exitcode
}

function echo_red {
    echo -e "\e[31m$1\e[0m";
}

function echo_green {
    echo -e "\e[32m$1\e[0m";
}

function echo_yellow {
    echo -e "${YELLOW}$1${RESTORE}";
}

function now_milis {
    date +%s%N | cut -b1-13
}

echo_red   "------------------------------------------------------------------------"
echo_green "Simple serverless env helper"
echo_red   "------------------------------------------------------------------------"
devhelp
