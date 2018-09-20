FROM centos:7

RUN yum update -y && yum install epel-release -y && yum update -y && yum install wget unzip nginx sqlite-devel xz gcc automake zlib-devel openssl-devel epel-release git redis vim supervisor -y

WORKDIR /opt/
RUN wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz -O /opt/Python-3.6.1.tar.xz
RUN tar vxf Python-3.6.1.tar.xz && cd Python-3.6.1 && ./configure && make && make install
RUN python3 -m venv py3

#RUN wget https://github.com/jumpserver/jumpserver/archive/master.zip -O /opt/jumpserver.zip
RUN wget https://github.com/jumpserver/jumpserver/archive/1.3.3.zip -O /opt/jumpserver.zip
#RUN wget https://github.com/jumpserver/coco/archive/master.zip -O /opt/coco.zip
RUN wget https://codeload.github.com/jumpserver/coco/zip/1.3.3 -O /opt/coco.zip
#RUN wget https://github.com/jumpserver/luna/releases/download/v1.0.0/luna.tar.gz -O /opt/luna.tar.gz
RUN wget https://github.com/jumpserver/luna/releases/download/1.3.3/luna.tar.gz -O /opt/luna.tar.gz
#RUN unzip coco.zip && mv coco-master coco && unzip jumpserver.zip && mv jumpserver-master jumpserver && tar xzf luna.tar.gz
RUN unzip coco.zip && mv coco-1.3.3 coco && unzip jumpserver.zip && mv jumpserver-1.3.3 jumpserver && tar xzf luna.tar.gz

RUN yum -y install $(cat /opt/jumpserver/requirements/rpm_requirements.txt) && yum -y install $(cat /opt/coco/requirements/rpm_requirements.txt)

RUN source /opt/py3/bin/activate && pip install --upgrade pip && pip install -r /opt/jumpserver/requirements/requirements.txt &&  pip install -r /opt/coco/requirements/requirements.txt
VOLUME /opt/coco/keys
VOLUME /opt/jumpserver/data

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY coco_conf.py /opt/coco/conf.py
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

#ENV REDIS_HOST=127.0.0.1 REDIS_PORT=6479
EXPOSE 2222 80

CMD ["/bin/bash"]
#ENTRYPOINT ["entrypoint.sh"]
