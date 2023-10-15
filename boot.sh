#!/bin/bash

branch="main"
bvkt="$HOME/.bvkt"

usage(){
>&2 cat << EOF
Usage: boot.sh [-a] [-b branch] [-i]
EOF
exit 1
}

# Arg validation
<<<<<<< HEAD
args=$(getopt -o ab:ih --long all,branch:,init,help -- "$@")
if [[ $? -gt 0 ]]; then
  usage
fi

# Arg parsing
eval set -- ${args}
while :
do
  case $1 in
    -a | --all)    all="-a"    ; shift   ;;
    -b | --branch) branch="$2" ; shift 2 ;;
    -i | --init)   init=true   ; shift   ;;
    -h | --help)   usage       ; shift   ;;
    # -- means the end of the arguments. Shift and break out of the while loop
    --) shift; break ;;
    *) >&2 echo Unsupported option: $1
       usage ;;
  esac
done

git clone -b $branch https://github.com/EyesofBucket/configs $bvkt
cd $bvkt

if [[ $init ]]; then
  ./setup.sh $all
  exit
fi

./update.sh $all
