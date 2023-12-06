FROM debian:bullseye

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN echo 'Asia/Shanghai' >/etc/timezone

RUN apt-get update &&\
    apt-get install -y \
	ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
	bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
	git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
	libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
	mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pyelftools \
	libpython3-dev qemu-utils rsync scons squashfs-tools subversion sudo swig texinfo time uglifyjs upx-ucl unzip \
	vim wget xmlto xxd zlib1g-dev python3-setuptools && \
    apt-get clean && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

# set system wide dummy git config
RUN git config --system user.name "user" && git config --system user.email "user@example.com"

USER user
WORKDIR /home/user
