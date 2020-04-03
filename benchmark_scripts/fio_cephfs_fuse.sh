mkdir ceph_fuse_mountpoint/
sudo ceph-fuse -m s1,s2,s3:6789 ceph_fuse_mountpoint/
fio benchmark_configs/fio_cephfs_fuse.ini
# stop???
