source benchmark_configs/fio_cephfs.cfg
mkdir cephfs_data
mkdir cephfs_data/mountpoint
sudo mount -t ceph ${monitors}:/ cephfs_data/mountpoint/

fio benchmark_configs/fio_cephfs.ini

sudo umount cephfs_data/mountpoint
sudo rm -rf cephfs_data

