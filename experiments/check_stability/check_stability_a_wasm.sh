FOLDER=$1



find "$FOLDER" -type d -depth 1 -exec bash -c 'echo $(basename {}) && bash check_stability_wasm.sh $(basename {}) {}/wasm -c -intel  --save-different' \;