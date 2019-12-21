#!/usr/bin/env bash
# installs Apache2, MySQL, PHP, PHP's commonly used modules, Composer, and PHPMyAdmin
__pass () {
    echo "successful"
}

__fail() {
    echo "failed"
}

__update () {
    echo "Updating..."
    apt-get update
}

__install () {
    echo "installing $1"

    apt-get install $1 -y || __fail
}

__install_many () {
    for i in "$@"
    do
        __install $i
    done
}

__restart () {
    echo "restarting $1..."

    $(service $1 restart &>/dev/null) || __fail
}

__restart_many () {
    for i in "$@"
    do
        __restart $i
    done
}

__update

__install_many apt-utils dialog unzip wget curl

__install_many apache2 mysql-server

__restart_many apache2 mysql

__install_many php7.2 libapache2-mod-php7.2

__install_many php-cli php-common php-mbstring php-gd php-intl php-xml php-mysql php-zip php-curl php-xmlrpc php-pdo

__install_many composer phpmyadmin

__restart apache2
