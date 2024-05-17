#!/bin/bash -e
#
# (C) Copyright 2014- ECMWF.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
#
# In applying this licence, ECMWF does not waive the privileges and immunities
# granted to it by virtue of its status as an intergovernmental organisation
# nor does it submit to any jurisdiction.

# Duplicate profiles with solar zenith angles varying from 0 to 90 degrees
# You need to have the nco netcdf tools in your PATH

# ./duplicate_profiles_new.sh i3rc_mls_cumulus.nc i3rc_mls_cumulus_sza_new.nc

INPUT=$1
OUTPUT=$2

NSZA=7854
COS_SZA_TMP=$(cat "cossenos.csv")

COS_SZA=$(echo $COS_SZA_TMP | tr -d '[:blank:]')

#NSZA=2
#COS_SZA='1,0.1'

# Check for existence of NCO commands
command -v ncks >/dev/null 2>&1 || { \
 echo "###########################################################" ; \
 echo "### Error: NCO commands (ncks etc) needed but not found ###" ; \
 echo "###########################################################" ; \
 exit 1; }

ncks -O --mk_rec_dmn column $INPUT tmp0.nc
ncrcat -O -n $NSZA,1,0 tmp0.nc tmp_$OUTPUT
ncap2 -O -s "cos_solar_zenith_angle(:)={$COS_SZA}" tmp_$OUTPUT $OUTPUT
rm tmp0.nc tmp_$OUTPUT
