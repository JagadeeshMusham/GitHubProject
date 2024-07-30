# Use the official OpenJDK 21 image
FROM openjdk:21

# Install Git and Maven
RUN apt-get update && \
    apt-get install -y git maven

# Set the working directory
WORKDIR /app

# Clone the GitHub repository
RUN git clone https://github.com/JagadeeshMusham/GitHubProject.git .

# Package the application using Maven
RUN mvn clean package

# Run the application
CMD ["java", "-cp", "target/classes", "org.example.HelloWorld"]
