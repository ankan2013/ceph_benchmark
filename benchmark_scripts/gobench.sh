ceph osd pool create bench 80 80
ceph osd pool set bench min_size 1
ceph osd pool set bench size 1
ceph osd pool set bench pg_num 100
# to avoid a *pg_num for pool limit exceeding* error on the creation of a pool with size (default) 3 and pg_num=100
# firstly created a pool with size 3 then decreased size then increased pg_num to 100 to fulfil ceph-gobench requirements

cd ceph-gobench
./ceph-gobench -t 10 -d 10s --rdefine "osd.[0-2]$" --parallel

ceph osd pool delete bench bench --yes-i-really-really-mean-it
