echo "Cleaning and building the spring boot application"
call mvn clean package
echo "Copying the build executable to AWS server"
pscp -i C:\Software Development Projects\springdemo\keys\springdemog.ppk .\target\springdemo-0.0.1-SNAPSHOT.jar ec2-user@ec2-18-224-184-198.us-east-2.compute.amazonaws.com:/home/ec2-user
echo "Starting spring boot application on AWS server"
putty.exe -i C:\Software Development Projects\springdemo\keys\springdemog.ppk -m .\deploy.sh ec2-user@ec2-18-224-184-198.us-east-2.compute.amazonaws.com