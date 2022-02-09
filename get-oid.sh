#!/bin/bash
######


# Get SNMPwalk if not installed

function dependencies(){

    installed=$(dpkg -s snmp | grep "ok installed" | cut -d " " -f4)

    if [[ "$installed" == "installed" ]]; then
        echo "snmpwalk is $installed"
    
    else
        echo "Installing snmp"
        apt-get update
        apt-get install snmp -y

    fi
}

dependencies



function get_oid(){

 echo "Memory"   
 snmpwalk -v 2c -c $1 -On localhost Memory
 echo "CPU"
 snmpwalk -v 2c -c $1 -On localhost CPU
 snmpwalk -v 2c -c $1 -On localhost Processor
 
}

get_oid
