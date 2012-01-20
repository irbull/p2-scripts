#!/bin/sh

rm -rf plugins
rm -rf features
rm artifacts.jar
rm content.jar

files=`ls`
path=`pwd`

# Create a feature for all the 'extra' items
# This is used at development time
rm -rf extras/features
feature_id="com.example.extras"
feature_version="1.0.0.v"`date +%Y%m%d-%H%M`
feature=$feature_id"_"$feature_version
mkdir extras/features
mkdir extras/features/$feature
sh ./genFullFeature.sh -f $feature_id -d extras -v $feature_version > extras/features/$feature/feature.xml

for file in $files; do
        if [ -d $file ];then
          echo $file
          $1/eclipse -consolelog -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher -nosplash --launcherSuppressErrors -metadataRepository file://$path -artifactRepository file://$path -source ./$file -compress -append -publishArtifacts
        fi
done

