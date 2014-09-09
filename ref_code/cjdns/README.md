This is a snapshot of the cjdns github project taken on Sep. 8/2014

https://github.com/cjdelisle/cjdns

cjdns is a tcp / udp hole punching tool utilizing IPv6, in order to pass packets from one node to another, outside traditional filter blocking.

This framework ultimately works at a Layer 2 networking layer, and with it, message packets can be transported from one node to the next, on route to desitnation(s) along TCP and UDP paths, regardless of, or agnostic to, the hardware transport layer.  ie.  It can use any hardware network infrastructure layer to get packets from point to point, so long as the hardware transports TCP  and UDP, whether traditional, private, darknet, meshnet, HMMS, etc. networks.
