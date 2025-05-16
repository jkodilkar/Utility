#! /bin/bash
#
## Compares two directory trees, and list the files having differences.
## $ JPK , May 16, 2025 $
## 

dirnode=0
declare -a parent_dir=()
declare -a target_dir=()

subdir_diff()
{

for var in `ls ${target_dir[${dirnode}]}`
do 
   filename=`basename $var` 

   if [ -f ${parent_dir[$dirnode]}/$filename ] 
   then 
      if [ `diff ${parent_dir[$dirnode]}/$filename ${target_dir[${dirnode}]}/$var |wc -l` -gt 0 ] 
      then 
          echo ${parent_dir[$dirnode]}/$filename 
      fi
   elif [ -d ${parent_dir[$dirnode]}/$filename ]
   then 
        dirnode=`expr $dirnode + 1`
        parent_dir[$dirnode]=${parent_dir[`expr $dirnode - 1`]}/${filename}
        target_dir[$dirnode]=${target_dir[`expr $dirnode - 1`]}/${filename}
        subdir_diff ${target_dir[${dirnode}]}

        dirnode=`expr $dirnode - 1`
   fi

done

}

if [ $# -ne 1 ]
then 
   echo "Usage : $0 <Target-directory> to compare"
   exit 1
fi

parent_dir[${dirnode}]=$PWD
target_dir[${dirnode}]=$1
subdir_diff ${target_dir[${dirnode}]}
