#!/bin/sh

docker pull phpmyadmin/phpmyadmin && \
docker run --name phpmyadmin -d --link mysql0:db -p 8080:80 phpmyadmin/phpmyadmin && \
echo "Point your browser to http://localhost:8080"
