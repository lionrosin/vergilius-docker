# Use Ubuntu as the base image
FROM ubuntu:latest

# Update package list and install necessary packages
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
        python3 \
        openjdk-21-jdk \
        mysql-server \
        mysql-client \
        git \
        bash \
        vim \
        curl\
        dumb-init

# Set the working directory inside the container
WORKDIR /app

# Clone your Git repository
RUN git clone https://github.com/VergiliusProject/vergilius-project.git

# Copy your script into the container
COPY script.sh /app/vergilius-project/script.sh
COPY generate_good.sh /app/vergilius-project/generate_good.sh

# Set execute permission on the script
RUN chmod +x /app/vergilius-project/script.sh /app/vergilius-project/generate_good.sh

# Change working directory to your application directory
WORKDIR /app/vergilius-project

# Run your script
RUN ./script.sh

RUN rm /app/vergilius-project/script.sh

RUN /bin/bash -c "service mysql start && mysql -e \"CREATE DATABASE dbvergilius; CREATE USER 'vergilius' IDENTIFIED BY '3034'; GRANT ALL PRIVILEGES ON dbvergilius.* TO 'vergilius'; FLUSH PRIVILEGES;\""

RUN /bin/bash -c "service mysql start && ./generate_good.sh"

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/bin/bash", "-c", "service mysql start && ./gradlew bootRun"]
