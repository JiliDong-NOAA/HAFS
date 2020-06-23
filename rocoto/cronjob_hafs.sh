#!/bin/sh
set -x
date

# NOAA WCOSS Dell Phase3
#HOMEhafs=/gpfs/dell2/emc/modeling/noscrub/${USER}/save/HAFS
#dev="-s sites/wcoss_dell_p3.ent -f"
#PYTHON3=/usrx/local/prod/packages/python/3.6.3/bin/python3

# NOAA WCOSS Cray
#HOMEhafs=/gpfs/hps3/emc/hwrf/noscrub/${USER}/save/HAFS
#dev="-s sites/wcoss_cray.ent -f"
#PYTHON3=/opt/intel/intelpython3/bin/python3

# NOAA RDHPCS Jet
HOMEhafs=/mnt/lfs4/HFIP/hwrfv3/${USER}/HAFS_community_fork_20200504/HAFS
dev="-s sites/xjet.ent -f"
PYTHON3=/apps/intel/intelpython3/bin/python3

# NOAA RDHPCS Hera
# HOMEhafs=/scratch1/NCEPDEV/hwrf/save/${USER}/HAFS
# dev="-s sites/hera.ent -f"
# PYTHON3=/apps/intel/intelpython3/bin/python3

cd ${HOMEhafs}/rocoto

EXPT=$(basename ${HOMEhafs})
scrubopt="config.scrub_work=no config.scrub_com=no"

#===============================================================================
# Here are some simple examples, more examples can be seen in cronjob_hafs_rt.sh

# Run all cycles of a storm
#${PYTHON3} ./run_hafs.py ${dev} 2019 05L HISTORY config.EXPT=${EXPT}# Dorian

# Run specified cycles of a storm
#${PYTHON3} ./run_hafs.py ${dev} 2018083018-2018083100 06L HISTORY \
#   config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_try1 # Florence

# Run one cycle of a storm
## ${PYTHON3} ./run_hafs.py -t ${dev} 2019090200 00L HISTORY config.EXPT=${EXPT}

# ${PYTHON3} ./run_hafs.py -t ${dev} 2019082812 00L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_esg3122_grib2ab_lbc \
#     config.ictype=gfsnemsio config.bctype=gfsgrib2ab_0p25 \
#     config.NHRS=126 ${scrubopt} \
#     ../parm/hafs_regional_static.conf

 ${PYTHON3} ./run_hafs.py -t ${dev} 2019082412-2019090718 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_esg3122_ctrl \
     config.ictype=gfsnemsio config.bctype=gfsgrib2ab_0p25 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hafs_regional_static.conf



#===============================================================================

date

echo 'cronjob done'
