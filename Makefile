
WORKDIR=/Tmp/slurm.3187814.0/milabench_dev
CONFIG=${WORKDIR}/milabench/config/standard.yaml
OUTPUT=${WORKDIR}/results

export MILABENCH_BASE=${WORKDIR}/results
export MILABENCH_CONFIG=${WORKDIR}/milabench/config/standard.yaml
export MILABENCH_GPU_ARCH=cuda
export MILABENCH_DASH=no

install:
	pip install -e ${WORKDIR}/milabench
	milabench install

prepare:
	milabench prepare

voir:
	# pip install -e ${WORKDIR}/milabench
	pip install -U -e ${WORKDIR}/voir
	milabench pip -e ${WORKDIR}/voir -U

setup: install prepare

run:
	milabench run

slurm:
	sbatch --gpus-per-task=a100:1 --ntasks-per-node=8 --cpus-per-task=16 --mem=0 --gpus 8 --reservation=milabench slurm.sh
	salloc --partition=staff-idt --reservation=milabench --nodes 1 --gpus 8 --cpus 32 --mem=0