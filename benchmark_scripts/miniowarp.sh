source benchmark_configs/miniowarp.cfg

./warp mixed -host ${host} -access-key="${access_key}" -secret-key="${secret_key}" --objects=${objects} --obj.size=${object_size} --duration=${duration}
