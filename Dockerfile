# Dockerfile
FROM node:16-alpine

# Install docker terminal in the container
# But in docker run command refer the docker socket to host machine so avoid docker in docker scenario
RUN apk add --update docker openrc

ENV PORT="7000"

# Product
ENV PRODUCT_NAME="Capstone Monitoring Service"
ENV PRODUCT_LINK="https://cnn.com"

# Metrics Dashboard Button Link
ENV DASHBOARD_LINK="https://cnn.com"


# create destination directory
RUN mkdir -p /home/app
COPY . /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# expose 7000 on container
EXPOSE 7000

CMD [ "npm", "run", "start" ]