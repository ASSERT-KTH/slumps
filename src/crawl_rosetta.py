# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup
import requests
import requests.exceptions
from urllib.parse import urlsplit
from urllib.parse import urlparse
from collections import deque
import os
import stages
import utils
import re

url = "http://www.rosettacode.org/wiki/Category:C"

response = requests.get(url)

soup = BeautifulSoup(response.text, 'lxml')

final_links = []

input_expected_functions = [
    r"( |\t|\r|\n)scanf( )*\(",
    r"( |\t|\r|\n)fgetc( )*\(",
    r"( |\t|\r|\n)fopen( )*\(",
    r"( |\t|\r|\n)fclose( )*\(",
    r"( |\t|\r|\n)fputc( )*\(",
]

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
    
    if os.path.exists("crawl/valid/no_input/%s.c"%sanitize(l[1])) or os.path.exists("crawl/valid/input_expected/%s.c"%sanitize(l[1])) or os.path.exists("crawl/invalid/%s.c"%sanitize(l[1])):
        print("Existing...")
        continue

    utils.printProgressBar(i, len(final_links),suffix=l[1])
    try:
        url = "http://www.rosettacode.org%s"%l[0]

        response = requests.get(url)

        soup = BeautifulSoup(response.text, 'lxml')

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

            try:
                clangCompiler = stages.CCheck(l[1])

                s = clangCompiler(std=text.encode("utf-8"))
                
                # Scan for user input

                if any(map(lambda x: re.compile(x).search(text), input_expected_functions)):
                    print("%s Invalid"%l[1])
                    f = open("crawl/valid/input_expected/%s.c"%sanitize(l[1]), 'w')
                    f.write(text)
                    f.close()
                else:
                    f = open("crawl/valid/no_input/%s.c"%sanitize(l[1]), 'w')
                    f.write(text)
                    f.close()
            except stages.CallException as e:
                f = open("crawl/invalid/%s.c"%sanitize(l[1]), 'w')
                f.write(text)
                f.write("/* %s */"%str(e.stderr,"utf-8"))
                f.close()

        

        l.append(text)

    except Exception as e:
        print(e)
        f = open("crawl/fail/%s.c"%sanitize(l[1]), 'w')
        f.write(url)
        f.close()
        continue

print(len(final_links))
    #anchor = link.attrs['href'] if 'href' in link.attrs else ''
