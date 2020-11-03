yarn build

cp src/content_template.js build/static/js/content.js
cp src/content.css build/static/css/content.css
perl -pe 's/WRAPPER/`cat "build\/static\/js\/wrapper.js"`/ge' -i build/static/js/content.js
