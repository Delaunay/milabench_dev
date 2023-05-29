
WORKDIR=$(pwd)
CONFIG=${WORKDIR}/milabench/config/standard.yaml
OUTPUT=${WORKDIR}/results

export MILABENCH_BASE=${WORKDIR}/results
export MILABENCH_CONFIG=${WORKDIR}/milabench/config/standard.yaml
export MILABENCH_GPU_ARCH=rocm
export MILABENCH_DASH=no


if [ ! -d "${WORKDIR}/base" ]; then 
    module load python/3.9
    python -m venv base

    source base/bin/activate
    
    pip install --upgrade pip
    pip install -e ${WORKDIR}/milabench
    pip install -e ${WORKDIR}/voir

    milabench install
    milabench prepare
fi

source base/bin/activate

# pip install -e ${WORKDIR}/milabench
# pip install -e ${WORKDIR}/voir

# milabench install
# milabench prepare
ROCR_VISIBLE_DEVICES=0,1,2,3 milabench run --select dlrm

