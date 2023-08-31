# Setup

## Run server

```
docker compose up
```

## Run one of ddos methods

Please oopen ddos.sh to see the list of available options

```
docker pull utkudarilmaz/hping3
./ddos.sh <arg>
```

## Run user traffic

```
docker pull nemanicka/simulate-traffic
docker run --network=ddos2_ddos simulate-traffic
```

# Some clarifications

## How ddos attacks are performed

* The majority of ddos.sh attacks are performed via utkudarilmaz/hping3.
* Slowloris attack is performed via some open-source python script found on github.
* Http flood is performed via siege.
* Ping of death is performed via a simple bash ping command.

## What is "user-traffic"

"User traffic" is 200 requests sent via siege that are run inside of the docker network, therefore, they contain the network's specific 
IP and can be distinguished from the ddos attacks.


# Results

Overall, neither attack affected the user-generated traffic except 2: HTTP flood and slowloris. 
Despite no effect on the server, the CPU consumption by nearly every attack was 99%.

* Protection from http flood: since I deliberately placed user traffic in the docker networks, it's quite easy to
  deny all traffic from 172.27.0.1 to avoid ddos attacks.
* Protection from slowloris: 
