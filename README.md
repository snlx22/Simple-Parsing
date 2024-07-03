# Subdomain and IP Scanner

This script scans a given website to find its subdomains and their respective IP addresses. It uses `wget` to download the HTML of the website and then parses the HTML to extract the subdomains. The script resolves the IP addresses of these subdomains and prints them in a formatted manner.

## Usage

```bash
./subdomain_ip_scanner.sh example.com
