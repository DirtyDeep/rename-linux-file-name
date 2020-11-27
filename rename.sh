#!/bin/bash
export path=$(pwd)
echo $path
function read_dir(){
	for file in $(ls $1)
            do
		if [ -d $1'/'$file ]; then
			export strdir=$1'/'$file
			rename 's/'$2'/'$3'/' $strdir
			for files in $(ls $1)
				do
					if [ -d $1'/'$files ];then
						read_dir $1'/'$files $2 $3
					fi
				done

		else
			export sa=$1"/"$file
			echo $sa
		     	rename 's/'$2'/'$3'/' $sa	    
		
		fi
	    done
}
read_dir $path $1 $2
