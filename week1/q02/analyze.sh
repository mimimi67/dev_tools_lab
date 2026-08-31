#!/bin/bash

if [ $# -ne 1 ];then
    echo "需要传入文件路径" >&2
    exit 1
fi
FILE="$1"
if [ ! -f "$FILE" ];then
    echo "错误：文件 $FILE 不存在" >&2
    exit 1
fi

echo "====5xx最多前2个path===="
tail -n +2 "$FILE" | awk -F',' '$4 >=500 && $4 <600 {print $3}' | sort | uniq -c | sort -k1,1nr -k2,2 | head -n 2

echo "====平均latency_ms===="
tail -n +2 "$FILE" | awk -F',' '{sum+=$5; cnt++} END{printf "%.2f\n", sum/cnt}'

