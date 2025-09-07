#!/bin/bash

# deployment_validation.sh - Validates web application deployment
URL="http://localhost/my-web-app/"
BACKUP_FILE="/tmp/index.jsp.backup"
INDEX_FILE="question-4/src/main/webapp/index.jsp"

echo "Starting deployment validation..."

# Backup current index.jsp before deployment
cp "$INDEX_FILE" "$BACKUP_FILE"
echo "Backed up index.jsp"

# Wait for application to deploy
sleep 10

# Test if application is accessible and contains expected content
if curl -s "$URL" | grep -q "Welcome to.*Web App"; then
    echo "Validation SUCCESS: Application is running correctly"
    exit 0
else
    echo "Validation FAILED: Application not responding correctly"
    echo "Restoring backup..."
    cp "$BACKUP_FILE" "$INDEX_FILE"
    echo "Backup restored"
    exit 1
fi
