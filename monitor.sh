#!/bin/bash

# Load configuration from monitor.conf
source ./monitor.conf

# Function to monitor services
monitor_services() {
    for service in $SERVICES; do
        if ! systemctl is-active --quiet $service; then
            echo "$NOTIFICATION_MESSAGE" | mail -s "Service Alert: $service is down" $NOTIFY_EMAIL
        fi
    done
}

# Function to monitor URLs
monitor_urls() {
    for url in $URLS; do
        if ! curl --output /dev/null --silent --head --fail "$url"; then
            echo "$NOTIFICATION_MESSAGE" | mail -s "URL Alert: $url is down" $NOTIFY_EMAIL
        fi
    done
}

# Main function to initiate monitoring
main() {
    monitor_services
    monitor_urls
}

# Execute the main function
main
