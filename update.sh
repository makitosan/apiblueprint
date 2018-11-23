#!/bin/bash

# Move to current dire
cd "$(dirname "$0")"

# get the remote status
git remote update

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull
    # create dir tmp
    mkdir -p tmp
    mkdir -p logs

    DOC_APIB_FILE=`pwd`/tmp/api.apib
    DOC_HTML_FILE="/var/www/api.ggbvv.com/index.html"
    NOW_DTTM=`date "+%Y%m%d%H%M%S"`
    LOG_FILE="${NOW_DTTM}_apib2html.log"

    echo "[`date \"+%Y-%m-%d %H:%M:%S\"`] starting" | tee -a logs/$LOG_FILE

    rm -f $DOC_APIB_FILE

    # headers
    echo 'FORMAT: 1A' > $DOC_APIB_FILE || exit $?
    echo '' >> $DOC_APIB_FILE
    cat ./docs/*md | sed -e '/^FORMAT: 1A/d' >> $DOC_APIB_FILE || exit $?

    aglio -i $DOC_APIB_FILE -o $DOC_HTML_FILE >> logs/$LOG_FILE

    ERROR_ROWS=`grep -e "ERROR" logs/$LOG_FILE | wc -l`
    WARNING_ROWS=`grep -e "WARNING" logs/$LOG_FILE | wc -l`

    if [ ${ERROR_ROWS} -ne 0 ]; then
      echo "Error occurred"
      grep -e "ERROR" ./logs/$LOG_FILE
    fi

    if [ ${WARNING_ROWS} -ne 0 ]; then
      echo "Some warnings detected"
      grep -e "WARNING" ./logs/$LOG_FILE
    fi

    echo "[`date \"+%Y-%m-%d %H:%M:%S\"`] finished" | tee -a logs/$LOG_FILE
    echo "API blueprint file created ${DOC_HTML_FILE}" | tee -a logs/$LOG_FILE
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
