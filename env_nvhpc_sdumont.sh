#!/bin/bash

module load sequana/current
module load git/2.23_sequana
module load cmake/3.23.2_sequana
module load python/3.9.1_sequana
module load gcc/8.3_sequana
module use /scratch/cenapadrjsd/rpsouto/opt/nvidia/hpc_sdk/modulefiles
module load nvhpc/22.2

workdir=/scratch/cenapadrjsd/rpsouto
version=v0.17.1
partition=sequana
spackdir=${workdir}/spack/${partition}/${version}
. ${spackdir}/share/spack/setup-env.sh

export SPACK_USER_CONFIG_PATH=${workdir}/.spack/${partition}/${version}
export SPACK_USER_CACHE_PATH=/tmp

spack load netcdf-fortran@4.5.3%nvhpc@22.2
