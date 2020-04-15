sudo yum -y update <br>
sudo yum -y install git <br>
git clone https://github.com/ankan2013/ceph_benchmark <br>
cd ceph_benchmark <br>
sudo chmod +x benchmark.sh <br>
Указать для переменной directory в benchmark_configs/fio_cephfs.ini адрес директории в примонтированной CephFS, в которой можно размещать файлы для тестов. Если CephFS не примонтирована, внутри директории проекта можно сделать: <br>
mkdir cephfs_mountpoint <br>
sudo mount -t ceph mon1,mon2,mon3:/ cephfs_mountpoint/ (mon1, mon2, mon3, ... - адреса мониторов ceph) <br>
mkdir cephfs_mountpoint/files (и указать ее в fio_cephfs.ini) <br>
в benchmark_configs/miniowarp.cfg указать для соответствующих переменных access_key и secret_key для rgw, а также для переменной host адрес rgw и порт <br>
Создать нового пользователя S3 можно с помощью команды radosgw-admin user create --uid={username} --display-name="{display-name}", после ее выполнения отобразятся данные по новому пользователю, включая нужные ключи. <br>
в benchmark.sh можно закомментировать ненужные тесты (запуск тестов это последние 5 строк) <br>
запуск - sudo ./benchmark.sh <br>
результаты будут находиться в директории benchmark_results в корне проекта <br>
