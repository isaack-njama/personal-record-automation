#!/bin/bash

# Function to generate a random password
generate_password() {
  # Define the regex-like pattern for the password
  pattern="[A-Za-z0-9!@#\$%^&*()\-_=+\[\]{}|;:'\",.<>?/`~]{12}"
  
  # Use /dev/urandom for better randomness
  password=$(tr -cd "$pattern" < /dev/urandom | head -c12)
  
  echo "$password"
}

# Generate a random password
password=$(generate_password)

# Display the generated password
echo "Generated Password: $password"
