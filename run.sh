
WORKDIR=$(pwd)
CONFIG=${WORKDIR}/milabench/config/standard.yaml
OUTPUT=${WORKDIR}/results

export MILABENCH_BASE=${WORKDIR}/results
export MILABENCH_CONFIG=${WORKDIR}/milabench/config/standard.yaml
export MILABENCH_GPU_ARCH=rocm
export MILABENCH_DASH=no

pip install -e ${WORKDIR}/milabench
pip install -e ${WORKDIR}/voir

milabench install
milabench prepare
milabench run
