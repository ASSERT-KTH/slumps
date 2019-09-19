

Based on [https://www.forcepoint.com/sites/default/files/resources/files/report-web-assembly-memory-safety-en.pdf](https://www.forcepoint.com/sites/default/files/resources/files/report-web-assembly-memory-safety-en.pdf)

Prerequisites
-------------

Install emsdk, see <https://emscripten.org/docs/getting_started/downloads.html>

Run
---

To compile and execute an  exploit, run ```python3 exploit_generator.py <exploit_id>```. If no exploit_id is provided then the script will list all available exploit ids and its descriptions. The script generates a folder (```out```) with the exploit script (```exploit.js```). To execute the exploit, just run ```node exploit.js```


Notes
---

Optimisation removes potential vulnerabilities. In the specific case of ```integer_overflow.c``` code. Running the emsdk with optimisation level ```O2``` remove unused secret variable, removing the vulnerability.