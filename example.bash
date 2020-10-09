#!/bin/bash -ef
#
usage_function() {
  echo
  echo 'example.bash -a $ARGUMENT'
  echo
  echo 'options'
  echo '  -h : help'
  echo '  -a : a required argument'
  echo '  -u : usage (this message)'
  echo
}

help_function() {
  usage_function
  echo 
  echo 'This function assumes that the FreeSurfer SUBJECTS_DIR is set.'
  echo 'It requires a subject to be passed to the function.'
  echo 'This needs the data to be sent to' 
}

help_val=0
use_val=1
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -a|--argument)
    ARGUMENT="${2}"
    use_val=0
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    use_val=0
    help_val=1
    break # If a user wants help they shouldn't be running other things
    ;;
esac
done

if [[ ${use_val} == 1 ]]; then
  usage_function
  exit
fi

if [[ ${help_val} == 1 ]]; then
  help_function
  exit
fi

echo "Hello $ARGUMENT"

