echo "$@"
find
diff - $2 <<EOF
foo.txt
hello.txt
EOF
