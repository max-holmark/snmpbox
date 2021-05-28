# SNMP BOX (Docker wrapper)

## How to start
- Run the following commands:
```
docker build . -t snmpbox
alias snmpbox='docker run --rm -it -v $(pwd):/app snmpbox'
```

## How to use
- SNMP Scanner
```
snmpbox scanner
```
- SNMP Scanner help
```
snmpbox scanner --help
```

- SNMP Simulator
```
snmpbox simulator
```

- SNMP Simulator help
```
snmpbox simulator --help
```

The link to the base library: https://github.com/inexio/snmpsim
