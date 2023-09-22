#!/bin/bash

# Define your Tomcat installation directory
TOMCAT_HOME=/path/to/your/tomcat

# Define the location of your new WAR file
NEW_WAR=/path/to/your/new.war

# Stop Tomcat
echo "Stopping Tomcat..."
$TOMCAT_HOME/bin/shutdown.sh

# Wait for Tomcat to stop gracefully
sleep 10

# Remove the old deployed application (optional, if needed)
# rm -rf $TOMCAT_HOME/webapps/your-app

# Deploy the new WAR file
echo "Deploying the new WAR file..."
cp $NEW_WAR $TOMCAT_HOME/webapps/your-app.war

# Start Tomcat
echo "Starting Tomcat..."
$TOMCAT_HOME/bin/startup.sh

# Wait for Tomcat to start (you may need to customize the wait time)
sleep 20

# Check if Tomcat has started successfully (you can modify this check)
if [ $(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/your-app) -eq 200 ]; then
  echo "Tomcat started successfully."
  exit 0
else
  echo "Tomcat did not start successfully."
  exit 1
fi
