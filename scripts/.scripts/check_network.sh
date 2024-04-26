#!/bin/bash

# +------------------------------------------+
# |  check network with http & icmp request  |
# +------------------------------------------+

function check_http_req() {
    timeout 3s curl -LI google.com &>/dev/null
    if [[ "${?}" -ne 0 ]]; then
        http_req_flag=1
    else
        http_req_flag=0
    fi
}

function check_ping() {
    if [[  ! `ping -c1 -W 6 1.1.1.1 2>/dev/null `  ]] && [[  ! $ping_number  ]] ; then
        ping_flag=1
    else
        ping_number=`ping -c 1 -W 7 1.1.1.1 2>/dev/null | grep -o -E "time=.*\s" | cut -d"=" -f 2`
        ping_flag=0
    fi
}

function show_result() {

    if [[  $ping_flag -eq 0  ]] && [[  $http_req_flag -eq 0  ]];then
        echo "ping is: $ping_number"
        echo "----"
        echo "You can send HTTP request"

        notify-send -t 3000 -u low "Test network" "<span font='18px'><b>ping is: $ping_number \n---------\n\
you can send http request</b></span>"

    elif [[  $ping_flag -eq 1  ]] && [[  $http_req_flag -eq 0  ]]; then
        echo "ping request failed"
        echo "----"
        echo "You can send HTTP request"

        notify-send -t 3000 -u low "Test network" "<span font='18px'><b>Ping Failed \n----------\n\
http request</b></span>" "you can't send http request"

    elif  [[  $ping_flag -eq 1  ]] && [[  $http_req_flag -eq 1  ]]; then
        echo "ping failed"
        echo "----"
        echo "http request failed"

        notify-send -t 3000 -u critical "Test network" "<span font='18px'><b>Ping Failed \n----------\n\
http request Failed</b></span>"
    fi
}

check_http_req
check_ping

show_result

unset check_ping
unset check_http_req
unset show_result
unset ping_flag
unset http_req_flag
