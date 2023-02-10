FROM registry.fedoraproject.org/fedora:37
RUN dnf -y install 'dnf-command(copr)' createrepo_c && \
    dnf -y copr enable @kernel-vanilla/fedora && \
    dnf -y install kernel kernel-core kernel-modules kernel-modules-extra && \
    dnf clean all
COPY download.sh /usr/local/bin/download.sh
ENTRYPOINT /usr/local/bin/download.sh
