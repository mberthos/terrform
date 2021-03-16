#!/bin/bash

#Get Workspace ID
# curl   --header "Authorization: Bearer $TOKEN"   --header "Content-Type: application/vnd.api+json" "https://app.terraform.io/api/v2/organizations/minutrade/workspaces" | jq "."
echo "Executando o script..."
arquivoPath="./payload.json"

if [ -e $arquivoPath ]
then
	echo "Encontrei o payload.json:"
	cat payload.json
	echo
	echo "Enviando para o terraform cloud..."
	echo
curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @payload.json \
  https://app.terraform.io/api/v2/vars

else
	echo "o payload.json nao esta no diretorio atual ou nao existe"
	exit 0
fi