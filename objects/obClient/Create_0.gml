globalvar clientSocket, IP, PORT, Ping;
IP="localhost"
PORT=9333
Ping=0
Data=-1
globalvar Character, clientiD;
Character=0
clientiD=-1

u="user"
p="pass"
Type=0

clientSocket = network_create_socket(network_socket_ws)
network_set_timeout(clientSocket, 500, 500)
network_set_config(network_config_connect_timeout, 500)
Connect=network_connect_raw_async(clientSocket, IP, PORT)

if Connect<0
{
	show_debug_message("Could Not Connect")
	instance_destroy()
}

/*
var Struct = {
	Type: "Stalk",
}

scrSend(Struct)
*/

alarm[0]=1