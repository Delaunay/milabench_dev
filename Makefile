



WORKDIR=/home/mila/d/delaunap/scratch/milabench
CONFIG=${WORKDIR}/milabench/config/standard-cuda.yaml
OUTPUT=${WORKDIR}/results

export MILABENCH_BASE=${WORKDIR}/results
export MILABENCH_CONFIG=${WORKDIR}/milabench/config/standard-cuda.yaml
export MILABENCH_GPU_ARCH=cuda

install-conda:
	wget https://repo.anaconda.com/miniconda/Miniconda3-py39_23.1.0-1-Linux-x86_64.sh
	bash Miniconda3-py39_23.1.0-1-Linux-x86_64.sh -b -p ${WORKDIR}/conda
	${WORKDIR}/conda/bin/conda init

install-milabench:
	${WORKDIR}/conda/bin/conda init
	export PATH="${WORKDIR}/conda/bin:${PATH}"
	${WORKDIR}/conda/bin/conda activate base
	pip install -e milabench/


install:
	milabench install ${CONFIG} --base ${OUTPUT}

prepare:
	milabench prepare ${CONFIG} --base ${OUTPUT}

nightly:
	milabench pip uninstall torch torchvision torchaudio torchtext -y
	milabench pip install --pre torch torchvision torchaudio torchtext --index-url https://download.pytorch.org/whl/cu118
	milabench pip install -U pytorch-lightning==1.9.4
	milabench pip uninstall lightning-bolts -y
	milabench pip install git+https://github.com/Delaunay/lightning-bolts.git@patch-1

setup: install prepare nightly

run:
	milabench run ${CONFIG} --base ${OUTPUT}

run-lightning:
	PL_RECONCILE_PROCESS=1 milabench run ${CONFIG} --base ${OUTPUT} --select vit_l_32 --sync

clean-result:
	rm -rf ${OUTPUT}/runs


slurm:
	sbatch --gpus-per-task=a100:1 --ntasks-per-node=8 --cpus-per-task=16 --mem=0 --reservation=milabench slurm.sh