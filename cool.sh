#!/bin/bash
function runme(){
    local file=$1
    local max_jobs=$2
    jobs_array=()
    pid_array=()
    sort "${file}" | while read -r var;do
	    jobs_array+=( "$var" )
    done
#echo "${arr[@]}"
#-------------------
for i in "${!jobs_array[@]}";do
        while (( $(jobs -p|wc -l) >= "${max_jobs}" ));do
                sleep 0.01
        done
        #echo "Running Job $i: ${jobs_array[${i}]}"
        eval "${jobs_array[${i}]}" &
        pid_array+=( "$!" )
done
wait ${pid_array[@]}
}
time runme $@



