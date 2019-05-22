#!/usr/bin/env bash

CMD="airflow"


if [ "$1" = "webserver" ]; then
  echo "Initialize database..."
  $CMD initdb
fi
sleep 10
$CMD "$@"
case "$1" in
    scheduler)
	while true; do
            echo "Running scheduler at "$(date)
       	done
       	;;
    *)
        echo "done"
        ;;
esac


