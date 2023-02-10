# kernel-vanilla-downloader

A one-off utility container to download the latest vanilla kernel and create
a local yum repo.

See <https://github.com/fedora-silverblue/issue-tracker/issues/411> for original context.

## Usage

```bash
export REPODIR=/var/tmp/kernel-vanilla-repo
mkdir -p ${REPODIR}
podman build -t localhost/kernel-vanilla-downloader:latest -f Containerfile .
podman run --rm -it --env REPODIR -v ${REPODIR}:/host:z localhost/kernel-vanilla-downloader:latest
```

Once your local `yum` repo has been created, you can copy the resulting .repo file
into `/etc/yum.repos.d/` and use it to override your kernel.  For example, with
a Silverblue system:

```bash
sudo cp ${REPODIR}/kernel-vanilla-local.repo /etc/yum.repos.d
sudo rpm-ostree override replace --experimental --freeze --from repo=kernel-vanilla-local kernel kernel-core kernel-modules kernel-modules-extra
```
