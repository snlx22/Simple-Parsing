s!/bin/bash

print_title(){
        echo -e "\n\e[1m$1\e[0m"
}

print_result() {
    printf "\e[94m%-40s %s\e[0m\n" "$1" "$2"
}

domain="$1"

print_title "Scanning the website: $domain:"
echo "----------------------------------------------------------"

if [ "$1" == "" ]; then
        echo "usage: example.com"
else
        wget "$domain"
        clear

	print_title "IP and subdomains of: $domain"
	print_title "--------------------------------------------------------"
        grep "href" index.html | cut -d "/" -f 3 | grep "\." | cut -d "|" -f 1 | cut -d ">" -f 1 | cut -d "\"" -f 1 | grep -v "<l" > list
        cat list | while IFS= read -r ip; do
                host_output=$(host "$ip" | grep -oP 'has address \K[^ ]+')
                if [ -n "$host_output" ]; then
                  print_result "$ip" "$host_output"
                else
                    print_result "SubDomain" "IP"
                    echo " "
                fi
        done
echo "----------------------------------------------------------"
rm list
rm index.html
fi
