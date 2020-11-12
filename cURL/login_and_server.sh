response=$(curl -k --silent --header "Content-Type: application/json" --request POST --data '{"username":"admin","password":"Bet$0l@2020"}' https://127.0.0.1:8008/zmc_service/users/zmc/login/)
access_token_object=`echo $response | grep -Po '"access":.*' | awk -F: '/"access":/ {print $2}'`
# Remove suffix
temp="${access_token_object%\}}"
temp="${temp%\"}"
# Remove prefix
access_token="${temp#\"}"
echo $access_token
