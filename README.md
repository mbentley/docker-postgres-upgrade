# mbentley/postgres-upgrade

Docker image that helps with upgrading postgres

## Usage

You will need to mount the new and old data directories for postgres in the container at `/data/pg<version>` (for example, `/data/pg15`/ and `/data/pg16`). This is the directory where your data exists (there will be a `PG_VERSION` file in this directory for the version you're upgrading from):

```bash
docker run -it --rm \
  -v /path/to/my/postgres/data/pg15:/data/pg15 \
  -v /path/to/my/postgres/data/pg16:/data/pg16 \
  mbentley/postgres-upgrade:15-to-16
```

## Building the image

Check to make sure the version you're trying to upgrade from is available in the [Alpine packages](https://pkgs.alpinelinux.org/packages?name=postgresql1%3F&branch=v3.20&repo=&arch=x86_64&maintainer=). Here are a few examples:

### 15 to 16:

```bash
docker build --pull \
  --build-arg OLDVER=15 \
  --build-arg NEWVER=16 \
  -t mbentley/postgres-upgrade:15-to-16 .
```

### 14 to 15:

```bash
docker build --pull \
  --build-arg OLDVER=14 \
  --build-arg NEWVER=15 \
  -t mbentley/postgres-upgrade:14-to-15 .
```

### 14 to 16:

```bash
docker build --pull \
  --build-arg OLDVER=14 \
  --build-arg NEWVER=16 \
  -t mbentley/postgres-upgrade:14-to-16 .
```
