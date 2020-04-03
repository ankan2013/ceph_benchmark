mkdir cephfs_mountpoint
sudo mount -t ceph s1,s2,s3:6789:/ cephfs_mountpoint/ -o name=cephfs_hpc
fio benchmark_configs/fio_cephfs.ini
sudo umount cephfs_mountpoint
sudo rm -rf cephfs_mountpoint
