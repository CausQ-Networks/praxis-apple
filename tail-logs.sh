#!/bin/bash

LEVEL=${1:-debug}

echo "Tailing logs for subsystem: com.causq.praxis.PacketTunnel (level: $LEVEL)"
echo "Press Ctrl+C to stop"
echo ""

log stream --predicate 'subsystem == "com.causq.praxis" OR subsystem == "com.causq.praxis.PacketTunnel"' --level $LEVEL --style compact
