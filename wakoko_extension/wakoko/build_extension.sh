
#BUILD wakoko_instrumentor
cd ../../wakoko_instrumentor
make -e
cd ../wakoko_extension/wakoko

yarn build

cp src/content_template.js build/static/js/content.js
cp src/content.css build/static/css/content.css
cp ../../wakoko_instrumentor/build/decoder.js build/static/js/decoder.js


cp ../../wakoko_instrumentor/build/decoder.wasm build/static/js/decoder.wasm
sed -i -e "s/'decoder\.wasm'/getBinaryName\(\)/g" build/static/js/decoder.js
perl -pe 's/WRAPPER/`cat "build\/static\/js\/wrapper.js"`/ge' -i build/static/js/content.js
perl -pe 's/"INSTRUMENTOR"/`cat "build\/static\/js\/decoder.js"`/ge' -i build/static/js/content.js

