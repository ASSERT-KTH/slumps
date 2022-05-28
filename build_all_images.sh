cd souper

docker build -t slumps/souper:latest -f Dockerfile . 

cd ..


cd docker_images

docker build -t slumps/backend:latest -f Dockerfile .

cd ..

cd crow

docker build -t slumps/crow2:standalone  -f Dockerfile .
docker build -t slumps/crow2:latest -f Dockerfile .
