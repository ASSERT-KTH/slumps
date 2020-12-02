PROGRAM_PATH=$1


python3 replace.py execute_in_node.js try_to_execute.js  $PROGRAM_PATH

npm run ex > $PROGRAM_PATH.bytecode.txt