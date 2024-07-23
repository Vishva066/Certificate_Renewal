#!/bin/bash

source ./reEnroll.sh

renew_manufacturer() {
    echo "Renrolling organization Manufacturer certificate"

    rm ${PWD}/organizations/fabric-ca/manufacturer/tls-cert.pem

    docker restart ca_manufacturer
    sleep 10

    createManufacturer

    # docker restart $(docker ps -q)
    docker restart peer0.manufacturer.auto.com

    # containers=$(docker ps -a --format '{{.Names}}' | grep 'manufacturer')

    # docker restart $container

}

renew_dealer() {
    echo "Renrolling organization Dealer certificate"

    rm ${PWD}/organizations/fabric-ca/dealer/tls-cert.pem

    docker restart ca_dealer
    sleep 10

    createDealer

    # docker restart $(docker ps -q)

    docker restart peer0.dealer.auto.com

    # containers=$(docker ps -a --format '{{.Names}}' | grep 'dealer')

    # docker restart $container

}

renew_mvd() {
    echo "Renrolling organization MVD certificate"

    rm ${PWD}/organizations/fabric-ca/mvd/tls-cert.pem

    docker restart ca_mvd
    sleep 10

    createMvd

    # docker restart $(docker ps -q)
    docker restart peer0.mvd.auto.com

    # containers=$(docker ps -a --format '{{.Names}}' | grep 'mvd')

    # docker restart $container
}

renew_orderer() {
    echo "Renrolling Orderer certificate"

    rm ${PWD}/organizations/fabric-ca/orderer/tls-cert.pem

    docker restart ca_orderer
    sleep 10

    createOrderer

    # docker restart $(docker ps -q)
    docker restart orderer.auto.com

}



echo "Which organization certificate would you like to renew?"
echo "1. Manufacturer"
echo "2. Dealer"
echo "3. MVD"
echo "4. Orderer"
read -p "Enter the number corresponding to your choice: " choice

case $choice in
    1)
        renew_manufacturer
        ;;
    2)
        renew_dealer
        ;;
    3)
        renew_mvd
        ;;
    4)
        renew_orderer
        ;;
    *)
        echo "Invalid choice. Please enter 1, 2, or 3."
        ;;
esac