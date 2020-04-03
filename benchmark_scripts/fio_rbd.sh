ceph osd pool create rbdbench 80 80
rbd create block_device --size 5G --pool rbdbench
rbd feature disable block_device exclusive-lock object-map fast-diff deep-flatten --pool rbdbench
sudo rbd map block_device --pool rbdbench --name client.admin
sudo /sbin/mkfs.ext4 -m0 /dev/rbd/rbdbench/block_device

printf "Sequential writes\n"
fio benchmark_configs/fio_rbd_write.ini
printf "\n"
printf "Random writes\n"
fio benchmark_configs/fio_rbd_randwrite.ini
printf "\n"
printf "Random writes deep\n"
fio benchmark_configs/fio_rbd_randwrite_deep.ini
printf "\n"
printf "Sequential reads\n"
fio benchmark_configs/fio_rbd_read.ini
printf "\n"
printf "Random reads\n"
fio benchmark_configs/fio_rbd_randread.ini
printf "\n"
printf "Random reads deep\n"
fio benchmark_configs/fio_rbd_randread_deep.ini
printf "\n"


sudo rbd unmap block_device --pool rbdbench
sudo rbd remove block_device --pool rbdbench
ceph osd pool delete rbdbench rbdbench --yes-i-really-really-mean-it

