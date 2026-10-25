#!/bin/bash
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

log_file="website_status.log"

> "$log_file"

for site in "${websites[@]}"; do
    status_code=$(curl -L -s -o /dev/null -w "%{http_code}" "$site")
    if [ "$status_code" -eq 200 ]; then
        echo "<$site> is UP" >> "$log_file"
    else
        echo "<$site> is DOWN" >> "$log_file"
    fi
done
echo "Результати перевірки записано у файл логів: $log_file"
