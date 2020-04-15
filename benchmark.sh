mkdir benchmark_results
#sudo yum -y install wget
#sudo yum -y install fio
#sudo yum -y install tar

#sudo chmod +x benchmark_scripts/miniowarp.sh
#sudo chmod +x benchmark_scripts/fio_rbd.sh
#sudo chmod +x benchmark_scripts/gobench.sh
#sudo chmod +x benchmark_scripts/fio_cephfs.sh
#sudo chmod +x benchmark_scripts/rados.sh

#./benchmark_scripts/miniowarp.sh
sudo ./benchmark_scripts/fio_rbd.sh > benchmark_results/fio_rbd.txt
#./benchmark_scripts/gobench.sh
sudo ./benchmark_scripts/fio_cephfs.sh > benchmark_results/fio_cephfs.txt
#sudo ./benchmark_scripts/rados.sh > benchmark_results/rados.txt
