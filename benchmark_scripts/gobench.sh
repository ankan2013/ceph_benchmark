source benchmark_configs/gobench.cfg
git clone https://github.com/rumanzo/ceph-gobench.git
sudo yum -y install golang
go get -v -u code.cloudfoundry.org/bytefmt
sudo yum -y install librados-devel
go get -v -u github.com/ceph/go-ceph/rados
go get -v -u github.com/juju/gnuflag
go get -v -u github.com/fatih/color
cd ceph-gobench
go build
cd ..

ceph osd pool create bench 100 100
ceph osd pool set bench min_size 1
ceph osd pool set bench size 1

./ceph-gobench/ceph-gobench -t ${threads} -d ${duration} -o ${obj_size} -s ${block_size} --parallel=${parallel} > benchmark_results/gobench.txt

ceph osd pool delete bench bench --yes-i-really-really-mean-it

sudo rm -rf ceph-gobench
