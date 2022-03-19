# mrtg-docker
Dockerized MRTG solution



Deployment guide:

    1. Clone the repo
    2. build the image: 
    docker build -t mrtg:01 .
    3. run the container as a daemon from the image where XXXXXXXXXXXX is a local path to the repo and YYYYYYYY is image id: 
    docker run -v /XXXXXXXXXXXXX/mrtg/scripts:/app -p 80:80 -dit YYYYYYYYYYYYYYY
    4. login to container terminal and run setup script: 
    docker exec -it XX bash
    bash ./setup.sh
    5. answer "Yes" on MRTG setup
    6. Go to the browser of local host and check http://localhost/mrtg. Graphs should appear under the page.
    7. within the container run bash cronjob.sh & to update graphs every minute
    8. Add new hosts by altering setup.sh script and rerunning it or by running the following from cli: 
    cfgmaker communityname@hostip >> /etc/mrtg
    indexmaker /etc/mrtg.cfg > /var/www/mrtg/index.html
    9. All added hosts have to have snmp configured with proper community string and RO access.

