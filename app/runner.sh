#!/bin/bash

echo 'Running BDFR'
python3 -m bdfr download /downloads -v --log /config/log.log --opts /config/options.yaml
echo 'BDFR run done'
echo 'Running rdfind to replace dupes with symlinks'
rdfind -makeresultsfile false -makesymlinks true /downloads
echo 'rdfind done'
echo 'shortening symlinks'
symlinks -corv /downloads
echo 'symlinks done'
echo 'Sleeping for 30 minutes'
sleep 30m