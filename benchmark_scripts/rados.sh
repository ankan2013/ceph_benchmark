source benchmark_configs/rados.cfg
ceph osd pool create radosbench 100 100

echo "Sequential writes"
rados bench -p radosbench -t ${iodepth_seq_ops} ${seconds} write --no-cleanup

echo "Sequential reads"
rados bench -p rados -p radosbench -t ${iodepth_seq_ops} ${seconds} seq
echo "Random reads"
rados bench -p radosbench -t 1 ${seconds} rand
echo "Random reads with large iodepth"
rados bench -p radosbench -t ${iodepth_rand_reads_deep} ${seconds} rand

ceph osd pool delete radosbench radosbench --yes-i-really-really-mean-it
