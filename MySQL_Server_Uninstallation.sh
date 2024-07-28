#!/bin/bash



check_mysql_installation(){
    # executing 'whcich mysql' to get to know do mysql is installed in container.
    MySql_Directory=$(which mysql)
    MySQLinstallationResponse=$(echo $?)

    if [ MySQLinstallationResponse == 0 ]
    then
        echo "MySQL server is installed on your machine at: $MySql_Directory "
    fi
}

un_install_mysql(){
    # Confirming un-installation of mysql.
    echo " Are you sure want to remove 'mysql', if yes enter 'y' if no enter 'n'. "
    read RESPONSE
    if [ $RESPONSE == "y" ]
    then
        echo " mysql un-installation started "
        # The --purge option removes the package along with its configuration fils.
        sudo apt-get remove --purge mysql-server -y
        # Removes any dependencies that were installed with mysql server which no longer needed.
        sudo apt-get autoremove -y
        # To clean local repository of retrieved package files.
        sudo apt-get autoclean
        # To remove all the MySQL data directories and configuration files you can delete the MySql directory.
        sudo rm -rf /etc/mysql /var/lib/mysql
    fi


}

check_mysql_installation
un_install_mysql

