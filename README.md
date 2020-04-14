sudo yum -y update <br>
sudo yum -y install git <br>
git clone https://github.com/ankan2013/ceph_benchmark <br>
cd ceph_benchmark <br>
sudo chmod +x benchmark.sh <br>
в benchmark_configs/fio_cephfs.cfg для переменной monitors перечислить адреса всех мониторов кластера <br>
в benchmark_configs/miniowarp.cfg указать для соответствующих переменных access_key и secret_key для rgw, а также для переменной host адрес rgw и порт <br>
в benchmark.sh можно закомментировать ненужные тесты (запуск тестов это последние 5 строк) <br>
запуск - sudo ./benchmark.sh <br>
результаты будут находиться в директории benchmark_results в корне проекта <br>
