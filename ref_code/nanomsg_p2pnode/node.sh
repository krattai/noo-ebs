./node node0 tcp://127.0.0.1:3000 tcp://127.0.0.1:3001 tcp://127.0.0.1:3002 &
./node node1 tcp://127.0.0.1:3001 tcp://127.0.0.1:3002 tcp://127.0.0.1:3003 &
./node node2 tcp://127.0.0.1:3002 tcp://127.0.0.1:3003 tcp://127.0.0.1:3000 &
./node node3 tcp://127.0.0.1:3003 tcp://127.0.0.1:3000 tcp://127.0.0.1:3001 &
