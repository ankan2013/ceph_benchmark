source benchmark_configs/miniowarp.cfg

mkdir minio_warp
wget https://github.com/minio/warp/releases/download/v${warp_version}/warp_${warp_version}_${os_type}.tar.gz -P minio_warp
tar -xf minio_warp/warp_${warp_version}_${os_type}.tar.gz -C minio_warp
./minio_warp/warp mixed -host ${host} -access-key="${access_key}" -secret-key="${secret_key}" --objects=${objects} --obj.size=${object_size} --duration=${duration}
mkdir benchmark_results/minio_warp_fixed_size
mv warp-mixed* benchmark_results/minio_warp_fixed_size
./minio_warp/warp mixed -host ${host} -access-key="${access_key}" -secret-key="${secret_key}" --objects=${objects} --obj.randsize --obj.size=${object_size} --duration=${duration}
mkdir benchmark_results/minio_warp_random_size
mv warp-mixed* benchmark_results/minio_warp_random_size
sudo rm -rf minio_warp

