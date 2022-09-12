# docker-bdfr

Docker version of [bulk-downloader-for-reddit](https://github.com/aliparlakci/bulk-downloader-for-reddit). Currently tracking the development branch.

## Features
 - Configurable: runs python3 -m bdfr download using the `--opts` option to allow for configuring bdfr via a yaml file.
   - Only on the development branch as of now. See [Options](https://github.com/aliparlakci/bulk-downloader-for-reddit/tree/development#options) and [their example yaml](https://github.com/aliparlakci/bulk-downloader-for-reddit/blob/development/opts_example.yaml).
 - After bdfr runs **relative symlinks** are created for duplicates.
 - Sleeps for 30 minutes between runs. (hardcoded yuck)

## Setup

1. rename `options.yaml.example` -> `options.yaml`
2. modify and put in a directory (will be volume mounted)
3. choose a download directory (will be volume mounted)
4. `docker run --name bdfr -v your/download/location:/downloads -v your/config/directory/containing/optionsyaml:/config mcinj/docker-bdfr:latest`

