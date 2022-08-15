FROM ubuntu:18.04

RUN apt update -y && apt upgrade -y && apt -y install libpython2.7 python-pkg-resources libsqlite3-dev python-apsw

RUN mkdir -p /opt/acestream

RUN wget -P /opt/acestream https://download.acestream.media/linux/acestream_3.1.49_ubuntu_18.04_x86_64.tar.gz

RUN tar xvf acestream_3.1.49_ubuntu_18.04_x86_64.tar.gz 

RUN rm acestream_3.1.49_ubuntu_18.04_x86_64.tar.gz 

RUN chmod +x /opt/acestream/start-engine

EXPOSE 8621 6878

ENTRYPOINT ["/opt/acestream/start-engine", "@/opt/acestream/acestream.conf"]

	
	
