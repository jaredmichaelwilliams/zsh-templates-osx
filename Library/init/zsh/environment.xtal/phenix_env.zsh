#!/bin/zsh 
#
#PHENIX=/usr/local/phenix-1.3b
PHENIX=$( command ls -1td /usr/local/phenix* | /usr/bin/head -n 1)
export PHENIX
if [[ -e $PHENIX/conf/installer-time-stamp ]]; then
  PHENIX_INSTALLER_DATE=`cat $PHENIX/conf/installer-time-stamp`
  export PHENIX_INSTALLER_DATE
fi
PHENIX_VERSION=1.3b
PHENIX_ENVIRONMENT=1
PHENIX_MTYPE=`$PHENIX/bin/machine_type`
PHENIX_MVERSION=`$PHENIX/bin/machine_version`
export PHENIX_VERSION
export PHENIX_ENVIRONMENT
export PHENIX_MTYPE
export PHENIX_MVERSION
#
if [[ "$PHENIX_MTYPE" == "unknown-unknown" ]]; then
  exit 1
fi
#
PHENIX_USE_MTYPE=`$PHENIX/bin/find-installation --dir=$PHENIX --mtype=$PHENIX_MTYPE`
export PHENIX_USE_MTYPE
if [[ "$PHENIX_USE_MTYPE" == "not-found" ]]; then
  echo no suitable PHENIX installation found
  exit 1
else
  PHENIX_MTYPE=$PHENIX_USE_MTYPE
  export PHENIX_MTYPE
fi
if [[ -e $PHENIX/build/$PHENIX_MTYPE/setpaths.sh ]]; then
  . $PHENIX/build/$PHENIX_MTYPE/setpaths.sh
fi
#
