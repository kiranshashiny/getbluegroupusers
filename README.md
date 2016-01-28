# getbluegroupusers
Shell script that does a wget of all 3 groups, and replaces contents of a file with the results from these 3 group URLs

This script does  a wget from 3 groups and collects the users .
stores the results in an env var.
Opens a file called usercounts.txt and replaces the 3rd,4th and the 5th arguments in the usercounts.txt
with the values got in this script.

keywords : awk, data mangling, wget, github, mural, and slack user groups.
