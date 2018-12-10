docker rm $(docker container ls -a | grep "hadoop*" | awk '{print $1}') \
&& docker image rm $(docker image ls | grep "codingfanlt/hadoop*" | awk '{print $1}')