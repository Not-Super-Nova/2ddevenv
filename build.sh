docker build --no-cache=true --build-arg BUILD_DATE=$(date -uIseconds) --build-arg TIMEZONE=$(cat /etc/timezone) -t 2ddevenv:latest .
