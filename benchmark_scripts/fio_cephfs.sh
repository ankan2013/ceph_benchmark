source benchmark_configs/fio_cephfs.cfg
mkdir cephfs_mountpoint
sudo mount -t ceph ${monitors}:/ cephfs_mountpoint/
mkdir cephfs_mountpoint/files

fio benchmark_configs/fio_cephfs.ini
