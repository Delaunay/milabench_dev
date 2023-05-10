
WORKDIR=/home/mila/d/delaunap/scratch/milabench
CONFIG=${WORKDIR}/milabench/config/standard.yaml
OUTPUT=${WORKDIR}/results

export MILABENCH_BASE=${WORKDIR}/results
export MILABENCH_CONFIG=${WORKDIR}/milabench/config/standard.yaml
export MILABENCH_GPU_ARCH=cuda

install:
	milabench install

prepare:
	milabench prepare

setup: install prepare

run:
	milabench run

slurm:
	sbatch --gpus-per-task=a100:1 --ntasks-per-node=8 --cpus-per-task=16 --mem=0 --reservation=milabench slurm.sh