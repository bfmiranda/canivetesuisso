#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to update the package list
update_package_list() {
    echo "Updating package list..."
    sudo apt-get update -y
}

# Function to install prerequisites
install_prerequisites() {
    echo "Installing prerequisites..."
    sudo apt-get install -y wget curl unzip
}

# Function to install Java JDK 17
install_java() {
    echo "Installing Java JDK 17..."
    sudo apt-get install -y openjdk-17-jdk
    echo "Verifying Java installation..."
    java -version
}

# Function to install Java JRE 11
install_jre() {
    echo "Installing Java JRE 11..."
    sudo apt-get install -y default-jre
    echo "Verifying Java installation..."
    java -version
}

# Function to install Apache Maven
install_maven() {
    echo "Installing Apache Maven..."
    sudo apt-get install -y maven
    echo "Verifying Maven installation..."
    mvn -version
}

# Function to install Quarkus CLI
install_quarkus() {
    echo "Installing Quarkus CLI..."
    curl -Ls https://sh.jbang.dev | bash -s - trust add https://repo1.maven.org/maven2/io/quarkus/quarkus-cli/
    curl -Ls https://sh.jbang.dev | bash -s - app install --fresh --force quarkus@quarkusio
    curl -Ls https://sh.jbang.dev | bash -s - app install quarkus
    echo "Verifying Quarkus installation..."
    quarkus --version
}

# Function to display menu options
show_menu() {
    echo "Select an option:"
    echo "1. Update package list"
    echo "2. Install prerequisites"
    echo "3. Install Java JDK 17"
    echo "4. Install Apache Maven"
    echo "5. Install Quarkus CLI"
    echo "6. Run all steps"
    echo "9999 - Instalar redis"
    echo "7. Exit"
}

# Main script logic
while true; do
    show_menu
    read -p "Enter your choice [1-8]: " choice

    case $choice in
        1) update_package_list ;;
        2) install_prerequisites ;;
        3) install_java ;;
        4) install_maven ;;
        5) install_quarkus ;;
        6) install_jre ;;
        7) 
            update_package_list
            install_prerequisites
            install_java
            install_jre
            install_maven
            install_quarkus
            ;;
        8) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please enter a number between 1 and 7." ;;
    esac
done
