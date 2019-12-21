#!/usr/bin/env bash

# Variables Needed
WEB="apache2" # Web Server to use.
DB="mysql" # Database

__silent () {
    $1 &>/dev/null
}

__update () {
    echo "Updating..."
    __silent $(apt-get update) || echo "Update failed."
}

__install () {
    echo "installing $@"
    if __silent $(apt-get install ${@} -y); then
        echo "successful"
    else
        echo "failed"
    fi
}
__install_many () {
    for i in "$@"
    do
        __install $i
    done
}

__restart () {
    service $1 restart
}

__restart_many () {
    for i in "$@"
    do
        __restart $i
    done
}

__update
__install_many dialog apt-utils apache2 mysql-server php7.2
__reset_many apache2 mysql