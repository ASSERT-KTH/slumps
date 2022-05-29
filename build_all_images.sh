cd souper

docker build -t slumps/souper:latest -f Dockerfile .

docker push slumps/souper:latest

curl --data parse_mode=Markdown --data chat_id="665043934" --data "text=Sper docker build and up " "https://api.telegram.org/bot$BOT_API_TOKEN/sendMessage"

cd ..


cd docker_images


docker build -t slumps/backend:latest -f Dockerfile .

docker push slumps/backend:latest

curl --data parse_mode=Markdown --data chat_id="665043934" --data "text=Backend build and up" "https://api.telegram.org/bot$BOT_API_TOKEN/sendMessage"

cd ..

cd crow


docker build -t slumps/crow2:standalone -f Dockerfile .
docker push slumps/crow2:standalone


docker build -t slumps/crow2:latest -f Dockerfile .
docker push slumps/crow2:latest



curl --data parse_mode=Markdown --data chat_id="665043934" --data "text=CROW built and up" "https://api.telegram.org/bot$BOT_API_TOKEN/sendMessage"