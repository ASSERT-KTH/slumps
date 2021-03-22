FOLDER=$1



find "$FOLDER" -type d -depth 1 -exec bash -c 'echo $(basename {}) && bash check_stability.sh $(basename {}) {}/bitcodes/variants {}/wasm -c -intel  --save-different ' \;