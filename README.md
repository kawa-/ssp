# ssp: Simple Storage Perf

- Shell scripts of hdparm and dd for storage
- Ubuntu only (Other linux might work)
- For SSD or higher storages (You need edit some values if you use of HDDs)
- Free Disk space > 6GB
- Very rough measurement (Don't take the results seriously)
- I'd like to know your way of measurements with examples. Tell me in issues

## Usage

~~~
$ git clone https://github.com/kawa-/ssp.git
$ cd ssp

# Seq read (if sda1 not exist, rewrite it)
$ ./read-measure.sh 
+ sudo hdparm -tT /dev/sda1
[sudo] password for kawa: 

/dev/sda1:
 Timing cached reads:   25114 MB in  2.00 seconds = 12567.22 MB/sec
 Timing buffered disk reads: 1616 MB in  3.00 seconds = 538.15 MB/sec

# Seq write
$ ./write-seq-measure.sh
+ dd bs=100M count=50 if=/dev/zero of=file4stest oflag=direct
50+0 records in
50+0 records out
5242880000 bytes (5.2 GB, 4.9 GiB) copied, 11.6733 s, 449 MB/s
+ rm file4stest

# Seq random write (if you use HDDs, rewrite 250000 to 2500 in the script)
$ ./write-rand-measure.sh 
+ dd bs=4K count=250000 if=/dev/zero of=file4rtest oflag=direct
250000+0 records in
250000+0 records out
1024000000 bytes (1.0 GB, 977 MiB) copied, 13.4192 s, 76.3 MB/s
+ rm file4rtest

# Comment: Done in Ubuntu 16.04 Server on ESXi (i7-3770, SAMSUNG V-NAND SSD 850 EVO 1TB)
~~~

