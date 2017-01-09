FROM debian
MAINTAINER Thomas Rodenhausen <thomas.rodenhausen@gmail.com>
LABEL Description="This image is used to setup e3, euler2 and euler2-demos in a Debian OS"
RUN apt-get update
RUN apt-get install -y make
RUN apt-get install -y gcc
RUN apt-get install -y git
RUN apt-get install -y wget
RUN apt-get install -y graphviz
RUN apt-get install -y python-pip
RUN wget https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh -P /opt/anaconda2
RUN chmod +x /opt/anaconda2/Anaconda2-4.2.0-Linux-x86_64.sh
RUN /opt/anaconda2/Anaconda2-4.2.0-Linux-x86_64.sh -b -f -p /opt/anaconda2
RUN pip install pyyaml
RUN pip install docopt
RUN pip install pinject
RUN pip install autologging
RUN git clone https://github.com/EulerProject/EulerX /opt/eulerx
RUN git clone https://github.com/EulerProject/e3 /opt/e3
RUN git clone https://github.com/EulerProject/e3-kernel /opt/e3-kernel
RUN /opt/e3-kernel/install_script.sh 
RUN git clone https://github.com/EulerProject/euler2-demos /opt/euler2-demos
RUN wget http://www.dlvsystem.com/files/dlv.x86-64-linux-elf-static.bin -P /opt/reasoners/dlv
RUN wget -O /opt/reasoners/gringo-3.0.3-x86-linux.tar.gz "http://downloads.sourceforge.net/project/potassco/gringo/3.0.3/gringo-3.0.3-x86-linux.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpotassco%2Ffiles%2Fgringo%2F3.0.3%2F&ts=1483572819&use_mirror=master"
RUN wget -O /opt/reasoners/claspD-1.1.4-x86-linux.tar.gz "http://downloads.sourceforge.net/project/potassco/claspD/1.1.4/claspD-1.1.4-x86-linux.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpotassco%2Ffiles%2FclaspD%2F1.1.4%2F&ts=1483579150&use_mirror=master"
RUN wget http://www.cs.unm.edu/%7Emccune/mace4/download/LADR-2009-11A.tar.gz -P /opt/reasoners
RUN tar zxvf /opt/reasoners/gringo-3.0.3-x86-linux.tar.gz -C /opt/reasoners
RUN rm -R /opt/reasoners/gringo-3.0.3-x86-linux.tar.gz
RUN tar zxvf /opt/reasoners/claspD-1.1.4-x86-linux.tar.gz -C /opt/reasoners/
RUN rm -R /opt/reasoners/claspD-1.1.4-x86-linux.tar.gz
RUN tar zxvf /opt/reasoners/LADR-2009-11A.tar.gz -C /opt/reasoners
RUN rm /opt/reasoners/LADR-2009-11A.tar.gz
RUN make all -C /opt/reasoners/LADR-2009-11A
RUN ln -s /opt/reasoners/dlv/dlv.x86-64-linux-elf-static.bin /usr/local/bin/dlv
RUN ln -s /opt/reasoners/gringo-3.0.3-x86-linux/gringo /usr/local/bin/gringo
RUN ln -s /opt/reasoners/claspD-1.1.4/claspD-1.1.4 /usr/local/bin/claspD
RUN ln -s /opt/reasoners/LADR-2009-11A/bin/mace4 /usr/local/bin/mace4
RUN ln -s /opt/reasoners/LADR-2009-11A/bin/prover9 /usr/local/bin/prover9
RUN ln -s /opt/eulerx/src-el/euler2 /usr/local/bin/euler2
RUN ln -s /opt/e3/e3 /usr/local/bin/e3
RUN chmod +x /usr/local/bin/dlv
