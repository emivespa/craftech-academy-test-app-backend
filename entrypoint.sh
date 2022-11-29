#!/bin/sh

if [ "$SQL_DATABASE" = "postgres" ]
then
	echo "Waiting for postgres..."
	started=0
	for time in 5 10 20 40; do
		sleep "$time"
		if nc -z "$SQL_HOST" "$SQL_PORT"; then
			started=1
			break
		fi
	done
	if "$started" != '1'; then
		exit 1
	fi
	echo "PostgreSQL started"
fi

# Uncomment below to flush db e.g. after running tests
# Just make sure you really mean it 
# python manage.py flush --no-input

# We have base custom user model so need to makemigrations out of box

if test "$ENTRYPOINT_FLUSH_AND_MIGRATE" = '1'; then
	python manage.py flush --no-input
	python manage.py migrate
fi
python manage.py runserver 0.0.0.0:"$RUNSERVER_PORT"

exec "$@"
