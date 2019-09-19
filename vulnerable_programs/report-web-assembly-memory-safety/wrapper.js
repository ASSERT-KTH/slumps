

// WORKING ON

const WA = WebAssembly,
      env = {   
                memory: new WA.Memory({initial: 256}),
                "__memory_base": 1024,
                "__table_base": 0,
                table: new WA.Table({initial: 46, element: 'anyfunc'})
            },
      code = new Uint8Array(require('fs').readFileSync('./integer_overflow.wasm'))

// Proxy for functions

function STD(mem){
    this.mem = mem;
    const self = this;

    this._puts = function(address){
        console.log(getString(address))
    }

    this._memcpy = function(dst, src, count){
        const i8 = new Uint8Array(self.mem.buffer)
        const toCopy =  i8.slice(src, src + count)
        i8.set(toCopy, dst)

        //console.log(i8)
    }

    this._strlen = function(address){
        const i8 = new Uint8Array(self.mem.buffer)

        let count = 0;

        for(let i = address; i < i8.length; i++, count++){
            if (i8[i] == 0)
                break;
        }

        return count;
    }

    function toUTF8Array(str) {
        var utf8 = [];
        for (var i=0; i < str.length; i++) {
            var charcode = str.charCodeAt(i);
            if (charcode < 0x80) utf8.push(charcode);
            else if (charcode < 0x800) {
                utf8.push(0xc0 | (charcode >> 6), 
                          0x80 | (charcode & 0x3f));
            }
            else if (charcode < 0xd800 || charcode >= 0xe000) {
                utf8.push(0xe0 | (charcode >> 12), 
                          0x80 | ((charcode>>6) & 0x3f), 
                          0x80 | (charcode & 0x3f));
            }
            // surrogate pair
            else {
                i++;
                // UTF-16 encodes 0x10000-0x10FFFF by
                // subtracting 0x10000 and splitting the
                // 20 bits of 0x0-0xFFFFF into two halves
                charcode = 0x10000 + (((charcode & 0x3ff)<<10)
                          | (str.charCodeAt(i) & 0x3ff));
                utf8.push(0xf0 | (charcode >>18), 
                          0x80 | ((charcode>>12) & 0x3f), 
                          0x80 | ((charcode>>6) & 0x3f), 
                          0x80 | (charcode & 0x3f));
            }
        }
        return utf8;
    }

    function getString(address){
        const i8 = new Uint8Array(self.mem.buffer)

        let result = [];

        for(let i = address; i < i8.length; i++){
            if (i8[i] == 0)
                break;
            result.push(i8[i])
        }

        return String.fromCharCode.apply(String, result)
    }

    this._printf = function(...args){
        const format = getString(args[0])
        console.log(format,args[1], getString(args[1]))
    }

    this._snprintf = function(...args){
        const bufferAddress = args[0]
        const size = args[1]
        const format = args[2]
        
        console.log(args, getString(format), getString(args[3]))
        self._memcpy(args[0], args[3], args[1])

        printAllAsStr()
    }

    function printAllAsStr(){
        const i8 = new Uint8Array(self.mem.buffer)

        let result = [];

        for(let i = 0; i < i8.length; i++){
            if (i8[i] != 0)
            {

                result.push(i8[i])
                
            }else{

                if(result.length > 0){
                    console.log(String.fromCharCode.apply(String, result))
                    
                    result = []
                }
            }
        }

    }
}

var ObjectCallable_handler = {
    get: function get(target, key){
        // key: function name
       //console.log(target.__inherit__,key, target.__inherit__[key])
       if(key in target.std){
           return target.std[key]
       }
       else if(!(key in target.__inherit__)){

            return function(...args){
                console.log(key, args)
            }
        }
    
        
        return target.__inherit__[key]
    }

}


function ObjectCallable(cls, STD) {
    var p = new Proxy(function() { }, ObjectCallable_handler);
    p.__inherit__ = cls;
    p.std = STD;
    return p;
}

// =======================

WA.compile(code).then(m => {
    
    return new WA.Instance(m, {env: new ObjectCallable(env, new STD(env.memory))})
}).then(module => {

    var result = module.exports._buffer_overread(256, 270)
})
