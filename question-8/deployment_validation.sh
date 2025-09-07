#!/bin/bash

# Deployment validation script for Question 8
echo "Starting deployment validation..."

# Function to check if application is responding
check_application() {
    local url=$1
    local expected_text=$2
    
    echo "Checking application at: $url"
    response=$(curl -s "$url")
    
    if [[ $response == *"$expected_text"* ]]; then
        echo "✓ Application is responding correctly"
        return 0
    else
        echo "✗ Application not responding correctly"
        echo "Response: $response"
        return 1
    fi
}

# Test the application
if check_application "http://localhost:8082/my-web-app/" "Welcome to Tran Phan Hoang Phuc's Web App"; then
    echo "SUCCESS: Deployment validation passed"
    exit 0
else
    echo "FAILURE: Deployment validation failed"
    exit 1
fi
