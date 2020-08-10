#!/bin/bash
mapfile -t check_array < <(printf '%s\n' `top | head -n 1 | awk '{print $12, $13, $14, $15}' | sed 's/\,//g'`)
echo ${check_array[@]}
array2=(1 1 1)
if [[ "${check_array2[0]}" > "${array2[0]}" ]]; then
	echo "1.1>2.1"
elif [[ "${check_array2[0]}" < "${array2[0]}" ]]; then
	echo "1.1<2.1"
fi

if [[ "${check_array2[1]}" > "${array2[1]}" ]]; then
        echo "1.2>2.2"
elif [[ "${check_array2[1]}" < "${array2[1]}" ]]; then
	echo "1.2<2.2"
fi

if [[ "${check_array2[2]}" > "${array2[2]}" ]]; then
        echo "1.3>2.3"
elif [[ "${check_array2[2]}" < "${array2[2]}" ]]; then
	echo "1.3<2.3"
fi


		
