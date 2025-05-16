# Utility
Essential utility for personnel and commercial use

(1) dirdiff.sh 
"dirdiff.sh" is a bash script which compare the files in the current directory and target directory and list out only the files which are having difference. This program work on Linux Operating system.

e.g. If dir1 and dir2 have files a, b, c as given below
dir1/a dir1/b dir1/c
dir2/a dir2/c
# to find out difference
>cd dir1
>dirdiff.sh ./dir2
