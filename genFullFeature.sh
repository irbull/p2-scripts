#!/bin/sh 

while getopts 'hf:d:v:' OPTION
do
  case $OPTION in
   f) export feature_id=$OPTARG
    ;;
   d) export directory=$OPTARG
    ;;
   v) export version=$OPTARG
    ;;
   ?|h) printf "Usage: %s: [-f feature_id] [-d directory]"
    ;;
  esac
done

if [ -z $feature_id ]
then
  echo "Invalid arguments"
  exit 1
fi

if [ -z $directory ]
then
  echo "Invalid arguments"
  exit 1
fi


# Generate feature header
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo "<feature"
echo "  id =\"$feature_id\""
echo "  version=\"$version\""
echo "  label=\"$feature_id\""
echo "  provider-name=\"none\">"

# Generate Description
echo "  <description url=\"http://example.com\">"
echo "    Description"
echo "  </description>"

# Generate Copyright
echo "  <copyright>"
echo "    copyright"
echo "  </copyright>"

# Generate License
echo "  <license url=\"http://example.com\">"
echo "    license"
echo "  </license>"

files=`ls $directory/plugins/`
path=`pwd`

# generate features

for file in $files 
do
   plugin=`echo "$file" | cut -d _ -f1`
   plugin_version=`echo "$file" | sed "s/$plugin\_//g" | sed "s/.jar//g"`

   echo ""
   echo "    <plugin"
   echo "      id=\"$plugin\""
   echo "      download-size=\"0\""
   echo "      install-size=\"0\""
   echo "      version=\"$plugin_version\""
   echo "      unpack=\"false\"/>"
done

echo "</feature>"
