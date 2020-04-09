sudo yum -y install git
git clone https://github.com/ankan2013/ceph_benchmark
cd ceph_benchmark
в benchmark_configs/fio_cephfs.cfg для переменной monitors перечислить адреса всех мониторов кластера
в benchmark_configs/miniowarp.cfg указать для соответствующих переменных access_key и secret_key для rgw, а также для переменной host адрес rgw и порт
sudo ./benchmark.sh
результаты будут находиться в директории benchmark_results
