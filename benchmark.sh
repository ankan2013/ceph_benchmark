mkdir benchmark_results
./benchmark_scripts/miniowarp.sh > benchmark_results/miniowarp.txt
sudo ./benchmark_scripts/fio_rbd.sh > benchmark_results/fio_rbd.txt
./benchmark_scripts/gobench.sh > benchmark_results/gobench.txt
sudo ./benchmark_scripts/fio_cephfs.sh > benchmark_results/fio_cephfs.txt
