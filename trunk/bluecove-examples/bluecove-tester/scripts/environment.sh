#!/bin/sh
# @version $Revision$ ($Author$) $Date$
#
# echo SCRIPTS_DIR=${SCRIPTS_DIR}
#make absolute path
#pushd ${SCRIPTS_DIR}
SAVE_DIR=`pwd`
cd "${SCRIPTS_DIR}"
SCRIPTS_DIR=`pwd`
#popd
cd "${SAVE_DIR}"
# echo SCRIPTS_DIR=${SCRIPTS_DIR}
. "${SCRIPTS_DIR}/version.sh"
if [[ ! "$?" = "0" ]]; then
    echo Error calling version.sh
    exit 1
fi

BLUECOVE_TESTER_HOME=`dirname "${SCRIPTS_DIR}"`
BLUECOVE_HOME=`dirname "${BLUECOVE_TESTER_HOME}"`
BLUECOVE_HOME=`dirname "${BLUECOVE_HOME}"`
BLUECOVE_PROJECT_HOME=${BLUECOVE_HOME}/bluecove
BLUECOVE_JAR="${BLUECOVE_PROJECT_HOME}/target/bluecove-${BLUECOVE_VERSION}.jar"
BLUECOVE_GPL_PROJECT_HOME=${BLUECOVE_HOME}/bluecove-gpl
BLUECOVE_GPL_JAR="${BLUECOVE_GPL_PROJECT_HOME}/target/bluecove-gpl-${BLUECOVE_VERSION}.jar"

BLUECOVE_BLUEZ_PROJECT_HOME=${BLUECOVE_HOME}/bluecove-bluez
BLUECOVE_BLUEZ_JAR="${BLUECOVE_BLUEZ_PROJECT_HOME}/target/bluecove-bluez-${BLUECOVE_VERSION}.jar"

BLUECOVE_TESTER_JAR="${BLUECOVE_TESTER_HOME}/target/bluecove-tester-${BLUECOVE_VERSION}.jar"
BLUECOVE_TESTER_APP_JAR="${BLUECOVE_TESTER_HOME}/target/bluecove-tester-${BLUECOVE_VERSION}-app.jar"

BLUECOVE_TESTER_BASE_PROJECT_HOME=${BLUECOVE_HOME}/bluecove-examples/bluecove-tester-base

BLUECOVE_3RDPARTY_HOME=`dirname "${BLUECOVE_HOME}"`/3p
BLUECOVE_MAIN=net.sf.bluecove.se.Main
#echo BLUECOVE_TESTER_APP_JAR=${BLUECOVE_TESTER_APP_JAR}

BLUECOVE_TESTER_CP=${BLUECOVE_TESTER_HOME}/target/classes
BLUECOVE_TESTER_CP=${BLUECOVE_TESTER_CP}:${BLUECOVE_PROJECT_HOME}/target/classes
BLUECOVE_TESTER_CP=${BLUECOVE_TESTER_CP}:${BLUECOVE_TESTER_BASE_PROJECT_HOME}/target/classes
BLUECOVE_TESTER_CP=${BLUECOVE_TESTER_CP}:${BLUECOVE_TESTER_HOME}/target/cldcunit.jar

if [[ ! -f ${BLUECOVE_JAR} ]] ; then
  echo "BlueCove not found ${BLUECOVE_JAR}"
  exit 1
fi