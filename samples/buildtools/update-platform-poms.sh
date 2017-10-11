#!/bin/sh

# copy the java8 version of the poms to the other platform hierarchies,
# adjusting the groupIds accordingly
#
# usage: buildtools/update-platform-poms.sh

J8_PROJECTS="apps connectors console scenarios topology utils"
PLATFORMS=java7

for p in ${PLATFORMS}; do
  for proj in ${J8_PROJECTS}; do
    echo Updating platforms/${p}/${proj}/pom.xml...
    if [ ! -d platforms/${p}/${proj} ]; then
        mkdir -p platforms/${p}/${proj}
    fi
    sed -e "s/org.apache.edgent.samples/org.apache.edgent.${p}.samples/g" \
        -e "s/UPDATE_PLATFORM_POMS_MSG_PLACEHOLDER/DO NOT EDIT - GENERATED BY update_platform_poms.sh/" \
          < ${proj}/pom.xml > platforms/${p}/${proj}/pom.xml
  done
done 