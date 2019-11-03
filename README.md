# mrtg-docker
Dockerized MRTG solution



Deployment guide:

    Clone the repo
    build the image: docker build -t mrtg:01 .
    run the container as a daemon from the image where somepath is a local path to the repo and XX is image id: docker run -v /somepath/mrtg/scripts:/app -p 80:80 -dit XX
    login to container terminal and run setup script: docker exec -it XX bash ./setup.sh
    answer "Yes" on MRTG setup
    Go to the browser of local host and check http://localhost/mrtg. Graphs should appear under the page.
    Add new hosts by altering setup.sh script, adding new ip addresses and rerun "mrtg /etc/mrtg.cfg" to make it read the new config.

