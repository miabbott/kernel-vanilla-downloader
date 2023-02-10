#!/usr/bin/bash
set -eou pipefail

if [ -z ${REPODIR+x} ]; then
    echo "REPODIR env var is not set; check REPODIR is correctly set and passed to container"
    exit 1
fi

dnf -y --downloadonly --destdir /host --repo=copr:copr.fedorainfracloud.org:group_kernel-vanilla:fedora reinstall kernel kernel-core kernel-modules kernel-modules-extra
createrepo_c /host
cat << EOF > /host/kernel-vanilla-local.repo
[kernel-vanilla-local]
baseurl=file://${REPODIR}
gpgcheck=0
enabled=1
EOF
