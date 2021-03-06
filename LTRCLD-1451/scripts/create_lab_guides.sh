#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app
LOGGER=echo
LOGGER_EMERGENCY="echo $(date +"%Y-%m-%d %H:%M") | EMERG | "
LOGGER_ALERT="echo $(date +"%Y-%m-%d %H:%M") | ALERT | "
LOGGER_CRITICAL="echo $(date +"%Y-%m-%d %H:%M") | CRIT | "
LOGGER_ERROR="echo $(date +"%Y-%m-%d %H:%M") | ERROR | "
LOGGER_WARNING="echo $(date +"%Y-%m-%d %H:%M") | WARN | "
LOGGER_NOTICE="echo $(date +"%Y-%m-%d %H:%M") | NOTICE | "
LOGGER_INFO="echo $(date +"%Y-%m-%d %H:%M") | INFO | "
LOGGER_DEBUG="echo $(date +"%Y-%m-%d %H:%M") | DEBUG | "

arg1="${1:-}"

# Pull latest repo
git pull
# Walk through the POD numbers to fix LAB_GUIDE
for i in {101..130}
do
j=`expr ${i} + 100`
cp ../LAB_GUIDE.md LAB_GUIDE_${i}.md
gsed -i "s/XXX/${i}/g" LAB_GUIDE_${i}.md
gsed -i "s/YXX/${j}/g" LAB_GUIDE_${i}.md
done
