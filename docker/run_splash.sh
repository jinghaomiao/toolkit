<<<<<<< HEAD
#!/bin/sh

sudo docker run -d -p 5023:5023 -p 8050:8050 -p 8051:8051 scrapinghub/splash
=======
#!/bin/bash

sudo docker run -d --name=splash -p 5023:5023 -p 8050:8050 -p 8051:8051 scrapinghub/splash
>>>>>>> ADD: Splash container.
