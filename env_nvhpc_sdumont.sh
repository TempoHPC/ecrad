#!/bin/bash

module load sequana/current
module load git/2.23_sequana
module load cmake/3.23.2_sequana
module load make/make-4.3_sequana
module load python/3.8.2_sequana
module load gcc/9.3_sequana
alias python='python3.8'
alias python3='python3.8'
module use /scratch/cenapadrjsd/rpsouto/opt/nvidia/hpc_sdk/modulefiles
module load nvhpc/22.2
. /scratch/cenapadrjsd/rpsouto/sequana/usr/local/spack/git/spack_nvhpc_22.2/share/spack/setup-env.sh
export SPACK_USER_CONFIG_PATH=/scratch/cenapadrjsd/rpsouto/.spack/v0.17.1_nvhpc_22.2

#Carrega o netcdf-fortran@4.5.3
spack load /uvcnbiv
