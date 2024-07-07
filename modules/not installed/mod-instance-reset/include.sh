#!/usr/bin/env bash

MOD_INSTANCE_RESET_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"

source $MOD_INSTANCE_RESET_ROOT"/conf/conf.sh.dist"

if [ -f $MOD_INSTANCE_RESET_ROOT"/conf/conf.sh" ]; then
    source $MOD_INSTANCE_RESET_ROOT"/conf/conf.sh"
fi
