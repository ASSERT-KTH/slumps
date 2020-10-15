# node test/initEnv.js
rm -rf ./test/.temp_certs/*
npm run build
jasmine JASMINE_CONFIG_PATH=./jasmine.json