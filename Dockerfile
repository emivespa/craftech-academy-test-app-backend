FROM python:3.8.3-alpine
	# FIXME: from tarea-clase-2-docker-grupo-29-junio-202

WORKDIR /

# Dependencies:
#
# TODO: test with:
#	RUN apk add --update --no-cache --virtual .tmp-build-deps \
#	# ...
#	RUN apk del --no-cache .tmp-build-deps
RUN apk update
RUN apk add --update --no-cache \
	gcc \
	libc-dev \
	linux-headers \
	postgresql-dev \
	musl-dev \
	zlib \
	zlib-dev
RUN apk add --update --no-cache libpq python3-dev # psycopg build deps, see website.
RUN apk add --update --no-cache graphviz-dev jpeg-dev
	# https://craftech-community.slack.com/archives/C03L44FTZ1V/p1661305174923369?thread_ts=1661255044.779149&cid=C03L44FTZ1V
	# TODO: are these necessary?

COPY ./requirements.txt /requirements.txt

RUN pip3 install -r requirements.txt

RUN mkdir app

WORKDIR /app

COPY . .

EXPOSE 8000

CMD [ "sh", "-x", "./entrypoint.sh" ]
