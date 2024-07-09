# Initialize the configurartion files and certificates
SERVER_NAME=$(server_name)
init-vpn:
ifeq ($(SERVER_NAME),)
	echo 'Plese define a SERVER_NAME.'
else
	docker network create open-vpn
	docker-compose run --rm open-vpn ovpn_genconfig -u udp://$(SERVER_NAME)
	docker-compose run --rm open-vpn ovpn_initpki
	mkdir vpn_clients
endif

# Start ovpn service
start-vpn:
	docker-compose up -d

# Generate a client certificates
CLIENTNAME=$(clientname)
create-client:
# client
ifeq ($(CLIENTNAME),)
	echo 'Please define a CLIENTNAME'
else
	docker-compose run --rm open-vpn easyrsa build-client-full $(CLIENTNAME)
	docker exec -it opne-vpn /bin/sh -c "ovpn_getclient $(CLIENTNAME)" > vpn_clients/$(CLIENTNAME).ovpn
endif

# Retrieve the client configuration with embedded certificates
CLIENTNAME=$(clientname)
remove-client:
# Client
ifeq ($(CLIENTNAME),)
	echo 'Please define a CLIENTNAME'
else
	docker exec -it vpn-mesfix /bin/sh -c "ovpn_revokeclient $(CLIENTNAME) renove"
endif