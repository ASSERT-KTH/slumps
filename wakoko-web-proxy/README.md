## WAKOKO

WAKOKO provides live time coverage for WebAssembly in the browser. It uses a man-in-the-middle proxy approach. The proxy injects a JavaScript code to catch all WASM instantiation calls, the WASM binary is instrumented and returned back.

Since we use a proxy, you need to trust the certificates that we generate. After setting up the proxy, download, and trust in the certificate.

**This is a work in progress. Use this tool under your own responsability.** 

### How to use it?

**We recommend to use a browser that you dont regularly use.**

- Set the proxy option in your browser to `www.wakoko.live` port `8080`.

- Go to the address `wakoko.live/cert`, download and trust in the certificates.

- Go to the address `https://wakoko.live` and trust in this page.

- You are ready now to use WAKOKO.

### Troubleshooting

- WAKOKO injects some requests to the address `https://wakoko.live/...`, this means that the policy of the browser about CORS can cancel the requests. If WAKOKO detects this, it lanches a dialog asking you to access the address `https://wakoko.live`. Once the page is trusted it should work.

### How to setup locally ?

TODO

### DEMO

You can access to the following links to try WAKOKO.

#### [OpenCV](https://huningxin.github.io/opencv.js/samples/video-processing/index-wasm.html)
![docs/FunkyKarts.gif](docs/OpenCV.gif)

#### [Funky Karts](https://www.funkykarts.rocks/demo.html)
![docs/FunkyKarts.gif](docs/FunkyKarts.gif)

