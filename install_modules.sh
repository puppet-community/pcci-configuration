#!/bin/bash

if ! [ -x /usr/bin/puppet ]; then
    echo "puppet not found"
    exit 1
fi

declare -A SOURCE_MODULES
MODULE_PATH="/etc/puppet/modules"

SCRIPT_NAME=$(basename $0)
SCRIPT_DIR=$(readlink -f "$(dirname $0)")

MODULE_ENV_FILE=${MODULE_FILE:-modules.env}
MODULE_ENV_PATH=${MODULE_ENV_PATH:-${SCRIPT_DIR}}
if [ -f "${MODULE_ENV_PATH}/${MODULE_ENV_FILE}" ] ; then
    . "${MODULE_ENV_PATH}/${MODULE_ENV_FILE}"
fi

if [ -z "${!SOURCE_MODULES[*]}" ] ; then
    echo ""
    echo "WARNING: nothing to do, unable to find MODULES or SOURCE_MODULES"
    echo "  export options, try setting MODULE_ENV_PATH or MODULE_ENV_FILE"
    echo "  export to the proper location of modules.env file."
    echo ""
    exit 0
fi


function remove_module {
    local SHORT_MODULE_NAME=$1
    if [ -n "$SHORT_MODULE_NAME" ]; then
        rm -Rf "$MODULE_PATH/$SHORT_MODULE_NAME"
    else
        echo "ERROR: remove_module requires a SHORT_MODULE_NAME."
    fi
}




MODULE_LIST=`puppet module list`

# Make a second pass, just installing modules from source
for MOD in ${!SOURCE_MODULES[*]} ; do
    # get the name of the module directory
    if [ `echo $MOD | awk -F. '{print $NF}'` = 'git' ]; then
        echo "Remote repos of the form repo.git are not supported: ${MOD}"
        exit 1
    fi  
    MODULE_NAME=`echo $MOD | awk -F- '{print $NF}'`
    # set up git base command to use the correct path
    GIT_CMD_BASE="git --git-dir=${MODULE_PATH}/${MODULE_NAME}/.git --work-tree ${MODULE_PATH}/${MODULE_NAME}"
    # treat any occurrence of the module as a match
    if ! echo $MODULE_LIST | grep "${MODULE_NAME}" >/dev/null 2>&1; then
        # clone modules that are not installed
        git clone $MOD "${MODULE_PATH}/${MODULE_NAME}"
    else
        if [ ! -d ${MODULE_PATH}/${MODULE_NAME}/.git ]; then
            echo "Found directory ${MODULE_PATH}/${MODULE_NAME} that is not a git repo, deleting it and reinstalling from source"
            remove_module $MODULE_NAME
            git clone $MOD "${MODULE_PATH}/${MODULE_NAME}"
        elif [ `${GIT_CMD_BASE} remote show origin | grep 'Fetch URL' | awk -F'URL: ' '{print $2}'` != $MOD ]; then 
            echo "Found remote in ${MODULE_PATH}/${MODULE_NAME} that does not match desired remote ${MOD}, deleting dir and re-cloning"
            remove_module $MODULE_NAME
            git clone $MOD "${MODULE_PATH}/${MODULE_NAME}"
        fi  
    fi  
    # fetch the latest refs from the repo
    $GIT_CMD_BASE remote update
    # make sure the correct revision is installed, I have to use rev-list b/c rev-parse does not work with tags
    if [ `${GIT_CMD_BASE} rev-list HEAD --max-count=1` != `${GIT_CMD_BASE} rev-list ${SOURCE_MODULES[$MOD]} --max-count=1` ]; then 
        # checkout correct revision
        $GIT_CMD_BASE checkout ${SOURCE_MODULES[$MOD]}
    fi  
done




