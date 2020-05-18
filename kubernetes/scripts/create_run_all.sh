
find $1 -name \*.wasm -exec printf "echo '{}' \nmill cli.run  '{}' \n" \;;
