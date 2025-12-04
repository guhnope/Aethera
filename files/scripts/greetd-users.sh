#!/bin/bash

# Add users with UID >= 1000 to greetd group
echo "Adding users with UID >= 1000 to greetd..."
for u in $(awk -F: '$3 >= 1000 {print $1}' /etc/passwd); do
    usermod -aG greetd "$u"
done

# Add users with home directories under /var/home to greetd group
echo "Adding users with home directories in /var/home to greetd..."
for u in $(awk -F: '$6 ~ /^\/var\/home/ {print $1}' /etc/passwd); do
    usermod -aG greetd "$u"
done

echo "All relevant users added to greetd."
