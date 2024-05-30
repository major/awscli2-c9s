# awscli2-c9s

The awscli2 package will appear in CentOS Stream 9 and RHEL soon, but you can test the container from this repository with podman via this command:

```bash
podman run --rm -it -v ~/.aws:/root/.aws:Z --name awscli2 ghcr.io/major/awscli2-c9s:main
```
