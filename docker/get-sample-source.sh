#!/bin/bash
pushd $(dirname $0)/..
docker run -d --name "deepstream-samples" nvcr.io/nvidia/deepstream-l4t:6.3-samples tail -f /dev/null
sample_source_dir=/opt/nvidia/deepstream/deepstream/sources/apps/sample_apps/deepstream-nvdsanalytics-test
docker cp deepstream-samples:${sample_source_dir}/deepstream_app_main.c src/
docker cp deepstream-samples:${sample_source_dir}/deepstream_nvdsanalytics_meta.cpp src/
docker cp deepstream-samples:${sample_source_dir}/deepstream_nvdsanalytics_test.cpp src/
docker cp deepstream-samples:${sample_source_dir}/Makefile src/
docker cp deepstream-samples:${sample_source_dir}/Makefile.ds src/
docker stop deepstream-samples
