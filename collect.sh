#!/bin/sh
FILES="./FILES"
if [[ ! -f "$FILES" ]]; then
  echo "create $FILES with listing of dots files in format SRC_PATH;DST_PATH"
  exit
fi

while IFS= read -r line
do
  if [[ -z "$line" ]]; then
    continue
  fi

  paths=(${line//;/ })
  src_file=${paths[0]}
  dst_file=${paths[1]}

  if [[ -d "$src_file" ]]; then
    rm -rf "./$dst_file"
    cp -R "$src_file/." "./$dst_file/"
  elif [[ -f "$src_file" ]]; then
    dst_dir=$(dirname $dst_file)
    mkdir -p "./$dst_dir"

    cp "$src_file" "./$dst_file"
  else
    echo "$src_file not found, skip"
  fi
done < ./FILES
