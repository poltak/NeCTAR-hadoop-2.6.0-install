#!/bin/bash
#
# Bash script to pull and install Hadoop 2.6.0 distro and install

# Constants may need to be updated
HADOOP_BIN_SRC=http://apache.mirror.serversaustralia.com.au/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
HADOOP_BIN_SRC_CHECKSUM=http://apache.mirror.serversaustralia.com.au/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz.mds
HADOOP_INSTALL_PATH=/mnt/hadoop



# Install all prereq software
prereq_install() {
	apt-get update
	apt-get install default-jdk
}

# Sets up user account to be in use with hadoop
user_setup() {
	addgroup hadoop
	adduser --ingroup hadoop --add_extra_groups sudo hduser
}

# Create needed directories and set permissions
hadoop_dirs() {
	mkdir -p ${HADOOP_INSTALL_PATH}
	chown -R hadoop:hduser ${HADOOP_INSTALL_PATH}
}

# Downloads and verifies hadoop installation
download_hadoop() {
	cd ${HADOOP_INSTALL_PATH}
	wget ${HADOOP_BIN_SRC}
	wget ${HADOOP_BIN_SRC_CHECKSUM}
}

main() {
	prereq_install
	user_setup
	hadoop_dirs


}
