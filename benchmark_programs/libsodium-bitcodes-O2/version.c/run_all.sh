echo '>>>>>>>>>>>'
find . -name "*.c-*" -a -type f -exec bash -c "bash get_stats.sh '{}'" \;
echo '>>>>>>>>>>>'