This project is in charge of deploy a VPN service inside a docker container

## Requirements

* Docker (https://docs.docker.com/install/)
* Docker Compose (https://docs.docker.com/compose/install/#install-using-pip)
* Make (https://www.gnu.org/software/make/)

## Commands

##### 1. Initialize the VPN service
This command builds the image for the container with all the VPN service
```bash
make init-vpn SERVER_NAME=<server-name>
```
##### 2. Start the VPN service
This command deploys the image in docker with the VPN service running
```bash
make start-vpn
```
##### 3. Create a client for the VPN
This command creates the client in the VPN and saves the client connection file in the *vpn_clients* folder
```bash
make create-client CLIENTNAME=<clientname>
```
##### 4. Get a client certificates for the VPN
This command retreives the connection file in the *vpn_clients* folder
```bash
make get-client CLIENTNAME=<clientname>
```
##### 5. Remove a client for the VPN
This command removes the client in the VPN
```bash
make remove-client CLIENTNAME=<clientname>
```