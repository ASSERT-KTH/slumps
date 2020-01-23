from bs4 import BeautifulSoup
import requests
import requests.exceptions
from urllib.parse import urlsplit
from urllib.parse import urlparse
from collections import deque
import os

url = "http://www.rosettacode.org/wiki/Category:C"

response = requests.get(url)

soup = BeautifulSoup(response.text, 'lxml')

final_links = []

def sanitize(name:str):
    return name.replace("/", "-").replace(" ", "_").replace("\\", "-").replace(".", "_")


for container in soup.find_all('div', class_='mw-category-group'):    # extract link url from the anchor
    programs = container.find_all("a")
    for p in programs:
        link = p.attrs.get("href", None)

        if link:
            name = p.text
            final_links.append([link, name])

for i,l in enumerate(final_links):
    
    if os.path.exists("crawl/%s.c"%sanitize(l[1])):
        print("Existing...")
        continue
    print("%s/%s"%(i, len(final_links)))
    try:
        url = "http://www.rosettacode.org%s"%l[0]

        response = requests.get(url)

        soup = BeautifulSoup(response.text, 'lxml')


        # ?action=edit&section=3

        # get the number of the section

        section = soup.find_all("span", class_="mw-editsection")

        for s in section:
            a = s.find("a")

            if a.attrs.get("title", None) == "Edit section: C":
                
                section = a.attrs.get("href", None)
                break

        if not section:
            print("Error")
            continue

        url = "http://www.rosettacode.org%s"%section
        response = requests.get(url)
        soup = BeautifulSoup(response.text, 'lxml')


        for container in soup.find_all("textarea", id="wpTextbox1")[:1]: # the first one always
            text:str = container.text

            i = text.find("<lang c>")

            if i < 0:
                i = text.find("<lang C>")

            text = text[i + 8:]
            i = text.find("</lang>")
            text = text[:i]

            #text = text.splitlines()

            #print(text)

            #break
            f = open("crawl/%s.c"%sanitize(l[1]), 'w')
            f.write(text)
            f.close()

        #break

        l.append(text)
    except:
        print("Fail ", l[0])
        pass

print(len(final_links))
    #anchor = link.attrs['href'] if 'href' in link.attrs else ''
