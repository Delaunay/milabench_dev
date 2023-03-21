#!/bin/sh

WORKDIR=/home/mila/d/delaunap/scratch/milabench
CONFIG=${WORKDIR}/milabench/config/standard-cuda.yaml
OUTPUT=${WORKDIR}/results

export MILABENCH_BASE=${WORKDIR}/results
export MILABENCH_CONFIG=${WORKDIR}/milabench/config/standard-cuda.yaml
export MILABENCH_GPU_ARCH=cuda

export PATH="${WORKDIR}/conda/bin:${PATH}"
${WORKDIR}/conda/bin/conda activate base
milabench run ${CONFIG} --base ${OUTPUT}
