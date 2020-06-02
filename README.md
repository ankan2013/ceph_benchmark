Установка Ceph с помощью ceph-deploy. <br>

Пусть s0 - имя хоста, с которого выполняется развертывание, s1, s2, s3 - имена хостов, на которых планируется установка мониторов, s4, ..., sN - имена хостов, на которых планируется установка только OSD. <br>
Между всеми хостами должен существовать беспарольный доступ по ssh. <br>

1. Установить на s0 сeph-deploy для нужной версии Ceph. <br>
2. Установить на s0 и s1...sN сервис синхронизации времени ntp, сделать s0 сервером и указать его на s1...sN как приоритетный для синхронизации <br>
3. Создать директорию для файла конфигурации и ключей кластера ceph и переместиться в нее (из нее следует выполняит все действия с кластером) <br>
4. Создать изначальную конфигурацию кластера и кластерное кольцо ключей - ceph-deploy new s1 s2 s3 <br>
В появившемся файле конфигурации ceph.conf указать адрес публичной сети - добавить строку public_network = ADDRESS/MASK. Если адрес кластерной сети отличается от адреса публичной сети, то добавить также строку cluster_network = ADDRESS/MASK. <br>
5. Установить пакеты Сeph - ceph-deploy --release VERSION_NAME install s1 s2 s3 ... sN <br>
6. Поднять мониторы, на узлах, указанных в изначальной конфигурации (в данном случае s1, s2, s3) - ceph-deploy create-initial <br>
7. Копировать файл кейринга для доступа к кластеру на узлы s1, s2, s3 - ceph-deploy admin s1 s2 s3  <br>

Далее для каждого узла sn, на котором собираемся поднимать osd (в данном примере диск для osd назовем /dev/sdb1): <br>

8. ssh root@sn 'umount /dev/sdb1' <br>
9. ceph-deploy disk prepare sn:/dev/sdb1 <br>
10. ceph-deploy disk activate sn:/dev/sdb1 <br>

11. Установить ceph на s0 - ceph-deploy install --release VERSION s0 - теперь s0 - клиент, с которого можно управлять кластером с помощью команды ceph. <br>
На некоторых узлах также можно поднять сервера метаданных для работы CephFS и rados gateways для работы в интерфейсе Amazon S3 (аналогично можно поднять и другие демоны Ceph): <br>
ceph-deploy rgw create s1 s2 s3 <br>
ceph-deploy mds create s1 s2 s3 <br>

Установка средств тестирования: <br>

1. sudo yum -y update <br>
2. sudo yum -y install git <br>
3. git clone https://github.com/ankan2013/ceph_benchmark <br>
4. cd ceph_benchmark <br>
5. sudo chmod +x benchmark.sh <br>
6. Указать для переменной directory в benchmark_configs/fio_cephfs.ini адрес директории в примонтированной CephFS, в которой можно размещать файлы для тестов. Если CephFS не примонтирована, внутри директории проекта можно сделать: <br>

1) mkdir cephfs_mountpoint <br>
2) sudo mount -t ceph mon1,mon2,mon3:/ cephfs_mountpoint/ (mon1, mon2, mon3, ... - адреса мониторов ceph) <br>
3) mkdir cephfs_mountpoint/files (и указать ее в fio_cephfs.ini) <br>

7. в benchmark_configs/miniowarp.cfg указать для соответствующих переменных access_key и secret_key для rgw, а также для переменной host адрес rgw и порт <br>

Создать нового пользователя S3 можно с помощью команды radosgw-admin user create --uid={username} --display-name="{display-name}", после ее выполнения отобразятся данные по новому пользователю, включая нужные ключи. <br>
в benchmark.sh можно закомментировать ненужные тесты (запуск тестов это последние 5 строк) <br>

Запуск средств тестирования - sudo ./benchmark.sh <br>

Результаты будут находиться в директории benchmark_results в корне проекта <br>
