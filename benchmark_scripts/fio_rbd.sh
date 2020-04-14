ceph osd pool create rbdbench 100 100
rbd create block_device --size 5G --pool rbdbench
rbd feature disable block_device exclusive-lock object-map fast-diff deep-flatten --pool rbdbench
sudo rbd map block_device --pool rbdbench --name client.admin
sudo /sbin/mkfs.ext4 -m0 /dev/rbd/rbdbench/block_device

fio benchmark_configs/fio_rbd.ini

sudo rbd unmap block_device --pool rbdbench
sudo rbd remove block_device --pool rbdbench
ceph osd pool delete rbdbench rbdbench --yes-i-really-really-mean-it
