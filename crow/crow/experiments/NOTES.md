wasmtime --target options:
https://github.com/bytecodealliance/wasmtime/blob/81b4e48f9fb44d4cd4014eb911db5499769c734e/cranelift/codegen/src/isa/mod.rs#L144

- x86_64

Lucet reversed local access reordering.

```

<     i32.const 0
<     local.set 2
21a20,21
>     local.set 2
>     i32.const 0
34c34
<       local.get 2
---
>       local.get 3
37c37
<       local.set 2
---
>       local.set 3
60c60
<                 local.get 2
---
>                 local.get 3
77c77
<                 local.get 3
---
>                 local.get 2
167c167
<       local.get 3
---
>       local.get 2
170c170
<       local.set 3
---
>       local.set 2

```

Lucet reverses the following pattern.

```
<             i32.const -65
<             i32.add
---
>             i32.const 65
>             i32.sub

```

```
<       i32.const 1
<       i32.sub
---
>       i32.const -1
>       i32.add
```

Lucet does not reversed all CROW code transformations

List of optimizations
https://github.com/bytecodealliance/wasmtime/blob/f579d088ba/cranelift/codegen/src/timing.rs

Preoptimizations
https://github.com/bytecodealliance/wasmtime/blob/f579d088ba/cranelift/codegen/src/simple_preopt.rs
https://github.com/bytecodealliance/wasmtime/blob/f579d088ba/cranelift/codegen/src/preopt.peepmatic

```angular2html

;; Remove operations that are no-ops.
(=> (iadd_imm 0 $x) $x)
(=> (imul_imm 1 $x) $x)
(=> (sdiv_imm 1 $x) $x)
(=> (udiv_imm 1 $x) $x)
(=> (bor_imm 0 $x) $x)
(=> (band_imm -1 $x) $x)
(=> (bxor_imm 0 $x) $x)
(=> (rotl_imm 0 $x) $x)
(=> (rotr_imm 0 $x) $x)
(=> (ishl_imm 0 $x) $x)
(=> (ushr_imm 0 $x) $x)
(=> (sshr_imm 0 $x) $x)
```

Postoptimizations
https://github.com/bytecodealliance/wasmtime/blob/f579d088ba/cranelift/codegen/src/postopt.rs


ROPGadget cannot find any gadget in Wasm to native objects :(
- The reason for non ROP gadgets is that Lucet maintains the premise of non ROP in Wasm
  - Look for JOP
- Count and compare sandbox breakout gadgets ! Spectre gadgets
    - Branch predictors do a really good job! (Generally ~95-100% correct)
    - When reaching a conditional jump, pick one branch speculatively
    - If your speculation was correct: Great! You already executed it!
    - If your speculation was incorrect: Discard the speculative work. 

- Assuming that the attacker can control the input value, she can send several
in-bounds inputs that would train the branch predictor to anticipate that the check at line 2 will pass. Then, the attacker
sends an out-of-bounds input, the branch predictor makes
a wrong prediction, and the program speculatively executes
lines 3–4 even though the program’s semantics forbid so. It
causes a speculative buffer overread at line 3 and the read
value is used as an index at line 4

```
mov rdx,QWORD PTR [fn_table_len] ; get fn table length 
cmp rcx,rdx ; check that rcx is in-bounds 
jb index_ok 
ud2 ; trap otherwise 
index_ok: ; this is the pattern of a breakout gadget
lea rdx,[fn_table] 
mov rcx,QWORD PTR [rdx+rcx*4] 
call rcx

```

The code in Lucet for the generation is here https://github.com/bytecodealliance/wasmtime/blob/5c1d728e3ae8ee7aa329e294999a2c3086b21676/cranelift/codegen/meta/src/isa/x86/recipes.rs#L2464

- Trap code ud2 https://github.com/bytecodealliance/wasmtime/blob/09b976e1d53a05150c7b8acd36a82b34cec787b3/cranelift/codegen/meta/src/isa/x86/encodings.rs#L2653

- Still reversed transformations in WASM backend


```
%3:i32 = add 1:i32, 4294967295:i32
; In this case a + b == 0 due to overflow, then %3 is zero
; To prevent above case, set --souper-crow-prune-2const-operation=true

%4:i32 = add %0, %3
%5:i32 = add %0, %4
%6:i32 = add %0, %5
result %6",

"%3:i32 = add %0, %0
%4:i32 = add %0, %3
result %4",
```

Souper is in Lucet ?

https://github.com/bytecodealliance/wasmtime/blob/76d3fb61c3/cranelift/peepmatic/crates/souper/src/lib.rs

So if Souper does our transformations these transformations can be reversed by Souper again, so if Souper is enabled in the compiler, the transformations can be reversed. 
Probably we need to evaluate this also.

How to bypass Souper reversion ? If we do several passes on the bitcode it will eventually becomes better?

bitcode -> CROW -> bc1, bc2 ... bc -> CROW -> bc11, bc12...bcnn -> CROW -> ...

The same with overflow due to multiplication
```
"%3:i32 = mul 4294967076:i32, %0\n%4:i32 = add %0, %3\n%5:i32 = add %0, %4\n%6:i32 = add %0, %5\n%7:i32 = add %0, %6\n%8:i32 = add %0, %7\n%9:i32 = add %0, %8\n%10:i32 = add %0, %9\n%11:i32 = add %0, %10\n%12:i32 = add %0, %11\n%13:i32 = add %0, %12\n%14:i32 = add %0, %13\n%15:i32 = add %0, %14\n%16:i32 = add %0, %15\n%17:i32 = add %0, %16\n%18:i32 = add %0, %17\n%19:i32 = add %0, %18\n%20:i32 = add %0, %19\n%21:i32 = add %0, %20\n%22:i32 = add %0, %21\n%23:i32 = add %0, %22\n%24:i32 = add %0, %23\n%25:i32 = add %0, %24\n%26:i32 = add %0, %25\n%27:i32 = add %0, %26\n%28:i32 = add %0, %27\n%29:i32 = add %0, %28\n%30:i32 = add %0, %29\n%31:i32 = add %0, %30\n%32:i32 = add %0, %31\n%33:i32 = add %0, %32\n%34:i32 = add %0, %33\n%35:i32 = add %0, %34\n%36:i32 = add %0, %35\n%37:i32 = add %0, %36\n%38:i32 = add %0, %37\n%39:i32 = add %0, %38\n%40:i32 = add %0, %39\n%41:i32 = add %0, %40\n%42:i32 = add %0, %41\n%43:i32 = add %0, %42\n%44:i32 = add %0, %43\n%45:i32 = add %0, %44\n%46:i32 = add %0, %45\n%47:i32 = add %0, %46\n%48:i32 = add %0, %47\n%49:i32 = add %0, %48\n%50:i32 = add %0, %49\n%51:i32 = add %0, %50\n%52:i32 = add %0, %51\n%53:i32 = add %0, %52\n%54:i32 = add %0, %53\n%55:i32 = add %0, %54\n%56:i32 = add %0, %55\n%57:i32 = add %0, %56\n%58:i32 = add %0, %57\n%59:i32 = add %0, %58\n%60:i32 = add %0, %59\n%61:i32 = add %0, %60\n%62:i32 = add %0, %61\n%63:i32 = add %0, %62\n%64:i32 = add %0, %63\n%65:i32 = add %0, %64\n%66:i32 = add %0, %65\n%67:i32 = add %0, %66\n%68:i32 = add %0, %67\n%69:i32 = add %0, %68\n%70:i32 = add %0, %69\n%71:i32 = add %0, %70\n%72:i32 = add %0, %71\n%73:i32 = add %0, %72\n%74:i32 = add %0, %73\n%75:i32 = add %0, %74\n%76:i32 = add %0, %75\n%77:i32 = add %0, %76\n%78:i32 = add %0, %77\n%79:i32 = add %0, %78\n%80:i32 = add %0, %79\n%81:i32 = add %0, %80\n%82:i32 = add %0, %81\n%83:i32 = add %0, %82\n%84:i32 = add %0, %83\n%85:i32 = add %0, %84\n%86:i32 = add %0, %85\n%87:i32 = add %0, %86\n%88:i32 = add %0, %87\n%89:i32 = add %0, %88\n%90:i32 = add %0, %89\n%91:i32 = add %0, %90\n%92:i32 = add %0, %91\n%93:i32 = add %0, %92\n%94:i32 = add %0, %93\n%95:i32 = add %0, %94\n%96:i32 = add %0, %95\n%97:i32 = add %0, %96\n%98:i32 = add %0, %97\n%99:i32 = add %0, %98\n%100:i32 = add %0, %99\n%101:i32 = add %0, %100\n%102:i32 = add %0, %101\n%103:i32 = add %0, %102\n%104:i32 = add %0, %103\n%105:i32 = add %0, %104\n%106:i32 = add %0, %105\n%107:i32 = add %0, %106\n%108:i32 = add %0, %107\n%109:i32 = add %0, %108\n%110:i32 = add %0, %109\n%111:i32 = add %0, %110\n%112:i32 = add %0, %111\n%113:i32 = add %0, %112\n%114:i32 = add %0, %113\n%115:i32 = add %0, %114\n%116:i32 = add %0, %115\n%117:i32 = add %0, %116\n%118:i32 = add %0, %117\n%119:i32 = add %0, %118\n%120:i32 = add %0, %119\n%121:i32 = add %0, %120\n%122:i32 = add %0, %121\n%123:i32 = add %0, %122\n%124:i32 = add %0, %123\n%125:i32 = add %0, %124\n%126:i32 = add %0, %125\n%127:i32 = add %0, %126\n%128:i32 = add %0, %127\n%129:i32 = add %0, %128\n%130:i32 = add %0, %129\n%131:i32 = add %0, %130\n%132:i32 = add %0, %131\n%133:i32 = add %0, %132\n%134:i32 = add %0, %133\n%135:i32 = add %0, %134\n%136:i32 = add %0, %135\n%137:i32 = add %0, %136\n%138:i32 = add %0, %137\n%139:i32 = add %0, %138\n%140:i32 = add %0, %139\n%141:i32 = add %0, %140\n%142:i32 = add %0, %141\n%143:i32 = add %0, %142\n%144:i32 = add %0, %143\n%145:i32 = add %0, %144\n%146:i32 = add %0, %145\n%147:i32 = add %0, %146\n%148:i32 = add %0, %147\n%149:i32 = add %0, %148\n%150:i32 = add %0, %149\n%151:i32 = add %0, %150\n%152:i32 = add %0, %151\n%153:i32 = add %0, %152\n%154:i32 = add %0, %153\n%155:i32 = add %0, %154\n%156:i32 = add %0, %155\n%157:i32 = add %0, %156\n%158:i32 = add %0, %157\n%159:i32 = add %0, %158\n%160:i32 = add %0, %159\n%161:i32 = add %0, %160\n%162:i32 = add %0, %161\n%163:i32 = add %0, %162\n%164:i32 = add %0, %163\n%165:i32 = add %0, %164\n%166:i32 = add %0, %165\n%167:i32 = add %0, %166\n%168:i32 = add %0, %167\n%169:i32 = add %0, %168\n%170:i32 = add %0, %169\n%171:i32 = add %0, %170\n%172:i32 = add %0, %171\n%173:i32 = add %0, %172\n%174:i32 = add %0, %173\n%175:i32 = add %0, %174\n%176:i32 = add %0, %175\n%177:i32 = add %0, %176\n%178:i32 = add %0, %177\n%179:i32 = add %0, %178\n%180:i32 = add %0, %179\n%181:i32 = add %0, %180\n%182:i32 = add %0, %181\n%183:i32 = add %0, %182\n%184:i32 = add %0, %183\n%185:i32 = add %0, %184\n%186:i32 = add %0, %185\n%187:i32 = add %0, %186\n%188:i32 = add %0, %187\n%189:i32 = add %0, %188\n%190:i32 = add %0, %189\n%191:i32 = add %0, %190\n%192:i32 = add %0, %191\n%193:i32 = add %0, %192\n%194:i32 = add %0, %193\n%195:i32 = add %0, %194\n%196:i32 = add %0, %195\n%197:i32 = add %0, %196\n%198:i32 = add %0, %197\n%199:i32 = add %0, %198\n%200:i32 = add %0, %199\n%201:i32 = add %0, %200\n%202:i32 = add %0, %201\n%203:i32 = add %0, %202\n%204:i32 = add %0, %203\n%205:i32 = add %0, %204\n%206:i32 = add %0, %205\n%207:i32 = add %0, %206\n%208:i32 = add %0, %207\n%209:i32 = add %0, %208\n%210:i32 = add %0, %209\n%211:i32 = add %0, %210\n%212:i32 = add %0, %211\n%213:i32 = add %0, %212\n%214:i32 = add %0, %213\n%215:i32 = add %0, %214\n%216:i32 = add %0, %215\n%217:i32 = add %0, %216\n%218:i32 = add %0, %217\n%219:i32 = add %0, %218\n%220:i32 = add %0, %219\n%221:i32 = add %0, %220\n%222:i32 = add %0, %221\n%223:i32 = add %0, %222\n%224:i32 = add %0, %223\n%225:i32 = add %0, %224\n%226:i32 = add %0, %225\nresult %226\n",


```

- It seems that the order of the replacements matter

- Overlapping is not more an issue:
    the replacements are done in FIFO, so combinations with the same prefix would give the same variant.
    The problem is that Souper does not use a global assignment for the replacements so, the code blocks cannot be separated :)
  
- Now the question is: 
    Does the order matters ? aparently yes, maybe the backward algorithm was done with that purpose