FROM quay.io/centos/centos:stream9
RUN curl -s https://composes.stream.centos.org/development/ | egrep -o 'CentOS-Stream-9-[0-9\.d]*' | tail -n 1 > /latest-compose.txt
RUN echo -e "fastestmirror=1\nmax_parallel_downloads=20" >> /etc/dnf/dnf.conf
RUN dnf -qy install dnf-plugins-core && \
        dnf config-manager --add-repo https://composes.stream.centos.org/development/$(cat /latest-compose.txt)/compose/AppStream/x86_64/os/ && \
        dnf -qy --nogpgcheck install awscli2 less && \
        dnf clean all
RUN aws --version
