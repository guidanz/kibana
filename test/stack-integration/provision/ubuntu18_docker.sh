#!/bin/bash
set -x

#cd "$( dirname "${BASH_SOURCE[0]}" )"
QADIR=/vagrant/qa
cd $QADIR

# First we write our env vars to a file, then run phase1.sh which will use them (and may add to them)
cat <<-PHASE1 >> envvars.sh
QADIR=/vagrant/qa
VMOS=ubuntu
VM=ubuntu18_docker
# filebeat is running and healthy but not loading any docs
BEATS="metricbeat packetbeat heartbeat"
PRODUCTS="elasticsearch kibana logstash apm-server \$BEATS"
OSS=
XPACK=YES
SECURITY=YES
LICENSE=TRIAL
# LICENSE=BASIC
# LICENSE=GOLD
# LICENSE=PLATINUM

LINUX_INSTALL_DIR=/usr/share

TLS=YES
ESURL=https://elastic:changeit@localhost:9200
KIBANAURL=http://elastic:changeit@localhost:5601
ESPROTO=https

# TLS=NO
# ESURL=http://elastic:changeit@localhost:9200
# KIBANAURL=http://elastic:changeit@localhost:5601
# ESPROTO=http

ESHOST=localhost
ESPORT=9200
KIBANAPWD=changeit

KIBANASERVERUSER=kibana
KIBANASERVERPWD=changeit

KIBANAFILEUSER=user
KIBANAFILEPWD=changeme

NATIVEKIBANAUSER=ironman
NATIVEKIBANAPWD=changeme

LOGSTASHUSER=logstash_internal
LOGSTASHPWD=changeme

BEATSUSER=beats_internal
BEATSPWD=changeme

PACKAGE=docker
PLATFORM=-x86_64
KIBANA_PLATFORM=-x86_64
KIBANAIP=localhost

DOTBAT=
INSTALL_DIR=/usr/share
CONFIG_DIR=/etc

ES_CONFIG=\${CONFIG_DIR}/elasticsearch/elasticsearch.yml

LOGSTASH_CONFIG=\${CONFIG_DIR}/logstash/conf.d/logstash.conf
LOGSTASH_YML_DIR=\${CONFIG_DIR}/logstash

KIBANA_CONFIG=\${CONFIG_DIR}/kibana/kibana.yml
KIBANA_LOG=/var/log/kibana/kibana.stdout

PHASE1

# ./docker_phase1.sh