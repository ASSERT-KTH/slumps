

Based on [https://www.forcepoint.com/sites/default/files/resources/files/report-web-assembly-memory-safety-en.pdf](https://www.forcepoint.com/sites/default/files/resources/files/report-web-assembly-memory-safety-en.pdf)

Prerequisites
-------------

Install emsdk, see <https://emscripten.org/docs/getting_started/downloads.html>

Run
---

To compile and execute an  exploit, run ```python3 exploit_generator.py <exploit_id>```. If no exploit_id is provided then the script will list all available exploit ids and its descriptions. The script generates an ```exploit.js``` file, to execute the exploit, just run ```node exploit.js```
