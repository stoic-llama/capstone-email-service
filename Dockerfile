# Dockerfile
FROM node:16-alpine

# Install docker terminal in the container
# But in docker run command refer the docker socket to host machine so avoid docker in docker scenario
RUN apk add --update docker openrc

# RUN apt update
# RUN apt install apt-transport-https ca-certificates gnupg2 software-properties-common -y
# RUN $ curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
# RUN $ add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
# RUN apt update
# RUN apt-cache policy docker-ce
# RUN apt install docker-ce -y
# RUN systemctl status docker

ENV PORT="7300"

# Product
ENV PRODUCT_NAME="Capstone Monitoring Service"
ENV PRODUCT_LINK="https://helpmybabies.com:7200"

# Metrics Dashboard Button Link
ENV DASHBOARD_LINK="https://helpmybabies.com:7200"


# create destination directory
RUN mkdir -p /home/app
COPY . /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# expose 7300 on container
EXPOSE 7300

CMD [ "npm", "run", "start" ]