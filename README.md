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
## Exaample output of streams.sh
```
Start: Fri Nov 27 10:52:46 2020
HOST: doug-desktop                Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- mynetwork                  0.0%     3    5.5   7.0   5.5   9.5   2.0
  2.|-- 10.11.0.49                 0.0%     3   16.8  15.4  12.2  17.3   2.7
  3.|-- ???                       100.0     3    0.0   0.0   0.0   0.0   0.0
  4.|-- tcore4x-ottawa23_bundle-e  0.0%     3   17.1  18.1  17.1  20.0   1.4
  5.|-- dis33-ottawa23_ae1.net.be  0.0%     3   12.0  11.9   8.9  14.7   2.8
  6.|-- tcore3x-ottawa23_bundle-e  0.0%     3   16.4  15.0  11.6  16.9   2.8
  7.|-- tcore3-montreal02_hu2-4-0  0.0%     3   22.1  18.8  10.8  23.5   7.0
  8.|-- 64.230.33.165              0.0%     3   10.4  10.6  10.0  11.5   0.7
  9.|-- microsoft_bx2-montrealgz.  0.0%     3   13.9  17.2  13.9  22.1   4.4
 10.|-- ae24-0.icr01.yto30.ntwk.m  0.0%     3   17.8  18.1  16.4  20.1   1.7
 11.|-- be-100-0.ibr01.yto30.ntwk  0.0%     3   48.6  47.5  43.0  51.1   4.1
 12.|-- be-1-0.ibr01.yto20.ntwk.m  0.0%     3   43.4  49.9  43.4  58.6   7.8
 13.|-- be-9-0.ibr01.nyc30.ntwk.m  0.0%     3   47.1  51.2  47.1  57.2   5.2
 14.|-- be-8-0.ibr03.bl20.ntwk.ms  0.0%     3   60.2  69.4  55.8  92.3  19.9
 15.|-- be-2-0.ibr01.bn6.ntwk.msn  0.0%     3   56.0  57.2  56.0  58.4   1.0
 16.|-- ae143-0.icr04.bn6.ntwk.ms  0.0%     3   54.1  78.0  54.1 123.5  39.3
 17.|-- ???                       100.0     3    0.0   0.0   0.0   0.0   0.0
```
