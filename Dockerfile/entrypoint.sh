#!/bin/bash
#
source /opt/py3/bin/activate && /opt/jumpserver/jms start all -d && /opt/coco/cocod start -d
/usr/sbin/nginx

#supervisord
