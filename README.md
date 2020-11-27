# Experiment with iftop and teams streams
Teams uses udp ports 3478-3481 for conference call media streams, and ports over 50000 for direct connections.

## Command to find addresses
```
iftop -P -t -n
```
Option|Value
-|-
-P | display ports
-t | text (no curses library)
-n | numeric (not DNS names)

The output looks like this:
```
# Host name (port/service if enabled)            last 2s   last 10s   last 40s cumulative
--------------------------------------------------------------------------------------------
1 192.168.2.145:50026                      =>      553Kb      471Kb      471Kb      471KB
  52.112.76.171:3480                       <=     1.76Mb     1.64Mb     1.64Mb     1.64MB
2 192.168.2.148:50005                      =>     83.5Kb     71.9Kb     71.9Kb     71.9KB
  52.114.188.91:3479                       <=     83.5Kb     72.1Kb     72.1Kb     72.1KB
3 192.168.2.145:50001                      =>     56.5Kb     51.7Kb     51.7Kb     51.7KB
  52.112.76.171:3479                       <=     1.82Kb     21.6Kb     21.6Kb     21.6KB
4 40.100.162.194:https                     =>         0b     4.02Kb     4.02Kb     4.02KB
  192.168.2.148:54205                      <=         0b     5.13Kb     5.13Kb     5.13KB
5 20.61.72.187:amqps                       =>         0b       212b       212b       212B
  192.168.2.148:50418                      <=         0b     6.00Kb     6.00Kb     6.00KB
6 192.168.2.145:43332                      =>       872b     1.27Kb     1.27Kb     1.27KB
  toroon63dnsvp1.srvr.bell.ca:domain       <=     2.11Kb     2.80Kb     2.80Kb     2.80KB
7 192.168.2.145:34948                      =>         0b     2.41Kb     2.41Kb     2.41KB
  20.185.212.106:https                     <=         0b       605b       605b       605B
8 239.255.255.250:8082                     =>         0b         0b         0b         0B
  192.168.2.111:1044                       <=     3.62Kb     1.81Kb     1.81Kb     1.81KB
9 192.168.2.145:50057                      =>     1.06Kb       979b       979b       979B
  52.112.76.171:3481                       <=     1.28Kb       854b       854b       854B
10 192.168.2.145:50055                      =>     1.06Kb       943b       943b       943B
  52.112.76.171:3481                       <=     1.23Kb       830b       830b       830B
--------------------------------------------------------------------------------------------

```

## Command to trace routes
```
mtr -c  3 -r <addr>
```
Option | Value
-|-
-c |  number of cycles to run
-r |  report output (no curses etc)
## Example output of streams.sh
```
Testing address 52.113.20.101 (400b)
OrgName:        Microsoft Corporation
OrgId:          MSFT
Start: Fri Nov 27 12:48:01 2020
HOST: doug-desktop                Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- mynetwork                  0.0%     3    8.3   5.3   2.7   8.3   2.8
  2.|-- 10.11.0.49                 0.0%     3   10.4  13.6   9.5  21.0   6.3
  3.|-- ???                       100.0     3    0.0   0.0   0.0   0.0   0.0
  4.|-- tcore3x-ottawa23_bundle-e  0.0%     3   10.0  13.1  10.0  15.8   2.8
  5.|-- dis33-ottawa23_ae0.net.be  0.0%     3    8.9   9.4   8.4  11.0   1.2
  6.|-- tcore3x-ottawa23_bundle-e  0.0%     3   22.2  17.8  14.5  22.2   3.9
  7.|-- tcore3-montreal02_hu2-4-0  0.0%     3   18.0  17.8  12.8  22.6   4.9
  8.|-- 64.230.33.165              0.0%     3   10.7  16.4  10.7  25.7   8.1
  9.|-- microsoft_bx2-montrealgz.  0.0%     3   12.2  14.8  12.2  16.5   2.1
 10.|-- ae24-0.icr01.yto30.ntwk.m  0.0%     3   15.7  16.1  15.5  17.0   0.7
 11.|-- be-120-0.ibr02.yto30.ntwk  0.0%     3   43.9  44.3  43.0  46.0   1.4
 12.|-- be-1-0.ibr02.yto20.ntwk.m  0.0%     3   44.2  44.6  40.1  49.5   4.7
 13.|-- be-4-0.ibr02.nyc30.ntwk.m  0.0%     3   40.3  40.4  40.3  40.5   0.0
 14.|-- 104.44.28.55               0.0%     3   42.0  40.9  40.3  42.0   0.7
 15.|-- ae162-0.icr02.bl20.ntwk.m  0.0%     3   43.3  41.0  38.1  43.3   2.5
 16.|-- ???                       100.0     3    0.0   0.0   0.0   0.0   0.0
```
