**benchmark4pipeline_c/Banker's_algorithm.bc**
```


; Function: main
;[ORIGIN]   %9 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp290 = icmp sgt i32 %9, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %count.0292 = phi i32 [ %inc, %.lr.ph294 ], [ 0, %.lr.ph294.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %inc = add nuw nsw i32 %count.0292, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp = icmp slt i32 %inc, %9
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %count.0.lcssa = phi i32 [ 0, %0 ], [ %inc, %.lr.ph294 ]
%0 = block 2
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i32 = phi %0, 0:i32, %2
infer %3

; Function: main
;[ORIGIN]   %10 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp6285 = icmp sgt i32 %10, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.1286 = phi i32 [ %inc9, %.lr.ph288 ], [ 0, %.lr.ph288.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %inc9 = add nuw nsw i32 %i.1286, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %11 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp6 = icmp slt i32 %inc9, %11
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %12 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp11279 = icmp sgt i32 %12, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %.pre = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %14 = phi i32 [ %12, %.lr.ph283 ], [ %17, %._crit_edge278 ]
%0:i32 = var (range=[-2147483647,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %15 = phi i32 [ %.pre, %.lr.ph283 ], [ %18, %._crit_edge278 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %i.2280 = phi i32 [ 0, %.lr.ph283 ], [ %inc17, %._crit_edge278 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %cmp12274 = icmp sgt i32 %15, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %j.0275 = phi i32 [ %inc16, %.lr.ph277 ], [ 0, %.lr.ph277.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %inc16 = add nuw nsw i32 %j.0275, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %16 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp12 = icmp slt i32 %inc16, %16
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %.pre311 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %17 = phi i32 [ %.pre311, %._crit_edge278.loopexit ], [ %14, %13 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %18 = phi i32 [ %16, %._crit_edge278.loopexit ], [ %15, %13 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc17 = add nuw nsw i32 %i.2280, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp11 = icmp slt i32 %inc17, %17
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %19 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp19268 = icmp sgt i32 %19, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %.pre312 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %21 = phi i32 [ %19, %.lr.ph272 ], [ %24, %._crit_edge267 ]
%0:i32 = var (range=[-2147483647,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %22 = phi i32 [ %.pre312, %.lr.ph272 ], [ %25, %._crit_edge267 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %i.3269 = phi i32 [ 0, %.lr.ph272 ], [ %inc25, %._crit_edge267 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %cmp20263 = icmp sgt i32 %22, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %j.1264 = phi i32 [ %inc24, %.lr.ph266 ], [ 0, %.lr.ph266.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %inc24 = add nuw nsw i32 %j.1264, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %23 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp20 = icmp slt i32 %inc24, %23
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %.pre313 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %24 = phi i32 [ %.pre313, %._crit_edge267.loopexit ], [ %21, %20 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %25 = phi i32 [ %23, %._crit_edge267.loopexit ], [ %22, %20 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc25 = add nuw nsw i32 %i.3269, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp19 = icmp slt i32 %inc25, %24
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %26 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp27258 = icmp sgt i32 %26, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.4259 = phi i32 [ %inc30, %.lr.ph261 ], [ 0, %.lr.ph261.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %27 = load i32, i32* %arrayidx28, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc30 = add nuw nsw i32 %i.4259, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %28 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp27 = icmp slt i32 %inc30, %28
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %29 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp32252 = icmp sgt i32 %29, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.5253 = phi i32 [ %inc39, %._crit_edge251 ], [ 0, %.lr.ph256.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %30 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp33247 = icmp sgt i32 %30, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %j.2248 = phi i32 [ %inc37, %.lr.ph250 ], [ 0, %.lr.ph250.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %31 = load i32, i32* %arrayidx35, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc37 = add nuw nsw i32 %j.2248, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %32 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp33 = icmp slt i32 %inc37, %32
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %inc39 = add nuw nsw i32 %i.5253, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %33 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp32 = icmp slt i32 %inc39, %33
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %34 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp41240 = icmp sgt i32 %34, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.6241 = phi i32 [ %inc48, %._crit_edge239 ], [ 0, %.lr.ph244.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %35 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp42235 = icmp sgt i32 %35, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %j.3236 = phi i32 [ %inc46, %.lr.ph238 ], [ 0, %.lr.ph238.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %36 = load i32, i32* %arrayidx44, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc46 = add nuw nsw i32 %j.3236, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %37 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp42 = icmp slt i32 %inc46, %37
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %inc48 = add nuw nsw i32 %i.6241, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %38 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp41 = icmp slt i32 %inc48, %38
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %cmp49229 = icmp sgt i32 %38, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i1 = slt 0:i32, %2
infer %4

; Function: main
;[ORIGIN]   %39 = load i32, i32* %r, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp50224 = icmp sgt i32 %39, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.7230.us = phi i32 [ %inc55.us, %._crit_edge228.us ], [ 0, %.lr.ph227.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %j.4225.us = phi i32 [ 0, %.lr.ph227.us ], [ %inc54.us, %40 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %41 = load i32, i32* %arrayidx52.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %42 = load i32, i32* %arrayidx53.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us = add nsw i32 %42, %41
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %inc54.us = add nuw nsw i32 %j.4225.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond308 = icmp eq i32 %inc54.us, %39
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: main
;[ORIGIN]   %inc55.us = add nuw nsw i32 %i.7230.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond309 = icmp eq i32 %inc55.us, %38
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: main
;[ORIGIN]   %43 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp57218 = icmp sgt i32 %43, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.8219 = phi i32 [ %inc60, %.lr.ph221 ], [ 0, %.lr.ph221.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %44 = load i32, i32* %arrayidx58, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc60 = add nuw nsw i32 %i.8219, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %45 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp57 = icmp slt i32 %inc60, %45
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %cmp61213 = icmp sgt i32 %45, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i1 = slt 0:i32, %2
infer %4

; Function: main
;[ORIGIN]   %i.9214 = phi i32 [ %inc65, %.lr.ph216 ], [ 0, %.lr.ph216.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %46 = load i32, i32* %arrayidx62, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %47 = load i32, i32* %arrayidx63, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %sub = sub nsw i32 %46, %47
%0:i32 = var
%1:i32 = var
%2:i32 = subnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %inc65 = add nuw nsw i32 %i.9214, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond = icmp eq i32 %inc65, %45
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: main
;[ORIGIN]   %48 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp67208 = icmp sgt i32 %48, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.10209 = phi i32 [ %inc70, %.lr.ph211 ], [ 0, %.lr.ph211.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %49 = load i32, i32* %arrayidx68, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc70 = add nuw nsw i32 %i.10209, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %50 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp67 = icmp slt i32 %inc70, %50
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %cmp72204 = icmp eq i32 %count.0.lcssa, 0
%0 = block 2
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%2:i32 = addnw 1:i32, %1
%3:i32 = phi %0, 0:i32, %2
%4:i1 = eq 0:i32, %3
infer %4

; Function: main
;[ORIGIN]   %count.1205 = phi i32 [ %dec, %._crit_edge203 ], [ %count.0.lcssa, %.lr.ph207.preheader ]
%0:i32 = var (range=[-2147483646,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %51 = load i32, i32* %p, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp73190 = icmp sgt i32 %51, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %52 = load i32, i32* %r, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp75184 = icmp sgt i32 %52, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.11191.us = phi i32 [ %inc94.us, %.loopexit.us ], [ 0, %.lr.ph193.split.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %53 = load i32, i32* %arrayidx74.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool.us = icmp eq i32 %53, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp75.us = icmp slt i32 %inc83.us, %52
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %j.5185.us = phi i32 [ %inc83.us, %54 ], [ 0, %.lr.ph.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %55 = load i32, i32* %arrayidx77.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %56 = load i32, i32* %arrayidx79.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %sub80.us = sub nsw i32 %55, %56
%0:i32 = var
%1:i32 = var
%2:i32 = subnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %57 = load i32, i32* %arrayidx81.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp82.us = icmp sgt i32 %sub80.us, %57
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = subnsw %1, %2
%4:i1 = slt %0, %3
infer %4

; Function: main
;[ORIGIN]   %inc83.us = add nuw nsw i32 %j.5185.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %inc94.us = add nuw nsw i32 %i.11191.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp73.us = icmp slt i32 %inc94.us, %51
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %i.11191 = phi i32 [ %inc94, %62 ], [ 0, %.lr.ph193.split.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %58 = load i32, i32* %arrayidx74, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool = icmp eq i32 %58, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.11.lcssa182 = phi i32 [ %i.11191.us, %54 ], [ %i.11191, %.lr.ph193.split ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %add85 = add nuw nsw i32 %i.11.lcssa182, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %dec = add nsw i32 %count.1205, -1
%0:i32 = var (range=[-2147483646,-2147483648))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %59 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp88195 = icmp sgt i32 %59, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %j.6196 = phi i32 [ %inc93, %.lr.ph197 ], [ 0, %.lr.ph197.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %60 = load i32, i32* %arrayidx90, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %61 = load i32, i32* %arrayidx91, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add92 = add nsw i32 %61, %60
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %inc93 = add nuw nsw i32 %j.6196, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp88 = icmp slt i32 %inc93, %59
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %inc94 = add nuw nsw i32 %i.11191, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp73 = icmp slt i32 %inc94, %51
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %63 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp100199 = icmp sgt i32 %63, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %i.12200 = phi i32 [ %inc103, %.lr.ph202 ], [ 0, %.lr.ph202.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: main
;[ORIGIN]   %64 = load i32, i32* %arrayidx101, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc103 = add nuw nsw i32 %i.12200, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %65 = load i32, i32* %r, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp100 = icmp slt i32 %inc103, %65
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: main
;[ORIGIN]   %cmp72 = icmp eq i32 %dec, 0
%0:i32 = var (range=[-2147483646,-2147483648))
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i1 = eq 0:i32, %1
infer %2
```
**benchmark4pipeline_c/addition_chains.bc**
```


; Function: reverse
;[ORIGIN]   %cmp17 = icmp sgt i32 %len, 1
%0:i32 = var
%1:i1 = slt 1:i32, %0
infer %1

; Function: reverse
;[ORIGIN]   %j.016 = add nsw i32 %len, -1
%0:i32 = var
%1:i1 = slt 1:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: reverse
;[ORIGIN]   %j.019 = phi i32 [ %j.016, %.lr.ph ], [ %j.0, %1 ]
%0:i32 = var (range=[-2147483647,-2147483648))
infer %0

; Function: reverse
;[ORIGIN]   %i.018 = phi i32 [ 0, %.lr.ph ], [ %inc, %1 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: reverse
;[ORIGIN]   %2 = load i32, i32* %arrayidx, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: reverse
;[ORIGIN]   %3 = load i32, i32* %arrayidx1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: reverse
;[ORIGIN]   %inc = add nuw nsw i32 %i.018, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: reverse
;[ORIGIN]   %j.0 = add nsw i32 %j.019, -1
%0:i32 = var (range=[-2147483647,-2147483648))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: reverse
;[ORIGIN]   %cmp = icmp slt i32 %inc, %j.0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var (range=[-2147483647,-2147483648))
%3:i32 = addnsw 4294967295:i32, %2 (hasExternalUses)
%4:i1 = slt %1, %3
infer %4

; Function: checkSeq
;[ORIGIN]   %cmp = icmp sgt i32 %pos, %minLen
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: checkSeq
;[ORIGIN]   %2 = load i32, i32* %seq, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkSeq
;[ORIGIN]   %cmp1 = icmp sgt i32 %2, %n
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: checkSeq
;[ORIGIN]   %cmp3 = icmp eq i32 %2, %n
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i1 = eq %1, %0
infer %3

; Function: checkSeq
;[ORIGIN]   %mul = shl i32 %len, 2
%0:i32 = var
%1:i32 = shl %0, 2:i32
infer %1

; Function: checkSeq
;[ORIGIN]   %cmp7 = icmp slt i32 %pos, %minLen
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i1 = slt %1, %0
infer %3

; Function: tryPerm
;[ORIGIN]   %cmp = icmp sgt i32 %i, %pos
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: tryPerm
;[ORIGIN]   %add = add nsw i32 %len, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: tryPerm
;[ORIGIN]   %mul = shl i32 %add, 2
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = shl %1, 2:i32
infer %2

; Function: tryPerm
;[ORIGIN]   %mul1 = shl i32 %len, 2
%0:i32 = var
%1:i32 = shl %0, 2:i32
infer %1

; Function: tryPerm
;[ORIGIN]   %4 = load i32, i32* %seq, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: tryPerm
;[ORIGIN]   %5 = load i32, i32* %arrayidx2, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: tryPerm
;[ORIGIN]   %add3 = add nsw i32 %5, %4
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: tryPerm
;[ORIGIN]   %add5 = add nsw i32 %pos, 1
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = addnsw 1:i32, %0
infer %3

; Function: tryPerm
;[ORIGIN]   %cmp.i = icmp sge i32 %pos, %minLen
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = var
%4:i1 = sle %3, %0
infer %4

; Function: tryPerm
;[ORIGIN]   %cmp1.i = icmp sgt i32 %add3, %n
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2 (hasExternalUses)
%4:i1 = slt %0, %3
infer %4

; Function: tryPerm
;[ORIGIN]   %or.cond = or i1 %cmp.i, %cmp1.i
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = var
%4:i32 = var
%5:i32 = var
%6:i32 = addnsw %4, %5 (hasExternalUses)
%7:i1 = slt %3, %6
%8:i32 = var
%9:i1 = sle %8, %0
%10:i1 = or %7, %9
infer %10

; Function: tryPerm
;[ORIGIN]   %cmp3.i = icmp eq i32 %add3, %n
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = var
%4:i32 = var
%5:i32 = var
%6:i32 = addnsw %4, %5 (hasExternalUses)
%7:i1 = slt %3, %6
%8:i32 = var
%9:i1 = sle %8, %0
%10:i1 = or %7, %9
pc %10 0:i1
%11:i1 = eq %3, %6
infer %11

; Function: tryPerm
;[ORIGIN]   %cmp7.i = icmp slt i32 %add5, %minLen
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = var
%4:i32 = var
%5:i32 = var
%6:i32 = addnsw %4, %5 (hasExternalUses)
%7:i1 = slt %3, %6
%8:i32 = var
%9:i1 = sle %8, %0
%10:i1 = or %7, %9
pc %10 0:i1
%11:i1 = eq %3, %6
pc %11 0:i1
%12:i32 = addnsw 1:i32, %0 (hasExternalUses)
%13:i1 = slt %12, %8
infer %13

; Function: tryPerm
;[ORIGIN]   %res1.sroa.0.0.copyload.pre = load i32, i32* %res1.sroa.0.0..sroa_idx.phi.trans.insert, align 4
%0:i32 = var
infer %0

; Function: tryPerm
;[ORIGIN]   %res1.sroa.6.0.copyload.pre = load i32, i32* %res1.sroa.6.0..sroa_idx39.phi.trans.insert, align 4
%0:i32 = var
infer %0

; Function: tryPerm
;[ORIGIN]   %res1.sroa.6.0.copyload = phi i32 [ 0, %6 ], [ 1, %8 ], [ %res1.sroa.6.0.copyload.pre, %10 ], [ 0, %11 ]
%0 = block 4
%1:i32 = var
%2:i32 = phi %0, 0:i32, 1:i32, %1, 0:i32
infer %2

; Function: tryPerm
;[ORIGIN]   %res1.sroa.0.0.copyload = phi i32 [ %minLen, %6 ], [ %add5, %8 ], [ %res1.sroa.0.0.copyload.pre, %10 ], [ %minLen, %11 ]
%0 = block 4
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i32 = var
%5:i32 = phi %0, %1, %3, %4, %1
infer %5

; Function: tryPerm
;[ORIGIN]   %add7 = add nsw i32 %i, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: tryPerm
;[ORIGIN]   %res2.sroa.0.0.copyload = load i32, i32* %res2.sroa.0.0..sroa_idx, align 4
%0:i32 = var
infer %0

; Function: tryPerm
;[ORIGIN]   %res2.sroa.7.0.copyload = load i32, i32* %res2.sroa.7.0..sroa_idx32, align 4
%0:i32 = var
infer %0

; Function: tryPerm
;[ORIGIN]   %cmp12 = icmp slt i32 %res2.sroa.0.0.copyload, %res1.sroa.0.0.copyload
%0:i32 = var
%1 = block 4
%2:i32 = var
%3:i32 = var
%4:i32 = addnsw 1:i32, %3
%5:i32 = var
%6:i32 = phi %1, %2, %4, %5, %2
%7:i1 = slt %0, %6
infer %7

; Function: tryPerm
;[ORIGIN]   %cmp15 = icmp eq i32 %res2.sroa.0.0.copyload, %res1.sroa.0.0.copyload
%0:i32 = var
%1 = block 4
%2:i32 = var
%3:i32 = var
%4:i32 = addnsw 1:i32, %3
%5:i32 = var
%6:i32 = phi %1, %2, %4, %5, %2
%7:i1 = slt %0, %6
pc %7 0:i1
%8:i1 = eq %0, %6
infer %8

; Function: tryPerm
;[ORIGIN]   %add20 = add nsw i32 %res2.sroa.7.0.copyload, %res1.sroa.6.0.copyload
%0:i32 = var
%1 = block 4
%2:i32 = var
%3:i32 = phi %1, 0:i32, 1:i32, %2, 0:i32
%4:i32 = addnsw %0, %3
infer %4

; Function: tryPerm
;[ORIGIN]   %.sink70 = phi i32 [ 0, %14 ], [ %res1.sroa.0.0.copyload, %13 ], [ %minLen, %0 ], [ %res2.sroa.0.0.copyload, %checkSeq.exit ]
%0 = block 4
%1 = block 4
%2:i32 = var
%3:i32 = var
%4:i32 = addnsw 1:i32, %3
%5:i32 = var
%6:i32 = phi %1, %2, %4, %5, %2
%7:i32 = var
%8:i32 = phi %0, 0:i32, %6, %2, %7
infer %8

; Function: tryPerm
;[ORIGIN]   %.sink = phi i32 [ 0, %14 ], [ %add20, %13 ], [ 0, %0 ], [ %res2.sroa.7.0.copyload, %checkSeq.exit ]
%0 = block 4
%1:i32 = var
%2 = block 4
%3:i32 = var
%4:i32 = phi %2, 0:i32, 1:i32, %3, 0:i32
%5:i32 = addnsw %1, %4
%6:i32 = phi %0, 0:i32, %5, 0:i32, %1
infer %6

; Function: printArray
;[ORIGIN]   %cmp6 = icmp sgt i32 %len, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: printArray
;[ORIGIN]   %i.07 = phi i32 [ %inc, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: printArray
;[ORIGIN]   %1 = load i32, i32* %arrayidx, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printArray
;[ORIGIN]   %inc = add nuw nsw i32 %i.07, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: printArray
;[ORIGIN]   %exitcond = icmp eq i32 %inc, %len
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: isBrauer
;[ORIGIN]   %cmp19 = icmp sgt i32 %len, 2
%0:i32 = var
%1:i1 = slt 2:i32, %0
infer %1

; Function: isBrauer
;[ORIGIN]   %.pre = load i32, i32* %arrayidx.phi.trans.insert, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isBrauer
;[ORIGIN]   %2 = phi i32 [ %.pre, %.lr.ph ], [ %3, %7 ]
%0:i32 = var
infer %0

; Function: isBrauer
;[ORIGIN]   %i.020 = phi i32 [ 2, %.lr.ph ], [ %inc, %7 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: isBrauer
;[ORIGIN]   %3 = load i32, i32* %arrayidx4, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isBrauer
;[ORIGIN]   %cmp1 = icmp sgt i32 %j.018.in, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: isBrauer
;[ORIGIN]   %j.018.in = phi i32 [ %i.020, %1 ], [ %j.018, %4 ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: isBrauer
;[ORIGIN]   %j.018 = add nsw i32 %j.018.in, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: isBrauer
;[ORIGIN]   %6 = load i32, i32* %arrayidx3, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isBrauer
;[ORIGIN]   %add = add nsw i32 %6, %2
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: isBrauer
;[ORIGIN]   %cmp5 = icmp eq i32 %add, %3
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: isBrauer
;[ORIGIN]   %inc = add nuw nsw i32 %i.020, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: isBrauer
;[ORIGIN]   %cmp = icmp slt i32 %inc, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: isBrauer
;[ORIGIN]   %retval.0 = phi i32 [ 1, %0 ], [ 0, %4 ], [ 1, %7 ]
%0 = block 3
%1:i32 = phi %0, 1:i32, 0:i32, 1:i32
infer %1

; Function: isAdditionChain
;[ORIGIN]   %cmp51 = icmp sgt i32 %len, 2
%0:i32 = var
%1:i1 = slt 2:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %.pre = load i32, i32* %arrayidx1.phi.trans.insert, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %2 = phi i32 [ %.pre, %.lr.ph54 ], [ %3, %.thread43 ]
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %i.052 = phi i32 [ 2, %.lr.ph54 ], [ %inc, %.thread43 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: isAdditionChain
;[ORIGIN]   %3 = load i32, i32* %arrayidx, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %mul = shl nsw i32 %2, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: isAdditionChain
;[ORIGIN]   %cmp2 = icmp sgt i32 %3, %mul
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: isAdditionChain
;[ORIGIN]   %j.050.in = phi i32 [ %j.050, %._crit_edge ], [ %i.052, %.preheader ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: isAdditionChain
;[ORIGIN]   %j.050 = add nsw i32 %j.050.in, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %cmp548 = icmp sgt i32 %j.050.in, 0
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 0:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %5 = load i32, i32* %arrayidx6, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %add67 = shl nsw i32 %5, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: isAdditionChain
;[ORIGIN]   %cmp968 = icmp eq i32 %add67, %3
%0:i32 = var
%1:i32 = var
%2:i32 = shlnsw %1, 1:i32
%3:i1 = eq %0, %2
infer %3

; Function: isAdditionChain
;[ORIGIN]   %k.04969 = phi i32 [ %dec, %._crit_edge58 ], [ %j.050, %.lr.ph70.preheader ]
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %dec = add nsw i32 %k.04969, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %cmp5 = icmp sgt i32 %k.04969, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %.pre59 = load i32, i32* %arrayidx7.phi.trans.insert, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %add = add nsw i32 %.pre59, %5
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: isAdditionChain
;[ORIGIN]   %cmp9 = icmp eq i32 %add, %3
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: isAdditionChain
;[ORIGIN]   %cmp4 = icmp sgt i32 %j.050.in, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %inc = add nuw nsw i32 %i.052, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %cmp = icmp slt i32 %inc, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: isAdditionChain
;[ORIGIN]   %cmp12 = icmp eq i32* %6, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %or.cond = and i1 %cmp51, %cmp12
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i32 = var
%5:i1 = eq 0:i32, %4
%6:i1 = slt 2:i32, %2 (hasExternalUses)
%7:i1 = and %5, %6
infer %7

; Function: isAdditionChain
;[ORIGIN]   %.pre.i = load i32, i32* %arrayidx.phi.trans.insert.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %8 = phi i32 [ %.pre.i, %.lr.ph.i ], [ %9, %13 ]
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %i.020.i = phi i32 [ 2, %.lr.ph.i ], [ %inc.i, %13 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: isAdditionChain
;[ORIGIN]   %9 = load i32, i32* %arrayidx4.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %cmp1.i = icmp sgt i32 %j.018.in.i, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %j.018.in.i = phi i32 [ %i.020.i, %7 ], [ %j.018.i, %10 ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: isAdditionChain
;[ORIGIN]   %j.018.i = add nsw i32 %j.018.in.i, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %12 = load i32, i32* %arrayidx3.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: isAdditionChain
;[ORIGIN]   %add.i = add nsw i32 %12, %8
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: isAdditionChain
;[ORIGIN]   %cmp5.i = icmp eq i32 %add.i, %9
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: isAdditionChain
;[ORIGIN]   %inc.i = add nuw nsw i32 %i.020.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: isAdditionChain
;[ORIGIN]   %cmp.i = icmp slt i32 %inc.i, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: isAdditionChain
;[ORIGIN]   %mul14 = shl i32 %len, 2
%0:i32 = var
%1:i32 = shl %0, 2:i32
infer %1

; Function: isAdditionChain
;[ORIGIN]   %retval.0 = phi i32 [ 1, %isBrauer.exit ], [ 1, %._crit_edge55 ], [ 1, %0 ], [ 1, %13 ], [ 0, %._crit_edge ], [ 0, %4 ], [ 0, %1 ]
%0 = block 7
%1:i32 = phi %0, 1:i32, 1:i32, 1:i32, 1:i32, 0:i32, 0:i32, 0:i32
infer %1

; Function: nextChains
;[ORIGIN]   %sub = add i32 %len, -1
%0:i32 = var
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp = icmp sgt i32 %sub, %index
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i1 = slt %0, %2
infer %3

; Function: nextChains
;[ORIGIN]   %add = add nsw i32 %index, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %sub2 = sub i32 %sub, %index
%0:i32 = var
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i32 = sub %1, %2
infer %3

; Function: nextChains
;[ORIGIN]   %cmp1040 = icmp slt i32 %add, %sub
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i32 = add 4294967295:i32, %2 (hasExternalUses)
%4:i1 = slt %1, %3
infer %4

; Function: nextChains
;[ORIGIN]   %cmp51.i = icmp sgt i32 %len, 2
%0:i32 = var
%1:i1 = slt 2:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %mul14.i = shl i32 %len, 2
%0:i32 = var
%1:i32 = shl %0, 2:i32
infer %1

; Function: nextChains
;[ORIGIN]   %2 = load i32, i32* %arrayidx, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %sub3.us63 = add i32 %sub2, %2
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i1 = slt %0, %2
pc %3 1:i1
%4:i32 = var
%5:i32 = sub %2, %0 (hasExternalUses)
%6:i32 = add %4, %5
infer %6

; Function: nextChains
;[ORIGIN]   %3 = load i32, i32* %arrayidx5, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %cmp6.us64 = icmp slt i32 %sub3.us63, %3
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i1 = slt %0, %2
pc %3 1:i1
%4:i32 = var
%5:i32 = sub %2, %0 (hasExternalUses)
%6:i32 = add %4, %5
%7:i32 = var
%8:i1 = slt %6, %7
infer %8

; Function: nextChains
;[ORIGIN]   %4 = phi i32 [ %18, %isAdditionChain.exit.us ], [ %2, %.lr.ph65.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %inc.us = add nsw i32 %4, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %.pre.i.us = load i32, i32* %arrayidx1.phi.trans.insert.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %6 = phi i32 [ %.pre.i.us, %.lr.ph54.i.us ], [ %7, %.thread43.i.us ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %i.052.i.us = phi i32 [ 2, %.lr.ph54.i.us ], [ %inc.i.us, %.thread43.i.us ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %7 = load i32, i32* %arrayidx.i.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %mul.i.us = shl nsw i32 %6, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: nextChains
;[ORIGIN]   %cmp2.i.us = icmp sgt i32 %7, %mul.i.us
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: nextChains
;[ORIGIN]   %j.050.in.i.us = phi i32 [ %j.050.i.us, %._crit_edge.i.us ], [ %i.052.i.us, %.preheader ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %j.050.i.us = add nsw i32 %j.050.in.i.us, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp548.i.us = icmp sgt i32 %j.050.in.i.us, 0
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 0:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %9 = load i32, i32* %arrayidx6.i.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add.i43.us = shl nsw i32 %9, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: nextChains
;[ORIGIN]   %cmp9.i44.us = icmp eq i32 %add.i43.us, %7
%0:i32 = var
%1:i32 = var
%2:i32 = shlnsw %1, 1:i32
%3:i1 = eq %0, %2
infer %3

; Function: nextChains
;[ORIGIN]   %k.049.i45.us = phi i32 [ %dec.i.us, %._crit_edge58.i.us ], [ %j.050.i.us, %.lr.ph46.us.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %dec.i.us = add nsw i32 %k.049.i45.us, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp5.i.us = icmp sgt i32 %k.049.i45.us, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp4.i.us = icmp sgt i32 %j.050.in.i.us, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %.pre59.i.us = load i32, i32* %arrayidx7.phi.trans.insert.i.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add.i.us = add nsw i32 %.pre59.i.us, %9
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: nextChains
;[ORIGIN]   %cmp9.i.us = icmp eq i32 %add.i.us, %7
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: nextChains
;[ORIGIN]   %inc.i.us = add nuw nsw i32 %i.052.i.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp.i.us = icmp slt i32 %inc.i.us, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: nextChains
;[ORIGIN]   %cmp12.i.us = icmp eq i32* %10, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %11 = phi i32 [ %12, %16 ], [ %.pre.i.us, %.lr.ph.i.i.us.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %i.020.i.i.us = phi i32 [ %inc.i.i.us, %16 ], [ 2, %.lr.ph.i.i.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %12 = load i32, i32* %arrayidx4.i.i.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %j.018.in.i.i.us = phi i32 [ %i.020.i.i.us, %.lr.ph.i.i.us ], [ %j.018.i.i.us, %15 ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %j.018.i.i.us = add nsw i32 %j.018.in.i.i.us, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %14 = load i32, i32* %arrayidx3.i.i.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add.i.i.us = add nsw i32 %14, %11
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: nextChains
;[ORIGIN]   %cmp5.i.i.us = icmp eq i32 %add.i.i.us, %12
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: nextChains
;[ORIGIN]   %cmp1.i.i.us = icmp sgt i32 %j.018.in.i.i.us, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %inc.i.i.us = add nuw nsw i32 %i.020.i.i.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp.i.i.us = icmp slt i32 %inc.i.i.us, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: nextChains
;[ORIGIN]   %17 = load i32, i32* %pcount, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %inc16.us = add nsw i32 %17, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %18 = load i32, i32* %arrayidx, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %sub3.us = add i32 %sub2, %18
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i32 = var
%4:i32 = sub %2, %3 (hasExternalUses)
%5:i32 = add %0, %4
infer %5

; Function: nextChains
;[ORIGIN]   %19 = load i32, i32* %arrayidx5, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %cmp6.us = icmp slt i32 %sub3.us, %19
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i32 = var
%4:i32 = sub %2, %3 (hasExternalUses)
%5:i32 = add %0, %4
%6:i32 = var
%7:i1 = slt %5, %6
infer %7

; Function: nextChains
;[ORIGIN]   %20 = phi i32 [ %add13.us, %.lr.ph.us ], [ %inc.us, %.lr.ph.us.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %i.042.us = phi i32 [ %i.0.us, %.lr.ph.us ], [ %add, %.lr.ph.us.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add13.us = add nsw i32 %20, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %i.0.us = add nsw i32 %i.042.us, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %exitcond = icmp eq i32 %i.0.us, %sub
%0:i32 = var
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: nextChains
;[ORIGIN]   %21 = load i32, i32* %arrayidx, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %sub366 = add i32 %sub2, %21
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i1 = slt %0, %2
pc %3 0:i1
%4:i32 = var
%5:i32 = sub %2, %0 (hasExternalUses)
%6:i32 = add %4, %5
infer %6

; Function: nextChains
;[ORIGIN]   %22 = load i32, i32* %arrayidx5, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %cmp667 = icmp slt i32 %sub366, %22
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i1 = slt %0, %2
pc %3 0:i1
%4:i32 = var
%5:i32 = sub %2, %0 (hasExternalUses)
%6:i32 = add %4, %5
%7:i32 = var
%8:i1 = slt %6, %7
infer %8

; Function: nextChains
;[ORIGIN]   %23 = phi i32 [ %38, %isAdditionChain.exit ], [ %21, %.lr.ph68.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %inc = add nsw i32 %23, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %24 = phi i32 [ %add13, %.lr.ph ], [ %inc, %.lr.ph.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %i.042 = phi i32 [ %i.0, %.lr.ph ], [ %add, %.lr.ph.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add13 = add nsw i32 %24, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %i.0 = add nsw i32 %i.042, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %exitcond52 = icmp eq i32 %i.0, %sub
%0:i32 = var
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: nextChains
;[ORIGIN]   %.pre.i = load i32, i32* %arrayidx1.phi.trans.insert.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %26 = phi i32 [ %.pre.i, %.lr.ph54.i ], [ %27, %.thread43.i ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %i.052.i = phi i32 [ 2, %.lr.ph54.i ], [ %inc.i, %.thread43.i ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %27 = load i32, i32* %arrayidx.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %mul.i = shl nsw i32 %26, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: nextChains
;[ORIGIN]   %cmp2.i = icmp sgt i32 %27, %mul.i
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: nextChains
;[ORIGIN]   %j.050.in.i = phi i32 [ %j.050.i, %._crit_edge.i ], [ %i.052.i, %.preheader71 ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %j.050.i = add nsw i32 %j.050.in.i, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp548.i = icmp sgt i32 %j.050.in.i, 0
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 0:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %29 = load i32, i32* %arrayidx6.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add.i43 = shl nsw i32 %29, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: nextChains
;[ORIGIN]   %cmp9.i44 = icmp eq i32 %add.i43, %27
%0:i32 = var
%1:i32 = var
%2:i32 = shlnsw %1, 1:i32
%3:i1 = eq %0, %2
infer %3

; Function: nextChains
;[ORIGIN]   %k.049.i45 = phi i32 [ %dec.i, %._crit_edge58.i ], [ %j.050.i, %.lr.ph46.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %dec.i = add nsw i32 %k.049.i45, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp5.i = icmp sgt i32 %k.049.i45, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %.pre59.i = load i32, i32* %arrayidx7.phi.trans.insert.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add.i = add nsw i32 %.pre59.i, %29
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: nextChains
;[ORIGIN]   %cmp9.i = icmp eq i32 %add.i, %27
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: nextChains
;[ORIGIN]   %cmp4.i = icmp sgt i32 %j.050.in.i, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %inc.i = add nuw nsw i32 %i.052.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp.i = icmp slt i32 %inc.i, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: nextChains
;[ORIGIN]   %cmp12.i = icmp eq i32* %30, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %31 = phi i32 [ %32, %36 ], [ %.pre.i, %.lr.ph.i.i.preheader ]
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %i.020.i.i = phi i32 [ %inc.i.i, %36 ], [ 2, %.lr.ph.i.i.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %32 = load i32, i32* %arrayidx4.i.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %cmp1.i.i = icmp sgt i32 %j.018.in.i.i, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %j.018.in.i.i = phi i32 [ %i.020.i.i, %.lr.ph.i.i ], [ %j.018.i.i, %33 ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: nextChains
;[ORIGIN]   %j.018.i.i = add nsw i32 %j.018.in.i.i, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %35 = load i32, i32* %arrayidx3.i.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %add.i.i = add nsw i32 %35, %31
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: nextChains
;[ORIGIN]   %cmp5.i.i = icmp eq i32 %add.i.i, %32
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: nextChains
;[ORIGIN]   %inc.i.i = add nuw nsw i32 %i.020.i.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %cmp.i.i = icmp slt i32 %inc.i.i, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: nextChains
;[ORIGIN]   %37 = load i32, i32* %pcount, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %inc16 = add nsw i32 %37, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: nextChains
;[ORIGIN]   %38 = load i32, i32* %arrayidx, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %sub3 = add i32 %sub2, %38
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i32 = var
%4:i32 = sub %2, %3 (hasExternalUses)
%5:i32 = add %0, %4
infer %5

; Function: nextChains
;[ORIGIN]   %39 = load i32, i32* %arrayidx5, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: nextChains
;[ORIGIN]   %cmp6 = icmp slt i32 %sub3, %39
%0:i32 = var
%1:i32 = var
%2:i32 = add 4294967295:i32, %1 (hasExternalUses)
%3:i32 = var
%4:i32 = sub %2, %3 (hasExternalUses)
%5:i32 = add %0, %4
%6:i32 = var
%7:i1 = slt %5, %6
infer %7

; Function: findNonBrauer
;[ORIGIN]   %mul = shl i32 %len, 2
%0:i32 = var
%1:i32 = shl %0, 2:i32
infer %1

; Function: findNonBrauer
;[ORIGIN]   %sub = add nsw i32 %len, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %cmp27 = icmp sgt i32 %len, 2
%0:i32 = var
%1:i1 = slt 2:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %.pre = load i32, i32* %2, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %4 = phi i32 [ %.pre, %.lr.ph29 ], [ %add, %3 ]
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %i.028 = phi i32 [ 1, %.lr.ph29 ], [ %inc, %3 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,-2147483648))
infer %0

; Function: findNonBrauer
;[ORIGIN]   %add = add nsw i32 %4, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %inc = add nuw nsw i32 %i.028, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %exitcond = icmp eq i32 %inc, %sub
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,-2147483648))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: findNonBrauer
;[ORIGIN]   %.pre.i = load i32, i32* %5, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %7 = phi i32 [ %.pre.i, %.lr.ph54.i ], [ %8, %.thread43.i ]
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %i.052.i = phi i32 [ 2, %.lr.ph54.i ], [ %inc.i, %.thread43.i ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: findNonBrauer
;[ORIGIN]   %8 = load i32, i32* %arrayidx.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %mul.i = shl nsw i32 %7, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: findNonBrauer
;[ORIGIN]   %cmp2.i = icmp sgt i32 %8, %mul.i
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: findNonBrauer
;[ORIGIN]   %j.050.in.i = phi i32 [ %j.050.i, %._crit_edge.i ], [ %i.052.i, %.preheader ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: findNonBrauer
;[ORIGIN]   %j.050.i = add nsw i32 %j.050.in.i, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %cmp548.i = icmp sgt i32 %j.050.in.i, 0
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 0:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %10 = load i32, i32* %arrayidx6.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %add.i24 = shl nsw i32 %10, 1
%0:i32 = var
%1:i32 = shlnsw %0, 1:i32
infer %1

; Function: findNonBrauer
;[ORIGIN]   %cmp9.i25 = icmp eq i32 %add.i24, %8
%0:i32 = var
%1:i32 = var
%2:i32 = shlnsw %1, 1:i32
%3:i1 = eq %0, %2
infer %3

; Function: findNonBrauer
;[ORIGIN]   %k.049.i26 = phi i32 [ %dec.i, %._crit_edge58.i ], [ %j.050.i, %.lr.ph.preheader ]
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %dec.i = add nsw i32 %k.049.i26, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %cmp5.i = icmp sgt i32 %k.049.i26, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %.pre59.i = load i32, i32* %arrayidx7.phi.trans.insert.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %add.i = add nsw i32 %.pre59.i, %10
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: findNonBrauer
;[ORIGIN]   %cmp9.i = icmp eq i32 %add.i, %8
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: findNonBrauer
;[ORIGIN]   %cmp4.i = icmp sgt i32 %j.050.in.i, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %inc.i = add nuw nsw i32 %i.052.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %cmp.i = icmp slt i32 %inc.i, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: findNonBrauer
;[ORIGIN]   %cmp12.i = icmp eq i32* %11, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %12 = phi i32 [ %13, %17 ], [ %.pre.i, %.lr.ph.i.i.preheader ]
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %i.020.i.i = phi i32 [ %inc.i.i, %17 ], [ 2, %.lr.ph.i.i.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
infer %0

; Function: findNonBrauer
;[ORIGIN]   %13 = load i32, i32* %arrayidx4.i.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %cmp1.i.i = icmp sgt i32 %j.018.in.i.i, 1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i1 = slt 1:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %j.018.in.i.i = phi i32 [ %i.020.i.i, %.lr.ph.i.i ], [ %j.018.i.i, %14 ]
%0:i32 = var (range=[-2147483643,2147483647))
infer %0

; Function: findNonBrauer
;[ORIGIN]   %j.018.i.i = add nsw i32 %j.018.in.i.i, -1
%0:i32 = var (range=[-2147483643,2147483647))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %16 = load i32, i32* %arrayidx3.i.i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %add.i.i = add nsw i32 %16, %12
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: findNonBrauer
;[ORIGIN]   %cmp5.i.i = icmp eq i32 %add.i.i, %13
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw %1, %2
%4:i1 = eq %0, %3
infer %4

; Function: findNonBrauer
;[ORIGIN]   %inc.i.i = add nuw nsw i32 %i.020.i.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: findNonBrauer
;[ORIGIN]   %cmp.i.i = icmp slt i32 %inc.i.i, %len
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[2,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: findNonBrauer
;[ORIGIN]   %18 = load i32, i32* %count, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: findNonBrauer
;[ORIGIN]   %sub7 = sub nsw i32 %18, %brauer
%0:i32 = var
%1:i32 = var
%2:i32 = subnsw %0, %1
infer %2

; Function: findBrauer
;[ORIGIN]   %4 = load i32, i32* %x, align 4, !tbaa !5
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %5 = load i32, i32* %y, align 4, !tbaa !10
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %cmp = icmp sgt i32 %5, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %8 = load i32, i32* @exampleLen, align 4, !tbaa !13
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %cmp17.i = icmp sgt i32 %8, 1
%0:i32 = var
%1:i1 = slt 1:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %j.016.i = add nsw i32 %8, -1
%0:i32 = var
%1:i1 = slt 1:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: findBrauer
;[ORIGIN]   %j.019.i = phi i32 [ %j.016.i, %.lr.ph.i ], [ %j.0.i, %9 ]
%0:i32 = var (range=[-2147483647,-2147483648))
infer %0

; Function: findBrauer
;[ORIGIN]   %i.018.i = phi i32 [ 0, %.lr.ph.i ], [ %inc.i, %9 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: findBrauer
;[ORIGIN]   %10 = load i32, i32* %arrayidx.i, align 4, !tbaa !13
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %11 = load i32, i32* %arrayidx1.i, align 4, !tbaa !13
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %inc.i = add nuw nsw i32 %i.018.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %j.0.i = add nsw i32 %j.019.i, -1
%0:i32 = var (range=[-2147483647,-2147483648))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %cmp.i = icmp slt i32 %inc.i, %j.0.i
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var (range=[-2147483647,-2147483648))
%3:i32 = addnsw 4294967295:i32, %2 (hasExternalUses)
%4:i1 = slt %1, %3
infer %4

; Function: findBrauer
;[ORIGIN]   %.pr = load i32, i32* @exampleLen, align 4, !tbaa !13
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %12 = phi i32 [ %.pr, %reverse.exitthread-pre-split ], [ %8, %6 ]
%0 = block 2
%1:i32 = var
%2:i32 = var
%3:i32 = phi %0, %1, %2
infer %3

; Function: findBrauer
;[ORIGIN]   %cmp6.i27 = icmp sgt i32 %12, 0
%0 = block 2
%1:i32 = var
%2:i32 = var
%3:i32 = phi %0, %1, %2
%4:i1 = slt 0:i32, %3
infer %4

; Function: findBrauer
;[ORIGIN]   %i.07.i29 = phi i32 [ %inc.i32, %.lr.ph.i28 ], [ 0, %.lr.ph.i28.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: findBrauer
;[ORIGIN]   %13 = load i32, i32* %arrayidx.i30, align 4, !tbaa !13
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %inc.i32 = add nuw nsw i32 %i.07.i29, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %exitcond.i33 = icmp eq i32 %inc.i32, %12
%0 = block 2
%1:i32 = var
%2:i32 = var
%3:i32 = phi %0, %1, %2
%4:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%5:i32 = addnw 1:i32, %4 (hasExternalUses)
%6:i1 = eq %3, %5
infer %6

; Function: findBrauer
;[ORIGIN]   %cmp4 = icmp eq i32* %15, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %cmp5 = icmp sgt i32 %num, %nbLimit
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: findBrauer
;[ORIGIN]   %add = add nsw i32 %4, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %call6 = tail call i32 @findNonBrauer(i32 %num, i32 %add, i32 %5)
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %cmp8 = icmp sgt i32 %call6, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %22 = load i32, i32* @exampleLen, align 4, !tbaa !13
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %cmp6.i = icmp sgt i32 %22, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %i.07.i = phi i32 [ %inc.i25, %.lr.ph.i23 ], [ 0, %.lr.ph.i23.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: findBrauer
;[ORIGIN]   %23 = load i32, i32* %arrayidx.i24, align 4, !tbaa !13
%0:i32 = var
infer %0

; Function: findBrauer
;[ORIGIN]   %inc.i25 = add nuw nsw i32 %i.07.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: findBrauer
;[ORIGIN]   %exitcond.i = icmp eq i32 %inc.i25, %22
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: findBrauer
;[ORIGIN]   %cmp10 = icmp eq i32* %25, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1
```
**benchmark4pipeline_c/aliquot_sequence_classifications_1.bc**
```


; Function: bruteForceProperDivisorSum
;[ORIGIN]   %add = add i64 %n, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %div = lshr i64 %add, 1
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i64 = lshr %1, 1:i64
infer %2

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %cmp13 = icmp ugt i64 %add, 3
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = ult 3:i64, %1
infer %2

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %sum.015 = phi i64 [ %sum.1, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i64 = var
infer %0

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %i.014 = phi i64 [ %inc, %.lr.ph ], [ 1, %.lr.ph.preheader ]
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
infer %0

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %rem = urem i64 %n, %i.014
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i64 = urem %0, %1
infer %2

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %cmp1 = icmp ne i64 %rem, 0
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i64 = urem %0, %1
%3:i1 = ne 0:i64, %2
infer %3

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %cmp2 = icmp eq i64 %i.014, %n
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i1 = eq %0, %1
infer %2

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %or.cond = or i1 %cmp2, %cmp1
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i1 = eq %0, %1
%3:i64 = urem %0, %1
%4:i1 = ne 0:i64, %3
%5:i1 = or %2, %4
infer %5

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %add3 = select i1 %or.cond, i64 0, i64 %i.014
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i1 = eq %0, %1
%3:i64 = urem %0, %1
%4:i1 = ne 0:i64, %3
%5:i1 = or %2, %4
%6:i64 = select %5, 0:i64, %1
infer %6

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %sum.1 = add i64 %add3, %sum.015
%0:i64 = var
%1:i64 = var
%2:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%3:i1 = eq %1, %2
%4:i64 = urem %1, %2
%5:i1 = ne 0:i64, %4
%6:i1 = or %3, %5
%7:i64 = select %6, 0:i64, %2
%8:i64 = add %0, %7
infer %8

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %inc = add nuw nsw i64 %i.014, 1
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0
infer %1

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %cmp = icmp ult i64 %inc, %div
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
infer %5

; Function: bruteForceProperDivisorSum
;[ORIGIN]   %sum.0.lcssa = phi i64 [ 0, %0 ], [ %sum.1, %.lr.ph ]
%0 = block 2
%1:i64 = var
%2:i64 = var
%3:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%4:i1 = eq %2, %3
%5:i64 = urem %2, %3
%6:i1 = ne 0:i64, %5
%7:i1 = or %4, %6
%8:i64 = select %7, 0:i64, %3
%9:i64 = add %1, %8 (hasExternalUses)
%10:i64 = phi %0, 0:i64, %9
infer %10

; Function: printSeries
;[ORIGIN]   %1 = load i64, i64* %arr, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %sub = add nsw i32 %size, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: printSeries
;[ORIGIN]   %cmp9 = icmp sgt i32 %size, 1
%0:i32 = var
%1:i1 = slt 1:i32, %0
infer %1

; Function: printSeries
;[ORIGIN]   %2 = load i64, i64* %arr, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %3 = phi i64 [ %4, %.lr.ph ], [ %2, %.lr.ph.preheader ]
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %i.010 = phi i32 [ %inc, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: printSeries
;[ORIGIN]   %inc = add nuw nsw i32 %i.010, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: printSeries
;[ORIGIN]   %4 = load i64, i64* %arrayidx1, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %exitcond = icmp eq i32 %inc, %sub
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: printSeries
;[ORIGIN]   %.lcssa = phi i64 [ %2, %0 ], [ %4, %.lr.ph ]
%0 = block 2
%1:i64 = var
%2:i64 = var
%3:i64 = phi %0, %1, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %3 = phi i64 [ %n, %0 ], [ %sum.1.i, %._crit_edge ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.0114 = phi i32 [ 1, %0 ], [ %inc36, %._crit_edge ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %add.i = add i64 %3, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %div.i = lshr i64 %add.i, 1
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i64 = lshr %1, 1:i64
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %cmp13.i = icmp ugt i64 %add.i, 3
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = ult 3:i64, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %sum.015.i = phi i64 [ %sum.1.i, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.014.i = phi i64 [ %inc.i, %.lr.ph.i ], [ 1, %.lr.ph.i.preheader ]
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %rem.i = urem i64 %3, %i.014.i
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i64 = urem %0, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %cmp1.i = icmp ne i64 %rem.i, 0
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i64 = urem %0, %1
%3:i1 = ne 0:i64, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %cmp2.i = icmp eq i64 %i.014.i, %3
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i1 = eq %0, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %or.cond.i = or i1 %cmp2.i, %cmp1.i
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i1 = eq %0, %1
%3:i64 = urem %0, %1
%4:i1 = ne 0:i64, %3
%5:i1 = or %2, %4
infer %5

; Function: aliquotClassifier
;[ORIGIN]   %add3.i = select i1 %or.cond.i, i64 0, i64 %i.014.i
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%2:i1 = eq %0, %1
%3:i64 = urem %0, %1
%4:i1 = ne 0:i64, %3
%5:i1 = or %2, %4
%6:i64 = select %5, 0:i64, %1
infer %6

; Function: aliquotClassifier
;[ORIGIN]   %sum.1.i = add i64 %add3.i, %sum.015.i
%0:i64 = var
%1:i64 = var
%2:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%3:i1 = eq %1, %2
%4:i64 = urem %1, %2
%5:i1 = ne 0:i64, %4
%6:i1 = or %3, %5
%7:i64 = select %6, 0:i64, %2
%8:i64 = add %0, %7
infer %8

; Function: aliquotClassifier
;[ORIGIN]   %inc.i = add nuw nsw i64 %i.014.i, 1
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %cmp.i = icmp ult i64 %inc.i, %div.i
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
infer %5

; Function: aliquotClassifier
;[ORIGIN]   %cmp4 = icmp eq i64 %sum.1.i, 0
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12
infer %13

; Function: aliquotClassifier
;[ORIGIN]   %cmp6 = icmp eq i64 %sum.1.i, %n
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i64 = var
%8:i1 = eq %2, %0
%9:i64 = urem %2, %0
%10:i1 = ne 0:i64, %9
%11:i1 = or %8, %10
%12:i64 = select %11, 0:i64, %0
%13:i64 = add %7, %12 (hasExternalUses)
%14:i1 = eq %6, %13
infer %14

; Function: aliquotClassifier
;[ORIGIN]   %or.cond70 = or i1 %cmp4, %cmp6
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12 (hasExternalUses)
%14:i64 = var
%15:i1 = eq %14, %12 (hasExternalUses)
%16:i1 = or %13, %15
infer %16

; Function: aliquotClassifier
;[ORIGIN]   %or.cond70.not = xor i1 %or.cond70, true
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12 (hasExternalUses)
%14:i64 = var
%15:i1 = eq %14, %12 (hasExternalUses)
%16:i1 = or %13, %15
%17:i1 = xor 1:i1, %16
infer %17

; Function: aliquotClassifier
;[ORIGIN]   %cmp10 = icmp ne i64 %sum.1.i, %3
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = ne %2, %12
infer %13

; Function: aliquotClassifier
;[ORIGIN]   %or.cond99 = and i1 %cmp10, %or.cond70.not
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12 (hasExternalUses)
%14:i64 = var
%15:i1 = eq %14, %12 (hasExternalUses)
%16:i1 = or %13, %15
%17:i1 = xor 1:i1, %16
%18:i1 = ne %2, %12
%19:i1 = and %17, %18
infer %19

; Function: aliquotClassifier
;[ORIGIN]   %cmp17 = icmp eq i32 %i.0114, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i1 = eq 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %or.cond = and i1 %cmp17, %cmp6
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12 (hasExternalUses)
%14:i64 = var
%15:i1 = eq %14, %12 (hasExternalUses)
%16:i1 = or %13, %15
%17:i1 = xor 1:i1, %16
%18:i1 = ne %2, %12
%19:i1 = and %17, %18
pc %19 0:i1
pc %13 0:i1
%20:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%21:i1 = eq 1:i32, %20
%22:i1 = and %21, %15
infer %22

; Function: aliquotClassifier
;[ORIGIN]   %cmp20 = icmp eq i32 %i.0114, 2
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12 (hasExternalUses)
%14:i64 = var
%15:i1 = eq %14, %12 (hasExternalUses)
%16:i1 = or %13, %15
%17:i1 = xor 1:i1, %16
%18:i1 = ne %2, %12
%19:i1 = and %17, %18
pc %19 0:i1
pc %13 0:i1
%20:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%21:i1 = eq 1:i32, %20
%22:i1 = and %21, %15
pc %22 0:i1
%23:i1 = eq 2:i32, %20
infer %23

; Function: aliquotClassifier
;[ORIGIN]   %or.cond39 = and i1 %cmp20, %cmp6
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12 (hasExternalUses)
%14:i64 = var
%15:i1 = eq %14, %12 (hasExternalUses)
%16:i1 = or %13, %15
%17:i1 = xor 1:i1, %16
%18:i1 = ne %2, %12
%19:i1 = and %17, %18
pc %19 0:i1
pc %13 0:i1
%20:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%21:i1 = eq 1:i32, %20
%22:i1 = and %21, %15
pc %22 0:i1
%23:i1 = eq 2:i32, %20
%24:i1 = and %23, %15
infer %24

; Function: aliquotClassifier
;[ORIGIN]   %cmp24 = icmp eq i64 %sum.1.i, %3
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var
%3:i64 = add 1:i64, %2 (hasExternalUses)
%4:i64 = lshr %3, 1:i64
%5:i1 = ult %1, %4
pc %5 0:i1
%6:i64 = var
%7:i1 = eq %2, %0
%8:i64 = urem %2, %0
%9:i1 = ne 0:i64, %8
%10:i1 = or %7, %9
%11:i64 = select %10, 0:i64, %0
%12:i64 = add %6, %11 (hasExternalUses)
%13:i1 = eq 0:i64, %12 (hasExternalUses)
%14:i64 = var
%15:i1 = eq %14, %12 (hasExternalUses)
%16:i1 = or %13, %15
%17:i1 = xor 1:i1, %16
%18:i1 = ne %2, %12
%19:i1 = and %17, %18
pc %19 0:i1
pc %13 0:i1
%20:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%21:i1 = eq 1:i32, %20
%22:i1 = and %21, %15
pc %22 0:i1
%23:i1 = eq 2:i32, %20
%24:i1 = and %23, %15
pc %24 0:i1
%25:i1 = eq %2, %12
infer %25

; Function: aliquotClassifier
;[ORIGIN]   %i.0114127 = phi i32 [ %i.0114, %4 ], [ 1, %5 ], [ 2, %6 ], [ %i.0114, %7 ], [ %i.0114, %.thread ]
%0 = block 5
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%2:i32 = phi %0, %1, 1:i32, 2:i32, %1, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %10 = load i64, i64* %arrayidx, align 16, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %12 = phi i64 [ %10, %9 ], [ %13, %11 ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.010.i76 = phi i32 [ 0, %9 ], [ %inc.i78, %11 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %inc.i78 = add nuw nsw i32 %i.010.i76, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %13 = load i64, i64* %arrayidx1.i79, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i80 = icmp eq i32 %inc.i78, %i.0114127
%0 = block 5
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%2:i32 = phi %0, %1, 1:i32, 2:i32, %1, %1
%3:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%4:i32 = addnw 1:i32, %3 (hasExternalUses)
%5:i1 = eq %2, %4
infer %5

; Function: aliquotClassifier
;[ORIGIN]   %cmp30112 = icmp ugt i32 %i.0114, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i1 = ult 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %cmp30 = icmp ult i32 %inc, %i.0114
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,15))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%3:i1 = ult %1, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %j.0113 = phi i32 [ %inc, %15 ], [ 1, %.lr.ph.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,15))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %16 = load i64, i64* %arrayidx31, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %cmp33 = icmp eq i64 %16, %sum.1.i
%0:i64 = var
%1:i64 = var
%2:i64 = var
%3:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,9223372036854775807))
%4:i1 = eq %2, %3
%5:i64 = urem %2, %3
%6:i1 = ne 0:i64, %5
%7:i1 = or %4, %6
%8:i64 = select %7, 0:i64, %3
%9:i64 = add %1, %8 (hasExternalUses)
%10:i1 = eq %0, %9
infer %10

; Function: aliquotClassifier
;[ORIGIN]   %inc = add nuw nsw i32 %j.0113, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,15))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %18 = load i64, i64* %arrayidx, align 16, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %20 = phi i64 [ %18, %17 ], [ %21, %19 ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.010.i85 = phi i32 [ 0, %17 ], [ %inc.i87, %19 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %inc.i87 = add nuw nsw i32 %i.010.i85, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %21 = load i64, i64* %arrayidx1.i88, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i89 = icmp eq i32 %inc.i87, %i.0114
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %inc36 = add nuw nsw i32 %i.0114, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %cmp = icmp ult i32 %inc36, 16
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = ult %1, 16:i32
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %23 = load i64, i64* %arrayidx, align 16, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %25 = phi i64 [ %23, %22 ], [ %26, %24 ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.010.i = phi i32 [ 0, %22 ], [ %inc.i73, %24 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,16))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %inc.i73 = add nuw nsw i32 %i.010.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,16))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %26 = load i64, i64* %arrayidx1.i, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i = icmp eq i32 %inc.i73, %inc36
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,16))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: processFile
;[ORIGIN]   %cmp8 = icmp eq i8* %call17, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: processFile
;[ORIGIN]   %call3 = call i64 @strtoull(i8* nocapture nonnull %1, i8** null, i32 10)
%0:i64 = var
infer %0

; Function: processFile
;[ORIGIN]   %cmp = icmp eq i8* %call1, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp = icmp eq i32 %argC, 2
%0:i32 = var
%1:i1 = eq 2:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp3 = icmp eq i8* %call2, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp8.i = icmp eq i8* %call17.i, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %call3.i = call i64 @strtoull(i8* nocapture nonnull %6, i8** null, i32 10) #5
%0:i64 = var
infer %0

; Function: main
;[ORIGIN]   %cmp.i = icmp eq i8* %call1.i, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %call6 = tail call i64 @strtoull(i8* nocapture %4, i8** null, i32 10)
%0:i64 = var
infer %0
```
**benchmark4pipeline_c/aliquot_sequence_classifications_2.bc**
```


; Function: raiseTo
;[ORIGIN]   %cmp5 = icmp eq i64 %power, 0
%0:i64 = var
%1:i1 = eq 0:i64, %0
infer %1

; Function: raiseTo
;[ORIGIN]   %i.07 = phi i64 [ %inc, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i64 = var (range=[0,-1))
infer %0

; Function: raiseTo
;[ORIGIN]   %result.06 = phi i64 [ %mul, %.lr.ph ], [ 1, %.lr.ph.preheader ]
%0:i64 = var
infer %0

; Function: raiseTo
;[ORIGIN]   %mul = mul i64 %result.06, %base
%0:i64 = var
%1:i64 = var
%2:i64 = mul %0, %1
infer %2

; Function: raiseTo
;[ORIGIN]   %inc = add nuw i64 %i.07, 1
%0:i64 = var (range=[0,-1))
%1:i64 = addnuw 1:i64, %0
infer %1

; Function: raiseTo
;[ORIGIN]   %exitcond = icmp eq i64 %inc, %power
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i64 = addnuw 1:i64, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: raiseTo
;[ORIGIN]   %result.0.lcssa = phi i64 [ 1, %0 ], [ %mul, %.lr.ph ]
%0 = block 2
%1:i64 = var
%2:i64 = var
%3:i64 = mul %1, %2 (hasExternalUses)
%4:i64 = phi %0, 1:i64, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %rem74 = and i64 %n, 1
%0:i64 = var
%1:i64 = and 1:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %cmp75 = icmp eq i64 %rem74, 0
%0:i64 = var
%1:i64 = and 1:i64, %0
%2:i1 = eq 0:i64, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %count.077 = phi i64 [ %inc, %.lr.ph79 ], [ 0, %.lr.ph79.preheader ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %n.addr.076 = phi i64 [ %div, %.lr.ph79 ], [ %n, %.lr.ph79.preheader ]
%0:i64 = var
infer %0 (demandedBits=1111111111111111111111111111111111111111111111111111111111111110)

; Function: properDivisorSum
;[ORIGIN]   %inc = add i64 %count.077, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %div = lshr i64 %n.addr.076, 1
%0:i64 = var
%1:i64 = lshr %0, 1:i64
infer %1

; Function: properDivisorSum
;[ORIGIN]   %rem = and i64 %n.addr.076, 2
%0:i64 = var
%1:i64 = and 2:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %cmp = icmp eq i64 %rem, 0
%0:i64 = var
%1:i64 = and 2:i64, %0
%2:i1 = eq 0:i64, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %cmp1 = icmp eq i64 %inc, 0
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %add = add i64 %count.077, 2
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
pc %2 0:i1
%3:i64 = add 2:i64, %0
infer %3

; Function: properDivisorSum
;[ORIGIN]   %cmp5.i = icmp eq i64 %add, 0
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
pc %2 0:i1
%3:i64 = add 2:i64, %0 (hasExternalUses)
%4:i1 = eq 0:i64, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %i.07.i = phi i64 [ %inc.i, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
%0:i64 = var (range=[0,-1))
infer %0

; Function: properDivisorSum
;[ORIGIN]   %result.06.i = phi i64 [ %mul.i, %.lr.ph.i ], [ 1, %.lr.ph.i.preheader ]
%0:i64 = var (range=[-9223372036854775808,9223372036854775807))
infer %0 (demandedBits=0111111111111111111111111111111111111111111111111111111111111111)

; Function: properDivisorSum
;[ORIGIN]   %mul.i = shl i64 %result.06.i, 1
%0:i64 = var (range=[-9223372036854775808,9223372036854775807))
%1:i64 = shl %0, 1:i64
infer %1

; Function: properDivisorSum
;[ORIGIN]   %inc.i = add nuw i64 %i.07.i, 1
%0:i64 = var (range=[0,-1))
%1:i64 = addnuw 1:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %exitcond.i = icmp eq i64 %inc.i, %add
%0:i64 = var
%1:i64 = add 2:i64, %0 (hasExternalUses)
%2:i64 = var (range=[0,-1))
%3:i64 = addnuw 1:i64, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %phitmp = add i64 %mul.i, -1
%0:i64 = var (range=[-9223372036854775808,9223372036854775807))
%1:i64 = shl %0, 1:i64 (hasExternalUses)
%2:i64 = add 18446744073709551615:i64, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %n.addr.0.lcssa84 = phi i64 [ %div, %._crit_edge80 ], [ %div, %raiseTo.exit.loopexit ], [ %div, %1 ], [ %n, %0 ]
%0 = block 4
%1:i64 = var
%2:i64 = lshr %1, 1:i64 (hasExternalUses)
%3:i64 = var
%4:i64 = phi %0, %2, %2, %2, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %prod.0 = phi i64 [ 1, %._crit_edge80 ], [ %phitmp, %raiseTo.exit.loopexit ], [ 0, %1 ], [ 1, %0 ]
%0 = block 4
%1:i64 = var (range=[-9223372036854775808,9223372036854775807))
%2:i64 = shl %1, 1:i64 (hasExternalUses)
%3:i64 = add 18446744073709551615:i64, %2
%4:i64 = phi %0, 1:i64, %3, 0:i64, 1:i64
infer %4

; Function: properDivisorSum
;[ORIGIN]   %cmp363 = icmp ult i64 %n.addr.0.lcssa84, 9
%0 = block 4
%1:i64 = var
%2:i64 = lshr %1, 1:i64
%3:i64 = var
%4:i64 = phi %0, %2, %2, %2, %3
%5:i1 = ult %4, 9:i64
infer %5

; Function: properDivisorSum
;[ORIGIN]   %i.066 = phi i64 [ %add18, %._crit_edge.thread ], [ 3, %.lr.ph70.preheader ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %n.addr.165 = phi i64 [ %n.addr.2.lcssa85, %._crit_edge.thread ], [ %n.addr.0.lcssa84, %.lr.ph70.preheader ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %prod.164 = phi i64 [ %prod.2, %._crit_edge.thread ], [ %prod.0, %.lr.ph70.preheader ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %rem458 = urem i64 %n.addr.165, %i.066
%0:i64 = var
%1:i64 = var
%2:i64 = urem %0, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %cmp559 = icmp eq i64 %rem458, 0
%0:i64 = var
%1:i64 = var
%2:i64 = urem %0, %1
%3:i1 = eq 0:i64, %2
infer %3

; Function: properDivisorSum
;[ORIGIN]   %count.161 = phi i64 [ %inc6, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %n.addr.260 = phi i64 [ %div7, %.lr.ph ], [ %n.addr.165, %.lr.ph.preheader ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %inc6 = add i64 %count.161, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %div7 = udiv i64 %n.addr.260, %i.066
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %rem4 = urem i64 %div7, %i.066
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
infer %3

; Function: properDivisorSum
;[ORIGIN]   %cmp5 = icmp eq i64 %rem4, 0
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
%4:i1 = eq 0:i64, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %add9 = add i64 %i.066, 1
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
%4:i1 = eq 0:i64, %3
pc %4 0:i1
%5:i64 = add 1:i64, %1
infer %5

; Function: properDivisorSum
;[ORIGIN]   %mul10 = mul i64 %add9, %prod.164
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
%4:i1 = eq 0:i64, %3
pc %4 0:i1
%5:i64 = var
%6:i64 = add 1:i64, %1
%7:i64 = mul %5, %6
infer %7

; Function: properDivisorSum
;[ORIGIN]   %add12 = add i64 %count.161, 2
%0:i64 = var
%1:i1 = ne 0:i64, %0
pc %1 1:i1
%2:i1 = ne 18446744073709551615:i64, %0
pc %2 1:i1
%3:i64 = add 2:i64, %0
infer %3

; Function: properDivisorSum
;[ORIGIN]   %cmp5.i49 = icmp eq i64 %add12, 0
%0:i64 = var
%1:i1 = ne 0:i64, %0
pc %1 1:i1
%2:i1 = ne 18446744073709551615:i64, %0
pc %2 1:i1
%3:i64 = add 2:i64, %0 (hasExternalUses)
%4:i1 = eq 0:i64, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %i.07.i51 = phi i64 [ %inc.i54, %.lr.ph.i50 ], [ 0, %.lr.ph.i50.preheader ]
%0:i64 = var (range=[0,-1))
infer %0

; Function: properDivisorSum
;[ORIGIN]   %result.06.i52 = phi i64 [ %mul.i53, %.lr.ph.i50 ], [ 1, %.lr.ph.i50.preheader ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %mul.i53 = mul i64 %result.06.i52, %i.066
%0:i64 = var
%1:i64 = var
%2:i64 = mul %0, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %inc.i54 = add nuw i64 %i.07.i51, 1
%0:i64 = var (range=[0,-1))
%1:i64 = addnuw 1:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %exitcond.i55 = icmp eq i64 %inc.i54, %add12
%0:i64 = var
%1:i64 = add 2:i64, %0 (hasExternalUses)
%2:i64 = var (range=[0,-1))
%3:i64 = addnuw 1:i64, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %result.0.lcssa.i56 = phi i64 [ 1, %3 ], [ %mul.i53, %.lr.ph.i50 ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %sub14 = add i64 %result.0.lcssa.i56, -1
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %sub15 = add i64 %i.066, -1
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %div16 = udiv i64 %sub14, %sub15
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
%2:i64 = var
%3:i64 = add 18446744073709551615:i64, %2
%4:i64 = udiv %1, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %mul17 = mul i64 %div16, %prod.164
%0:i64 = var
%1:i64 = var
%2:i64 = add 18446744073709551615:i64, %1
%3:i64 = var
%4:i64 = add 18446744073709551615:i64, %3
%5:i64 = udiv %2, %4
%6:i64 = mul %0, %5
infer %6

; Function: properDivisorSum
;[ORIGIN]   %n.addr.2.lcssa85 = phi i64 [ %div7, %2 ], [ %div7, %raiseTo.exit57 ], [ %div7, %._crit_edge ], [ %n.addr.165, %.lr.ph70 ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %prod.2 = phi i64 [ %mul10, %2 ], [ %mul17, %raiseTo.exit57 ], [ %prod.164, %._crit_edge ], [ %prod.164, %.lr.ph70 ]
%0:i64 = var
infer %0

; Function: properDivisorSum
;[ORIGIN]   %add18 = add i64 %i.066, 2
%0:i64 = var
%1:i64 = add 2:i64, %0
infer %1

; Function: properDivisorSum
;[ORIGIN]   %mul2 = mul i64 %add18, %add18
%0:i64 = var
%1:i64 = add 2:i64, %0 (hasExternalUses)
%2:i64 = mul %1, %1
infer %2

; Function: properDivisorSum
;[ORIGIN]   %cmp3 = icmp ugt i64 %mul2, %n.addr.2.lcssa85
%0:i64 = var
%1:i64 = var
%2:i64 = add 2:i64, %1 (hasExternalUses)
%3:i64 = mul %2, %2
%4:i1 = ult %0, %3
infer %4

; Function: properDivisorSum
;[ORIGIN]   %prod.1.lcssa = phi i64 [ %prod.0, %raiseTo.exit ], [ %prod.2, %._crit_edge.thread ]
%0 = block 2
%1 = block 4
%2:i64 = var (range=[-9223372036854775808,9223372036854775807))
%3:i64 = shl %2, 1:i64
%4:i64 = add 18446744073709551615:i64, %3
%5:i64 = phi %1, 1:i64, %4, 0:i64, 1:i64
%6:i64 = var
%7:i64 = phi %0, %5, %6
infer %7

; Function: properDivisorSum
;[ORIGIN]   %n.addr.1.lcssa = phi i64 [ %n.addr.0.lcssa84, %raiseTo.exit ], [ %n.addr.2.lcssa85, %._crit_edge.thread ]
%0 = block 2
%1 = block 4
%2:i64 = var
%3:i64 = lshr %2, 1:i64
%4:i64 = var
%5:i64 = phi %1, %3, %3, %3, %4
%6:i64 = var
%7:i64 = phi %0, %5, %6
infer %7

; Function: properDivisorSum
;[ORIGIN]   %cmp19 = icmp ugt i64 %n.addr.1.lcssa, 2
%0 = block 2
%1 = block 4
%2:i64 = var
%3:i64 = lshr %2, 1:i64
%4:i64 = var
%5:i64 = phi %1, %3, %3, %3, %4
%6:i64 = var
%7:i64 = phi %0, %5, %6
%8:i1 = ult 2:i64, %7
infer %8

; Function: properDivisorSum
;[ORIGIN]   %add20 = add i64 %n.addr.1.lcssa, 1
%0 = block 2
%1 = block 4
%2:i64 = var
%3:i64 = lshr %2, 1:i64
%4:i64 = var
%5:i64 = phi %1, %3, %3, %3, %4
%6:i64 = var
%7:i64 = phi %0, %5, %6
%8:i64 = add 1:i64, %7
infer %8

; Function: properDivisorSum
;[ORIGIN]   %mul21 = select i1 %cmp19, i64 %add20, i64 1
%0 = block 2
%1 = block 4
%2:i64 = var
%3:i64 = lshr %2, 1:i64
%4:i64 = var
%5:i64 = phi %1, %3, %3, %3, %4
%6:i64 = var
%7:i64 = phi %0, %5, %6
%8:i1 = ult 2:i64, %7
%9:i64 = add 1:i64, %7
%10:i64 = select %8, %9, 1:i64
infer %10

; Function: properDivisorSum
;[ORIGIN]   %prod.3 = mul i64 %mul21, %prod.1.lcssa
%0 = block 2
%1 = block 4
%2:i64 = var (range=[-9223372036854775808,9223372036854775807))
%3:i64 = shl %2, 1:i64
%4:i64 = add 18446744073709551615:i64, %3
%5:i64 = phi %1, 1:i64, %4, 0:i64, 1:i64
%6:i64 = var
%7:i64 = phi %0, %5, %6
%8:i64 = var
%9:i64 = lshr %8, 1:i64
%10:i64 = var
%11:i64 = phi %1, %9, %9, %9, %10
%12:i64 = var
%13:i64 = phi %0, %11, %12
%14:i1 = ult 2:i64, %13
%15:i64 = add 1:i64, %13
%16:i64 = select %14, %15, 1:i64
%17:i64 = mul %7, %16
infer %17

; Function: properDivisorSum
;[ORIGIN]   %sub22 = sub i64 %prod.3, %n
%0 = block 2
%1 = block 4
%2:i64 = var (range=[-9223372036854775808,9223372036854775807))
%3:i64 = shl %2, 1:i64
%4:i64 = add 18446744073709551615:i64, %3
%5:i64 = phi %1, 1:i64, %4, 0:i64, 1:i64
%6:i64 = var
%7:i64 = phi %0, %5, %6
%8:i64 = var
%9:i64 = lshr %8, 1:i64
%10:i64 = var
%11:i64 = phi %1, %9, %9, %9, %10
%12:i64 = var
%13:i64 = phi %0, %11, %12
%14:i1 = ult 2:i64, %13
%15:i64 = add 1:i64, %13
%16:i64 = select %14, %15, 1:i64
%17:i64 = mul %7, %16
%18:i64 = sub %17, %10
infer %18

; Function: printSeries
;[ORIGIN]   %1 = load i64, i64* %arr, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %sub = add nsw i32 %size, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: printSeries
;[ORIGIN]   %cmp9 = icmp sgt i32 %size, 1
%0:i32 = var
%1:i1 = slt 1:i32, %0
infer %1

; Function: printSeries
;[ORIGIN]   %2 = load i64, i64* %arr, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %3 = phi i64 [ %4, %.lr.ph ], [ %2, %.lr.ph.preheader ]
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %i.010 = phi i32 [ %inc, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: printSeries
;[ORIGIN]   %inc = add nuw nsw i32 %i.010, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: printSeries
;[ORIGIN]   %4 = load i64, i64* %arrayidx1, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: printSeries
;[ORIGIN]   %exitcond = icmp eq i32 %inc, %sub
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: printSeries
;[ORIGIN]   %.lcssa = phi i64 [ %2, %0 ], [ %4, %.lr.ph ]
%0 = block 2
%1:i64 = var
%2:i64 = var
%3:i64 = phi %0, %1, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %3 = phi i64 [ %n, %0 ], [ %sub22.i, %._crit_edge ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.0107 = phi i32 [ 1, %0 ], [ %inc36, %._crit_edge ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %rem74.i = and i64 %3, 1
%0:i64 = var
%1:i64 = and 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %cmp75.i = icmp eq i64 %rem74.i, 0
%0:i64 = var
%1:i64 = and 1:i64, %0
%2:i1 = eq 0:i64, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %count.077.i = phi i64 [ %inc.i, %.lr.ph79.i ], [ 0, %.lr.ph79.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %n.addr.076.i = phi i64 [ %div.i, %.lr.ph79.i ], [ %3, %.lr.ph79.i.preheader ]
%0:i64 = var
infer %0 (demandedBits=1111111111111111111111111111111111111111111111111111111111111110)

; Function: aliquotClassifier
;[ORIGIN]   %inc.i = add i64 %count.077.i, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %div.i = lshr i64 %n.addr.076.i, 1
%0:i64 = var
%1:i64 = lshr %0, 1:i64
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %rem.i = and i64 %n.addr.076.i, 2
%0:i64 = var
%1:i64 = and 2:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %cmp.i = icmp eq i64 %rem.i, 0
%0:i64 = var
%1:i64 = and 2:i64, %0
%2:i1 = eq 0:i64, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %cmp1.i = icmp eq i64 %inc.i, 0
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %add.i = add i64 %count.077.i, 2
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
pc %2 0:i1
%3:i64 = add 2:i64, %0
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %cmp5.i.i = icmp eq i64 %add.i, 0
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
pc %2 0:i1
%3:i64 = add 2:i64, %0 (hasExternalUses)
%4:i1 = eq 0:i64, %3
infer %4

; Function: aliquotClassifier
;[ORIGIN]   %i.07.i.i = phi i64 [ %inc.i.i, %.lr.ph.i.i ], [ 0, %.lr.ph.i.i.preheader ]
%0:i64 = var (range=[0,-1))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %result.06.i.i = phi i64 [ %mul.i.i, %.lr.ph.i.i ], [ 1, %.lr.ph.i.i.preheader ]
%0:i64 = var (range=[-9223372036854775808,9223372036854775807))
infer %0 (demandedBits=0111111111111111111111111111111111111111111111111111111111111111)

; Function: aliquotClassifier
;[ORIGIN]   %mul.i.i = shl i64 %result.06.i.i, 1
%0:i64 = var (range=[-9223372036854775808,9223372036854775807))
%1:i64 = shl %0, 1:i64
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %inc.i.i = add nuw i64 %i.07.i.i, 1
%0:i64 = var (range=[0,-1))
%1:i64 = addnuw 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i.i = icmp eq i64 %inc.i.i, %add.i
%0:i64 = var
%1:i64 = add 2:i64, %0 (hasExternalUses)
%2:i64 = var (range=[0,-1))
%3:i64 = addnuw 1:i64, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: aliquotClassifier
;[ORIGIN]   %phitmp.i = add i64 %mul.i.i, -1
%0:i64 = var (range=[-9223372036854775808,9223372036854775807))
%1:i64 = shl %0, 1:i64 (hasExternalUses)
%2:i64 = add 18446744073709551615:i64, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %n.addr.0.lcssa84.i = phi i64 [ %div.i, %._crit_edge80.i ], [ %div.i, %raiseTo.exit.loopexit.i ], [ %div.i, %4 ], [ %3, %2 ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %prod.0.i = phi i64 [ 1, %._crit_edge80.i ], [ %phitmp.i, %raiseTo.exit.loopexit.i ], [ 0, %4 ], [ 1, %2 ]
%0:i64 = var (range=[-1,-2))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %cmp363.i = icmp ult i64 %n.addr.0.lcssa84.i, 9
%0:i64 = var
%1:i1 = ult %0, 9:i64
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %i.066.i = phi i64 [ %add18.i, %._crit_edge.thread.i ], [ 3, %.lr.ph70.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %n.addr.165.i = phi i64 [ %n.addr.2.lcssa85.i, %._crit_edge.thread.i ], [ %n.addr.0.lcssa84.i, %.lr.ph70.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %prod.164.i = phi i64 [ %prod.2.i, %._crit_edge.thread.i ], [ %prod.0.i, %.lr.ph70.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %rem458.i = urem i64 %n.addr.165.i, %i.066.i
%0:i64 = var
%1:i64 = var
%2:i64 = urem %0, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %cmp559.i = icmp eq i64 %rem458.i, 0
%0:i64 = var
%1:i64 = var
%2:i64 = urem %0, %1
%3:i1 = eq 0:i64, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %count.161.i = phi i64 [ %inc6.i, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %n.addr.260.i = phi i64 [ %div7.i, %.lr.ph.i ], [ %n.addr.165.i, %.lr.ph.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %inc6.i = add i64 %count.161.i, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %div7.i = udiv i64 %n.addr.260.i, %i.066.i
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %rem4.i = urem i64 %div7.i, %i.066.i
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %cmp5.i = icmp eq i64 %rem4.i, 0
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
%4:i1 = eq 0:i64, %3
infer %4

; Function: aliquotClassifier
;[ORIGIN]   %add9.i = add i64 %i.066.i, 1
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
%4:i1 = eq 0:i64, %3
pc %4 0:i1
%5:i64 = add 1:i64, %1
infer %5

; Function: aliquotClassifier
;[ORIGIN]   %mul10.i = mul i64 %prod.164.i, %add9.i
%0:i64 = var
%1:i64 = var
%2:i64 = udiv %0, %1 (hasExternalUses)
%3:i64 = urem %2, %1
%4:i1 = eq 0:i64, %3
pc %4 0:i1
%5:i64 = var
%6:i64 = add 1:i64, %1
%7:i64 = mul %5, %6
infer %7

; Function: aliquotClassifier
;[ORIGIN]   %add12.i = add i64 %count.161.i, 2
%0:i64 = var
%1:i1 = ne 0:i64, %0
pc %1 1:i1
%2:i1 = ne 18446744073709551615:i64, %0
pc %2 1:i1
%3:i64 = add 2:i64, %0
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %cmp5.i49.i = icmp eq i64 %add12.i, 0
%0:i64 = var
%1:i1 = ne 0:i64, %0
pc %1 1:i1
%2:i1 = ne 18446744073709551615:i64, %0
pc %2 1:i1
%3:i64 = add 2:i64, %0 (hasExternalUses)
%4:i1 = eq 0:i64, %3
infer %4

; Function: aliquotClassifier
;[ORIGIN]   %i.07.i51.i = phi i64 [ %inc.i54.i, %.lr.ph.i50.i ], [ 0, %.lr.ph.i50.i.preheader ]
%0:i64 = var (range=[0,-1))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %result.06.i52.i = phi i64 [ %mul.i53.i, %.lr.ph.i50.i ], [ 1, %.lr.ph.i50.i.preheader ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %mul.i53.i = mul i64 %result.06.i52.i, %i.066.i
%0:i64 = var
%1:i64 = var
%2:i64 = mul %0, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %inc.i54.i = add nuw i64 %i.07.i51.i, 1
%0:i64 = var (range=[0,-1))
%1:i64 = addnuw 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i55.i = icmp eq i64 %inc.i54.i, %add12.i
%0:i64 = var
%1:i64 = add 2:i64, %0 (hasExternalUses)
%2:i64 = var (range=[0,-1))
%3:i64 = addnuw 1:i64, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: aliquotClassifier
;[ORIGIN]   %result.0.lcssa.i56.i = phi i64 [ 1, %6 ], [ %mul.i53.i, %.lr.ph.i50.i ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %sub14.i = add i64 %result.0.lcssa.i56.i, -1
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %sub15.i = add i64 %i.066.i, -1
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %div16.i = udiv i64 %sub14.i, %sub15.i
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
%2:i64 = var
%3:i64 = add 18446744073709551615:i64, %2
%4:i64 = udiv %1, %3
infer %4

; Function: aliquotClassifier
;[ORIGIN]   %mul17.i = mul i64 %div16.i, %prod.164.i
%0:i64 = var
%1:i64 = var
%2:i64 = add 18446744073709551615:i64, %1
%3:i64 = var
%4:i64 = add 18446744073709551615:i64, %3
%5:i64 = udiv %2, %4
%6:i64 = mul %0, %5
infer %6

; Function: aliquotClassifier
;[ORIGIN]   %n.addr.2.lcssa85.i = phi i64 [ %div7.i, %5 ], [ %div7.i, %raiseTo.exit57.i ], [ %div7.i, %._crit_edge.i ], [ %n.addr.165.i, %.lr.ph70.i ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %prod.2.i = phi i64 [ %mul10.i, %5 ], [ %mul17.i, %raiseTo.exit57.i ], [ %prod.164.i, %._crit_edge.i ], [ %prod.164.i, %.lr.ph70.i ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %add18.i = add i64 %i.066.i, 2
%0:i64 = var
%1:i64 = add 2:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %mul2.i = mul i64 %add18.i, %add18.i
%0:i64 = var
%1:i64 = add 2:i64, %0 (hasExternalUses)
%2:i64 = mul %1, %1
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %cmp3.i = icmp ugt i64 %mul2.i, %n.addr.2.lcssa85.i
%0:i64 = var
%1:i64 = var
%2:i64 = add 2:i64, %1 (hasExternalUses)
%3:i64 = mul %2, %2
%4:i1 = ult %0, %3
infer %4

; Function: aliquotClassifier
;[ORIGIN]   %prod.1.lcssa.i = phi i64 [ %prod.0.i, %raiseTo.exit.i ], [ %prod.2.i, %._crit_edge.thread.i ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %n.addr.1.lcssa.i = phi i64 [ %n.addr.0.lcssa84.i, %raiseTo.exit.i ], [ %n.addr.2.lcssa85.i, %._crit_edge.thread.i ]
%0:i64 = var (range=[0,-1))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %cmp19.i = icmp ugt i64 %n.addr.1.lcssa.i, 2
%0:i64 = var (range=[0,-1))
%1:i1 = ult 2:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %add20.i = add i64 %n.addr.1.lcssa.i, 1
%0:i64 = var (range=[0,-1))
%1:i64 = add 1:i64, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %mul21.i = select i1 %cmp19.i, i64 %add20.i, i64 1
%0:i64 = var (range=[0,-1))
%1:i1 = ult 2:i64, %0
%2:i64 = add 1:i64, %0
%3:i64 = select %1, %2, 1:i64
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %prod.3.i = mul i64 %mul21.i, %prod.1.lcssa.i
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
infer %5

; Function: aliquotClassifier
;[ORIGIN]   %sub22.i = sub i64 %prod.3.i, %3
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6
infer %7

; Function: aliquotClassifier
;[ORIGIN]   %cmp4 = icmp eq i64 %sub22.i, 0
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7
infer %8

; Function: aliquotClassifier
;[ORIGIN]   %cmp6 = icmp eq i64 %sub22.i, %n
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,-1))
%3:i1 = ult 2:i64, %2
%4:i64 = add 1:i64, %2
%5:i64 = select %3, %4, 1:i64
%6:i64 = mul %1, %5
%7:i64 = var
%8:i64 = sub %6, %7 (hasExternalUses)
%9:i1 = eq %0, %8
infer %9

; Function: aliquotClassifier
;[ORIGIN]   %or.cond70 = or i1 %cmp4, %cmp6
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7 (hasExternalUses)
%9:i64 = var
%10:i1 = eq %9, %7 (hasExternalUses)
%11:i1 = or %8, %10
infer %11

; Function: aliquotClassifier
;[ORIGIN]   %or.cond70.not = xor i1 %or.cond70, true
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7 (hasExternalUses)
%9:i64 = var
%10:i1 = eq %9, %7 (hasExternalUses)
%11:i1 = or %8, %10
%12:i1 = xor 1:i1, %11
infer %12

; Function: aliquotClassifier
;[ORIGIN]   %cmp10 = icmp ne i64 %sub22.i, %3
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,-1))
%3:i1 = ult 2:i64, %2
%4:i64 = add 1:i64, %2
%5:i64 = select %3, %4, 1:i64
%6:i64 = mul %1, %5
%7:i64 = sub %6, %0 (hasExternalUses)
%8:i1 = ne %0, %7
infer %8

; Function: aliquotClassifier
;[ORIGIN]   %or.cond95 = and i1 %cmp10, %or.cond70.not
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7 (hasExternalUses)
%9:i64 = var
%10:i1 = eq %9, %7 (hasExternalUses)
%11:i1 = or %8, %10
%12:i1 = xor 1:i1, %11
%13:i1 = ne %6, %7
%14:i1 = and %12, %13
infer %14

; Function: aliquotClassifier
;[ORIGIN]   %cmp17 = icmp eq i32 %i.0107, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i1 = eq 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %or.cond = and i1 %cmp17, %cmp6
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7 (hasExternalUses)
%9:i64 = var
%10:i1 = eq %9, %7 (hasExternalUses)
%11:i1 = or %8, %10
%12:i1 = xor 1:i1, %11
%13:i1 = ne %6, %7
%14:i1 = and %12, %13
pc %14 0:i1
pc %8 0:i1
%15:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%16:i1 = eq 1:i32, %15
%17:i1 = and %16, %10
infer %17

; Function: aliquotClassifier
;[ORIGIN]   %cmp20 = icmp eq i32 %i.0107, 2
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7 (hasExternalUses)
%9:i64 = var
%10:i1 = eq %9, %7 (hasExternalUses)
%11:i1 = or %8, %10
%12:i1 = xor 1:i1, %11
%13:i1 = ne %6, %7
%14:i1 = and %12, %13
pc %14 0:i1
pc %8 0:i1
%15:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%16:i1 = eq 1:i32, %15
%17:i1 = and %16, %10
pc %17 0:i1
%18:i1 = eq 2:i32, %15
infer %18

; Function: aliquotClassifier
;[ORIGIN]   %or.cond39 = and i1 %cmp20, %cmp6
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7 (hasExternalUses)
%9:i64 = var
%10:i1 = eq %9, %7 (hasExternalUses)
%11:i1 = or %8, %10
%12:i1 = xor 1:i1, %11
%13:i1 = ne %6, %7
%14:i1 = and %12, %13
pc %14 0:i1
pc %8 0:i1
%15:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%16:i1 = eq 1:i32, %15
%17:i1 = and %16, %10
pc %17 0:i1
%18:i1 = eq 2:i32, %15
%19:i1 = and %18, %10
infer %19

; Function: aliquotClassifier
;[ORIGIN]   %cmp24 = icmp eq i64 %sub22.i, %3
%0:i64 = var
%1:i64 = var (range=[0,-1))
%2:i1 = ult 2:i64, %1
%3:i64 = add 1:i64, %1
%4:i64 = select %2, %3, 1:i64
%5:i64 = mul %0, %4
%6:i64 = var
%7:i64 = sub %5, %6 (hasExternalUses)
%8:i1 = eq 0:i64, %7 (hasExternalUses)
%9:i64 = var
%10:i1 = eq %9, %7 (hasExternalUses)
%11:i1 = or %8, %10
%12:i1 = xor 1:i1, %11
%13:i1 = ne %6, %7
%14:i1 = and %12, %13
pc %14 0:i1
pc %8 0:i1
%15:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%16:i1 = eq 1:i32, %15
%17:i1 = and %16, %10
pc %17 0:i1
%18:i1 = eq 2:i32, %15
%19:i1 = and %18, %10
pc %19 0:i1
%20:i1 = eq %6, %7
infer %20

; Function: aliquotClassifier
;[ORIGIN]   %13 = load i64, i64* %arrayidx, align 16, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %15 = phi i64 [ %13, %12 ], [ %16, %14 ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.010.i77 = phi i32 [ 0, %12 ], [ %inc.i79, %14 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %inc.i79 = add nuw nsw i32 %i.010.i77, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %16 = load i64, i64* %arrayidx1.i80, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i81 = icmp eq i32 %inc.i79, %i.0107
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %cmp30105 = icmp ugt i32 %i.0107, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i1 = ult 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %cmp30 = icmp ult i32 %inc, %i.0107
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,15))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%3:i1 = ult %1, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %j.0106 = phi i32 [ %inc, %18 ], [ 1, %.lr.ph.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,15))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %19 = load i64, i64* %arrayidx31, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %cmp33 = icmp eq i64 %19, %sub22.i
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,-1))
%3:i1 = ult 2:i64, %2
%4:i64 = add 1:i64, %2
%5:i64 = select %3, %4, 1:i64
%6:i64 = mul %1, %5
%7:i64 = var
%8:i64 = sub %6, %7 (hasExternalUses)
%9:i1 = eq %0, %8
infer %9

; Function: aliquotClassifier
;[ORIGIN]   %inc = add nuw nsw i32 %j.0106, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,15))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %21 = load i64, i64* %arrayidx, align 16, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %23 = phi i64 [ %21, %20 ], [ %24, %22 ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.010.i87 = phi i32 [ 0, %20 ], [ %inc.i89, %22 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %inc.i89 = add nuw nsw i32 %i.010.i87, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %24 = load i64, i64* %arrayidx1.i90, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i91 = icmp eq i32 %inc.i89, %i.0107
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,15))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: aliquotClassifier
;[ORIGIN]   %inc36 = add nuw nsw i32 %i.0107, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %cmp = icmp ult i32 %inc36, 16
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = ult %1, 16:i32
infer %2

; Function: aliquotClassifier
;[ORIGIN]   %26 = load i64, i64* %arrayidx, align 16, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %28 = phi i64 [ %26, %25 ], [ %29, %27 ]
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %i.010.i = phi i32 [ 0, %25 ], [ %inc.i73, %27 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,16))
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %inc.i73 = add nuw nsw i32 %i.010.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,16))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: aliquotClassifier
;[ORIGIN]   %29 = load i64, i64* %arrayidx1.i, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: aliquotClassifier
;[ORIGIN]   %exitcond.i = icmp eq i32 %inc.i73, %inc36
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,16))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,16))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: processFile
;[ORIGIN]   %cmp8 = icmp eq i8* %call17, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: processFile
;[ORIGIN]   %call3 = call i64 @strtoull(i8* nocapture nonnull %1, i8** null, i32 10)
%0:i64 = var
infer %0

; Function: processFile
;[ORIGIN]   %cmp = icmp eq i8* %call1, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp = icmp eq i32 %argC, 2
%0:i32 = var
%1:i1 = eq 2:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp3 = icmp eq i8* %call2, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp8.i = icmp eq i8* %call17.i, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %call3.i = call i64 @strtoull(i8* nocapture nonnull %6, i8** null, i32 10) #5
%0:i64 = var
infer %0

; Function: main
;[ORIGIN]   %cmp.i = icmp eq i8* %call1.i, null
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %call6 = tail call i64 @strtoull(i8* nocapture %4, i8** null, i32 10)
%0:i64 = var
infer %0
```
**benchmark4pipeline_c/babbage_problem.2.bc**
```


; Function: main
;[ORIGIN]   %current.0 = phi i32 [ 0, %0 ], [ %inc, %1 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %mul = mul nsw i32 %current.0, %current.0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
infer %1

; Function: main
;[ORIGIN]   %rem = urem i32 %mul, 1000000
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
infer %2

; Function: main
;[ORIGIN]   %cmp = icmp ne i32 %rem, 269696
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
infer %3

; Function: main
;[ORIGIN]   %cmp1 = icmp ne i32 %mul, 2147483647
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i1 = ne 2147483647:i32, %1
infer %2

; Function: main
;[ORIGIN]   %2 = and i1 %cmp1, %cmp
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
%4:i1 = ne 2147483647:i32, %1
%5:i1 = and %3, %4
infer %5

; Function: main
;[ORIGIN]   %inc = add nuw nsw i32 %current.0, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1
```
**benchmark4pipeline_c/babbage_problem.bc**
```


; Function: main
;[ORIGIN]   %current.0 = phi i32 [ 0, %0 ], [ %inc, %1 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %mul = mul nsw i32 %current.0, %current.0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
infer %1

; Function: main
;[ORIGIN]   %rem = urem i32 %mul, 1000000
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
infer %2

; Function: main
;[ORIGIN]   %cmp = icmp ne i32 %rem, 269696
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
infer %3

; Function: main
;[ORIGIN]   %cmp1 = icmp ne i32 %mul, 2147483647
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0 (hasExternalUses)
%2:i1 = ne 2147483647:i32, %1
infer %2

; Function: main
;[ORIGIN]   %2 = and i1 %cmp1, %cmp
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = mulnsw %0, %0
%2:i32 = urem %1, 1000000:i32
%3:i1 = ne 269696:i32, %2
%4:i1 = ne 2147483647:i32, %1
%5:i1 = and %3, %4
infer %5

; Function: main
;[ORIGIN]   %inc = add nuw nsw i32 %current.0, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1
```
**benchmark4pipeline_c/bitwise_IO.bc**
```


; Function: b_write
;[ORIGIN]   %1 = load i32, i32* %accu1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %2 = load i32, i32* %bits2, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %tobool61 = icmp ne i32 %n_bits, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %cmp62 = icmp sgt i32 %2, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %3 = or i1 %tobool61, %cmp62
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = or %1, %3
infer %4

; Function: b_write
;[ORIGIN]   %rem = and i32 %shift, 7
%0:i32 = var
%1:i32 = and 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %div = lshr i32 %shift, 3
%0:i32 = var
%1:i32 = lshr %0, 3:i32
infer %1

; Function: b_write
;[ORIGIN]   %bits.067 = phi i32 [ %2, %.lr.ph69 ], [ %bits.2.lcssa, %._crit_edge55 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %accu.066 = phi i32 [ %1, %.lr.ph69 ], [ %accu.2.lcssa, %._crit_edge55 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %shift.addr.064 = phi i32 [ %rem, %.lr.ph69 ], [ %shift.addr.1.lcssa, %._crit_edge55 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %n_bits.addr.063 = phi i32 [ %n_bits, %.lr.ph69 ], [ %n_bits.addr.1.lcssa, %._crit_edge55 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %cmp342 = icmp sgt i32 %bits.067, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %5 = add i32 %bits.067, 8
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = add 8:i32, %0
infer %2

; Function: b_write
;[ORIGIN]   %6 = xor i32 %bits.067, -1
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = xor 4294967295:i32, %0
infer %2

; Function: b_write
;[ORIGIN]   %7 = icmp sgt i32 %6, -16
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = xor 4294967295:i32, %0 (hasExternalUses)
%3:i1 = slt 4294967280:i32, %2
infer %3

; Function: b_write
;[ORIGIN]   %smax = select i1 %7, i32 %6, i32 -16
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = xor 4294967295:i32, %0
%3:i1 = slt 4294967280:i32, %2
%4:i32 = select %3, %2, 4294967280:i32
infer %4

; Function: b_write
;[ORIGIN]   %8 = add i32 %5, %smax
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = add 8:i32, %0
%3:i32 = xor 4294967295:i32, %0
%4:i1 = slt 4294967280:i32, %3
%5:i32 = select %4, %3, 4294967280:i32
%6:i32 = add %2, %5
infer %6 (demandedBits=11111111111111111111111111111000)

; Function: b_write
;[ORIGIN]   %9 = and i32 %8, -8
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = add 8:i32, %0
%3:i32 = xor 4294967295:i32, %0
%4:i1 = slt 4294967280:i32, %3
%5:i32 = select %4, %3, 4294967280:i32
%6:i32 = add %2, %5
%7:i32 = and 4294967288:i32, %6
infer %7

; Function: b_write
;[ORIGIN]   %bits.144 = phi i32 [ %bits.067, %.lr.ph ], [ %sub, %10 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %accu.143 = phi i32 [ %accu.066, %.lr.ph ], [ %and, %10 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %sub = add nsw i32 %bits.144, -8
%0:i32 = var
%1:i32 = addnsw 4294967288:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %shr = lshr i32 %accu.143, %sub
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = lshr %0, %2
infer %3

; Function: b_write
;[ORIGIN]   %shl = shl i32 1, %sub
%0:i32 = var
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
infer %2

; Function: b_write
;[ORIGIN]   %sub4 = add nsw i32 %shl, -1
%0:i32 = var
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
%3:i32 = addnsw 4294967295:i32, %2
infer %3

; Function: b_write
;[ORIGIN]   %and = and i32 %sub4, %accu.143
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = addnsw 4294967295:i32, %3
%5:i32 = and %0, %4
infer %5

; Function: b_write
;[ORIGIN]   %cmp3 = icmp sgt i32 %bits.144, 15
%0:i32 = var
%1:i1 = slt 15:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %12 = add i32 %bits.067, -8
%0:i32 = var
%1:i32 = add 4294967288:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %13 = sub i32 %12, %9
%0:i32 = var
%1:i32 = add 4294967288:i32, %0
%2:i32 = add 8:i32, %0
%3:i32 = xor 4294967295:i32, %0
%4:i1 = slt 4294967280:i32, %3
%5:i32 = select %4, %3, 4294967280:i32
%6:i32 = add %2, %5
%7:i32 = and 4294967288:i32, %6
%8:i32 = sub %1, %7
infer %8

; Function: b_write
;[ORIGIN]   %accu.1.lcssa = phi i32 [ %accu.066, %4 ], [ %and, %._crit_edge.loopexit ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %bits.1.lcssa = phi i32 [ %bits.067, %4 ], [ %13, %._crit_edge.loopexit ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %cmp546 = icmp slt i32 %bits.1.lcssa, 8
%0:i32 = var
%1:i1 = slt %0, 8:i32
infer %1

; Function: b_write
;[ORIGIN]   %tobool647 = icmp ne i32 %n_bits.addr.063, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %14 = and i1 %tobool647, %cmp546
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt %2, 8:i32
%4:i1 = and %1, %3
infer %4

; Function: b_write
;[ORIGIN]   %bits.252 = phi i32 [ %inc, %.lr.ph54 ], [ %bits.1.lcssa, %.lr.ph54.preheader ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %accu.251 = phi i32 [ %or, %.lr.ph54 ], [ %accu.1.lcssa, %.lr.ph54.preheader ]
%0:i32 = var
infer %0 (demandedBits=01111111111111111111111111111111)

; Function: b_write
;[ORIGIN]   %shift.addr.149 = phi i32 [ %spec.select, %.lr.ph54 ], [ %shift.addr.064, %.lr.ph54.preheader ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %n_bits.addr.148 = phi i32 [ %dec, %.lr.ph54 ], [ %n_bits.addr.063, %.lr.ph54.preheader ]
%0:i32 = var (range=[1,0))
infer %0

; Function: b_write
;[ORIGIN]   %shl7 = shl i32 %accu.251, 1
%0:i32 = var
%1:i32 = shl %0, 1:i32
infer %1

; Function: b_write
;[ORIGIN]   %shr8 = lshr i32 128, %shift.addr.149
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_write
;[ORIGIN]   %15 = load i8, i8* %buf.addr.150, align 1, !tbaa !10
%0:i8 = var
infer %0

; Function: b_write
;[ORIGIN]   %conv = zext i8 %15 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: b_write
;[ORIGIN]   %and9 = and i32 %shr8, %conv
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
infer %4

; Function: b_write
;[ORIGIN]   %sub10 = sub i32 7, %shift.addr.149
%0:i32 = var
%1:i32 = sub 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %shr11 = lshr i32 %and9, %sub10
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
%5:i32 = sub 7:i32, %0
%6:i32 = lshr %4, %5
infer %6

; Function: b_write
;[ORIGIN]   %or = or i32 %shr11, %shl7
%0:i32 = var
%1:i32 = shl %0, 1:i32
%2:i32 = var
%3:i32 = lshr 128:i32, %2
%4:i8 = var
%5:i32 = zext %4
%6:i32 = and %3, %5
%7:i32 = sub 7:i32, %2
%8:i32 = lshr %6, %7
%9:i32 = or %1, %8
infer %9

; Function: b_write
;[ORIGIN]   %dec = add i32 %n_bits.addr.148, -1
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %inc = add nsw i32 %bits.252, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %inc12 = add i32 %shift.addr.149, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %cmp13 = icmp eq i32 %inc12, 8
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = eq 8:i32, %1
infer %2

; Function: b_write
;[ORIGIN]   %spec.select = select i1 %cmp13, i32 0, i32 %inc12
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = eq 8:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: b_write
;[ORIGIN]   %cmp5 = icmp slt i32 %bits.252, 7
%0:i32 = var
%1:i1 = slt %0, 7:i32
infer %1

; Function: b_write
;[ORIGIN]   %tobool6 = icmp ne i32 %dec, 0
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: b_write
;[ORIGIN]   %16 = and i1 %tobool6, %cmp5
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
%3:i32 = var
%4:i1 = slt %3, 7:i32
%5:i1 = and %2, %4
infer %5

; Function: b_write
;[ORIGIN]   %n_bits.addr.1.lcssa = phi i32 [ %n_bits.addr.063, %._crit_edge ], [ %dec, %.lr.ph54 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %shift.addr.1.lcssa = phi i32 [ %shift.addr.064, %._crit_edge ], [ %spec.select, %.lr.ph54 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %accu.2.lcssa = phi i32 [ %accu.1.lcssa, %._crit_edge ], [ %or, %.lr.ph54 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %bits.2.lcssa = phi i32 [ %bits.1.lcssa, %._crit_edge ], [ %inc, %.lr.ph54 ]
%0:i32 = var
infer %0

; Function: b_write
;[ORIGIN]   %tobool = icmp ne i32 %n_bits.addr.1.lcssa, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %cmp = icmp sgt i32 %bits.2.lcssa, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: b_write
;[ORIGIN]   %17 = or i1 %tobool, %cmp
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = or %1, %3
infer %4

; Function: b_write
;[ORIGIN]   %accu.0.lcssa = phi i32 [ %1, %0 ], [ %accu.2.lcssa, %._crit_edge55 ]
%0 = block 2
%1:i32 = var
%2:i32 = var
%3:i32 = phi %0, %1, %2
infer %3

; Function: b_write
;[ORIGIN]   %bits.0.lcssa = phi i32 [ %2, %0 ], [ %bits.2.lcssa, %._crit_edge55 ]
%0 = block 2
%1:i32 = var
%2:i32 = var
%3:i32 = phi %0, %1, %2
infer %3

; Function: b_read
;[ORIGIN]   %1 = load i32, i32* %accu1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %2 = load i32, i32* %bits2, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %tobool51 = icmp eq i32 %n_bits, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %rem = and i32 %shift, 7
%0:i32 = var
%1:i32 = and 7:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %div = lshr i32 %shift, 3
%0:i32 = var
%1:i32 = lshr %0, 3:i32
infer %1

; Function: b_read
;[ORIGIN]   %n_bits.addr.055 = phi i32 [ %n_bits, %.lr.ph58 ], [ %n_bits.addr.1.lcssa, %11 ]
%0:i32 = var (range=[1,0))
infer %0

; Function: b_read
;[ORIGIN]   %bits.054 = phi i32 [ %2, %.lr.ph58 ], [ %add, %11 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %accu.053 = phi i32 [ %1, %.lr.ph58 ], [ %or14, %11 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %shift.addr.052 = phi i32 [ %rem, %.lr.ph58 ], [ %shift.addr.1.lcssa, %11 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %tobool341 = icmp ne i32 %bits.054, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %tobool442 = icmp ne i32 %n_bits.addr.055, 0
%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %4 = and i1 %tobool341, %tobool442
%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = ne 0:i32, %2
%4:i1 = and %1, %3
infer %4

; Function: b_read
;[ORIGIN]   %n_bits.addr.145 = phi i32 [ %dec, %9 ], [ %n_bits.addr.055, %.lr.ph.preheader ]
%0:i32 = var (range=[1,0))
infer %0

; Function: b_read
;[ORIGIN]   %bits.144 = phi i32 [ %sub, %9 ], [ %bits.054, %.lr.ph.preheader ]
%0:i32 = var (range=[1,0))
infer %0

; Function: b_read
;[ORIGIN]   %shift.addr.143 = phi i32 [ %spec.select, %9 ], [ %shift.addr.052, %.lr.ph.preheader ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %sub = add nsw i32 %bits.144, -1
%0:i32 = var (range=[1,0))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %shl = shl i32 1, %sub
%0:i32 = var (range=[1,0))
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %and = and i32 %shl, %accu.053
%0:i32 = var
%1:i32 = var (range=[1,0))
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
infer %4

; Function: b_read
;[ORIGIN]   %tobool5 = icmp eq i32 %and, 0
%0:i32 = var
%1:i32 = var (range=[1,0))
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
%5:i1 = eq 0:i32, %4
infer %5

; Function: b_read
;[ORIGIN]   %shr = lshr i32 128, %shift.addr.143
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %6 = load i8, i8* %buf.addr.146, align 1, !tbaa !9
%0:i8 = var
infer %0

; Function: b_read
;[ORIGIN]   %conv = zext i8 %6 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %or = or i32 %shr, %conv
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = or %1, %3
infer %4 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %neg = ashr i32 -129, %shift.addr.143
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %8 = load i8, i8* %buf.addr.146, align 1, !tbaa !9
%0:i8 = var
infer %0

; Function: b_read
;[ORIGIN]   %conv7 = zext i8 %8 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %and8 = and i32 %neg, %conv7
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
infer %4 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %storemerge.in = phi i32 [ %and8, %7 ], [ %or, %5 ]
%0:i32 = var
infer %0 (demandedBits=00000000000000000000000011111111)

; Function: b_read
;[ORIGIN]   %storemerge = trunc i32 %storemerge.in to i8
%0:i32 = var
%1:i8 = trunc %0
infer %1

; Function: b_read
;[ORIGIN]   %dec = add i32 %n_bits.addr.145, -1
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %inc = add i32 %shift.addr.143, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %cmp = icmp ugt i32 %inc, 7
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = ult 7:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %spec.select = select i1 %cmp, i32 0, i32 %inc
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = ult 7:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: b_read
;[ORIGIN]   %tobool3 = icmp ne i32 %sub, 0
%0:i32 = var (range=[1,0))
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %tobool4 = icmp ne i32 %dec, 0
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: b_read
;[ORIGIN]   %10 = and i1 %tobool3, %tobool4
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1 (hasExternalUses)
%3:i32 = var (range=[1,0))
%4:i32 = addnsw 4294967295:i32, %3 (hasExternalUses)
%5:i1 = ne 0:i32, %4
%6:i1 = and %2, %5
infer %6

; Function: b_read
;[ORIGIN]   %shift.addr.1.lcssa = phi i32 [ %shift.addr.052, %3 ], [ %spec.select, %9 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %bits.1.lcssa = phi i32 [ %bits.054, %3 ], [ %sub, %9 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %n_bits.addr.1.lcssa = phi i32 [ %n_bits.addr.055, %3 ], [ %dec, %9 ]
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %tobool4.lcssa = phi i1 [ %tobool442, %3 ], [ %tobool4, %9 ]
%0:i1 = var
infer %0

; Function: b_read
;[ORIGIN]   %shl13 = shl i32 %accu.053, 8
%0:i32 = var
%1:i32 = shl %0, 8:i32
infer %1

; Function: b_read
;[ORIGIN]   %call = tail call i32 @fgetc(%struct._IO_FILE* %12)
%0:i32 = var
infer %0

; Function: b_read
;[ORIGIN]   %or14 = or i32 %call, %shl13
%0:i32 = var
%1:i32 = var
%2:i32 = shl %1, 8:i32
%3:i32 = or %0, %2
infer %3

; Function: b_read
;[ORIGIN]   %add = add nsw i32 %bits.1.lcssa, 8
%0:i32 = var
%1:i32 = addnsw 8:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %tobool = icmp eq i32 %n_bits.addr.1.lcssa, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_read
;[ORIGIN]   %accu.0.lcssa = phi i32 [ %1, %0 ], [ %or14, %11 ], [ %accu.053, %._crit_edge ]
%0 = block 3
%1:i32 = var
%2:i32 = var
%3:i32 = var
%4:i32 = shl %3, 8:i32
%5:i32 = or %2, %4 (hasExternalUses)
%6:i32 = phi %0, %1, %5, %3
infer %6

; Function: b_read
;[ORIGIN]   %bits.2 = phi i32 [ %2, %0 ], [ %add, %11 ], [ %bits.1.lcssa, %._crit_edge ]
%0 = block 3
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 8:i32, %2 (hasExternalUses)
%4:i32 = phi %0, %1, %3, %2
infer %4

; Function: b_detach
;[ORIGIN]   %1 = load i32, i32* %bits, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: b_detach
;[ORIGIN]   %tobool = icmp eq i32 %1, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: b_detach
;[ORIGIN]   %sub = sub nsw i32 8, %1
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = subnsw 8:i32, %0
infer %2

; Function: b_detach
;[ORIGIN]   %3 = load i32, i32* %accu, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: b_detach
;[ORIGIN]   %shl = shl i32 %3, %sub
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = var
%3:i32 = subnsw 8:i32, %0
%4:i32 = shl %2, %3
infer %4

; Function: main
;[ORIGIN]   %6 = phi i32 [ 0, %0 ], [ %21, %b_write.exit ]
%0:i32 = var (range=[-2147483648,8))
infer %0

; Function: main
;[ORIGIN]   %7 = phi i32 [ 0, %0 ], [ %20, %b_write.exit ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %i.072 = phi i32 [ 0, %0 ], [ %inc, %b_write.exit ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
infer %0

; Function: main
;[ORIGIN]   %bits.067.i = phi i32 [ %6, %5 ], [ %21, %._crit_edge55.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %accu.066.i = phi i32 [ %7, %5 ], [ %20, %._crit_edge55.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shift.addr.064.i = phi i32 [ 1, %5 ], [ %shift.addr.1.lcssa.i, %._crit_edge55.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.063.i = phi i32 [ 7, %5 ], [ %n_bits.addr.1.lcssa.i, %._crit_edge55.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp342.i = icmp sgt i32 %bits.067.i, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: main
;[ORIGIN]   %9 = add i32 %bits.067.i, 8
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = add 8:i32, %0
infer %2

; Function: main
;[ORIGIN]   %10 = xor i32 %bits.067.i, -1
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = xor 4294967295:i32, %0
infer %2

; Function: main
;[ORIGIN]   %11 = icmp sgt i32 %10, -16
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = xor 4294967295:i32, %0 (hasExternalUses)
%3:i1 = slt 4294967280:i32, %2
infer %3

; Function: main
;[ORIGIN]   %smax.i = select i1 %11, i32 %10, i32 -16
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = xor 4294967295:i32, %0
%3:i1 = slt 4294967280:i32, %2
%4:i32 = select %3, %2, 4294967280:i32
infer %4

; Function: main
;[ORIGIN]   %12 = add i32 %9, %smax.i
%0:i32 = var
%1:i1 = slt 7:i32, %0
pc %1 1:i1
%2:i32 = add 8:i32, %0
%3:i32 = xor 4294967295:i32, %0
%4:i1 = slt 4294967280:i32, %3
%5:i32 = select %4, %3, 4294967280:i32
%6:i32 = add %2, %5
infer %6 (demandedBits=11111111111111111111111111111000)

; Function: main
;[ORIGIN]   %bits.144.i = phi i32 [ %bits.067.i, %.lr.ph.i ], [ %sub.i, %13 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %accu.143.i = phi i32 [ %accu.066.i, %.lr.ph.i ], [ %and.i, %13 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %sub.i = add nsw i32 %bits.144.i, -8
%0:i32 = var
%1:i32 = addnsw 4294967288:i32, %0
infer %1

; Function: main
;[ORIGIN]   %shr.i = lshr i32 %accu.143.i, %sub.i
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = lshr %0, %2
infer %3

; Function: main
;[ORIGIN]   %shl.i = shl i32 1, %sub.i
%0:i32 = var
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
infer %2

; Function: main
;[ORIGIN]   %sub4.i = add nsw i32 %shl.i, -1
%0:i32 = var
%1:i32 = addnsw 4294967288:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
%3:i32 = addnsw 4294967295:i32, %2
infer %3

; Function: main
;[ORIGIN]   %and.i = and i32 %sub4.i, %accu.143.i
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 4294967288:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = addnsw 4294967295:i32, %3
%5:i32 = and %0, %4
infer %5

; Function: main
;[ORIGIN]   %cmp3.i = icmp sgt i32 %bits.144.i, 15
%0:i32 = var
%1:i1 = slt 15:i32, %0
infer %1

; Function: main
;[ORIGIN]   %14 = and i32 %12, -8
%0:i32 = var
%1:i32 = add 8:i32, %0
%2:i32 = xor 4294967295:i32, %0
%3:i1 = slt 4294967280:i32, %2
%4:i32 = select %3, %2, 4294967280:i32
%5:i32 = add %1, %4
%6:i32 = and 4294967288:i32, %5
infer %6

; Function: main
;[ORIGIN]   %15 = add i32 %bits.067.i, -8
%0:i32 = var
%1:i32 = add 4294967288:i32, %0
infer %1

; Function: main
;[ORIGIN]   %16 = sub i32 %15, %14
%0:i32 = var
%1:i32 = add 4294967288:i32, %0
%2:i32 = add 8:i32, %0
%3:i32 = xor 4294967295:i32, %0
%4:i1 = slt 4294967280:i32, %3
%5:i32 = select %4, %3, 4294967280:i32
%6:i32 = add %2, %5
%7:i32 = and 4294967288:i32, %6
%8:i32 = sub %1, %7
infer %8

; Function: main
;[ORIGIN]   %accu.1.lcssa.i = phi i32 [ %accu.066.i, %8 ], [ %and.i, %._crit_edge.loopexit.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %bits.1.lcssa.i = phi i32 [ %bits.067.i, %8 ], [ %16, %._crit_edge.loopexit.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp546.i = icmp slt i32 %bits.1.lcssa.i, 8
%0:i32 = var
%1:i1 = slt %0, 8:i32
infer %1

; Function: main
;[ORIGIN]   %tobool647.i = icmp ne i32 %n_bits.addr.063.i, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %17 = and i1 %tobool647.i, %cmp546.i
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt %2, 8:i32
%4:i1 = and %1, %3
infer %4

; Function: main
;[ORIGIN]   %bits.252.i = phi i32 [ %inc.i, %.lr.ph54.i ], [ %bits.1.lcssa.i, %.lr.ph54.i.preheader ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %accu.251.i = phi i32 [ %or.i, %.lr.ph54.i ], [ %accu.1.lcssa.i, %.lr.ph54.i.preheader ]
%0:i32 = var
infer %0 (demandedBits=01111111111111111111111111111111)

; Function: main
;[ORIGIN]   %shift.addr.149.i = phi i32 [ %spec.select.i, %.lr.ph54.i ], [ %shift.addr.064.i, %.lr.ph54.i.preheader ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.148.i = phi i32 [ %dec.i, %.lr.ph54.i ], [ %n_bits.addr.063.i, %.lr.ph54.i.preheader ]
%0:i32 = var (range=[1,0))
infer %0

; Function: main
;[ORIGIN]   %shl7.i = shl i32 %accu.251.i, 1
%0:i32 = var
%1:i32 = shl %0, 1:i32
infer %1

; Function: main
;[ORIGIN]   %shr8.i = lshr i32 128, %shift.addr.149.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %18 = load i8, i8* %buf.addr.150.i, align 1, !tbaa !10
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %conv.i = zext i8 %18 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: main
;[ORIGIN]   %and9.i = and i32 %shr8.i, %conv.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
infer %4

; Function: main
;[ORIGIN]   %sub10.i = sub i32 7, %shift.addr.149.i
%0:i32 = var
%1:i32 = sub 7:i32, %0
infer %1

; Function: main
;[ORIGIN]   %shr11.i = lshr i32 %and9.i, %sub10.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
%5:i32 = sub 7:i32, %0
%6:i32 = lshr %4, %5
infer %6

; Function: main
;[ORIGIN]   %or.i = or i32 %shr11.i, %shl7.i
%0:i32 = var
%1:i32 = shl %0, 1:i32
%2:i32 = var
%3:i32 = lshr 128:i32, %2
%4:i8 = var
%5:i32 = zext %4
%6:i32 = and %3, %5
%7:i32 = sub 7:i32, %2
%8:i32 = lshr %6, %7
%9:i32 = or %1, %8
infer %9

; Function: main
;[ORIGIN]   %dec.i = add i32 %n_bits.addr.148.i, -1
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %inc.i = add nsw i32 %bits.252.i, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %inc12.i = add i32 %shift.addr.149.i, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp13.i = icmp eq i32 %inc12.i, 8
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = eq 8:i32, %1
infer %2

; Function: main
;[ORIGIN]   %spec.select.i = select i1 %cmp13.i, i32 0, i32 %inc12.i
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = eq 8:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: main
;[ORIGIN]   %cmp5.i = icmp slt i32 %bits.252.i, 7
%0:i32 = var
%1:i1 = slt %0, 7:i32
infer %1

; Function: main
;[ORIGIN]   %tobool6.i = icmp ne i32 %dec.i, 0
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: main
;[ORIGIN]   %19 = and i1 %cmp5.i, %tobool6.i
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
%3:i32 = var
%4:i1 = slt %3, 7:i32
%5:i1 = and %2, %4
infer %5

; Function: main
;[ORIGIN]   %n_bits.addr.1.lcssa.i = phi i32 [ %n_bits.addr.063.i, %._crit_edge.i ], [ %dec.i, %.lr.ph54.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shift.addr.1.lcssa.i = phi i32 [ %shift.addr.064.i, %._crit_edge.i ], [ %spec.select.i, %.lr.ph54.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %20 = phi i32 [ %accu.1.lcssa.i, %._crit_edge.i ], [ %or.i, %.lr.ph54.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %21 = phi i32 [ %bits.1.lcssa.i, %._crit_edge.i ], [ %inc.i, %.lr.ph54.i ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool.i = icmp ne i32 %n_bits.addr.1.lcssa.i, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp.i = icmp sgt i32 %21, 7
%0:i32 = var
%1:i1 = slt 7:i32, %0
infer %1

; Function: main
;[ORIGIN]   %22 = or i1 %tobool.i, %cmp.i
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = or %1, %3
infer %4

; Function: main
;[ORIGIN]   %inc = add nuw nsw i32 %i.072, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond73 = icmp eq i32 %inc, 10
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = eq 10:i32, %1
infer %2

; Function: main
;[ORIGIN]   %tobool.i30 = icmp eq i32 %21, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = or %1, %3
pc %4 0:i1
%5:i1 = eq 0:i32, %2
infer %5

; Function: main
;[ORIGIN]   %sub.i31 = sub nsw i32 8, %21
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = or %1, %3
pc %4 0:i1
%5:i1 = eq 0:i32, %2
pc %5 0:i1
%6:i32 = subnsw 8:i32, %2
infer %6

; Function: main
;[ORIGIN]   %shl.i33 = shl i32 %20, %sub.i31
%0:i32 = var
%1:i1 = ne 0:i32, %0
%2:i32 = var
%3:i1 = slt 7:i32, %2
%4:i1 = or %1, %3
pc %4 0:i1
%5:i1 = eq 0:i32, %2
pc %5 0:i1
%6:i32 = var
%7:i32 = subnsw 8:i32, %2
%8:i32 = shl %6, %7
infer %8

; Function: main
;[ORIGIN]   %29 = phi i32 [ 0, %b_detach.exit ], [ %42, %b_read.exit ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %30 = phi i32 [ 0, %b_detach.exit ], [ %41, %b_read.exit ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %i.171 = phi i32 [ 0, %b_detach.exit ], [ %inc9, %b_read.exit ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.055.i = phi i32 [ 7, %28 ], [ %n_bits.addr.1.lcssa.i58, %39 ]
%0:i32 = var (range=[1,0))
infer %0

; Function: main
;[ORIGIN]   %bits.054.i = phi i32 [ %29, %28 ], [ %add.i, %39 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %accu.053.i = phi i32 [ %30, %28 ], [ %or14.i, %39 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %shift.addr.052.i = phi i32 [ 1, %28 ], [ %shift.addr.1.lcssa.i56, %39 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool341.i = icmp ne i32 %bits.054.i, 0
%0:i32 = var
%1:i1 = ne 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %tobool442.i = icmp ne i32 %n_bits.addr.055.i, 0
%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %32 = and i1 %tobool442.i, %tobool341.i
%0:i32 = var (range=[1,0))
%1:i1 = ne 0:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = ne 0:i32, %2
%4:i1 = and %1, %3
infer %4

; Function: main
;[ORIGIN]   %n_bits.addr.145.i = phi i32 [ %dec.i51, %37 ], [ %n_bits.addr.055.i, %.lr.ph.i43.preheader ]
%0:i32 = var (range=[1,0))
infer %0

; Function: main
;[ORIGIN]   %bits.144.i44 = phi i32 [ %sub.i45, %37 ], [ %bits.054.i, %.lr.ph.i43.preheader ]
%0:i32 = var (range=[1,0))
infer %0

; Function: main
;[ORIGIN]   %shift.addr.143.i = phi i32 [ %spec.select.i55, %37 ], [ %shift.addr.052.i, %.lr.ph.i43.preheader ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %sub.i45 = add nsw i32 %bits.144.i44, -1
%0:i32 = var (range=[1,0))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %shl.i46 = shl i32 1, %sub.i45
%0:i32 = var (range=[1,0))
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i32 = shl 1:i32, %1
infer %2

; Function: main
;[ORIGIN]   %and.i47 = and i32 %shl.i46, %accu.053.i
%0:i32 = var
%1:i32 = var (range=[1,0))
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
infer %4

; Function: main
;[ORIGIN]   %tobool5.i = icmp eq i32 %and.i47, 0
%0:i32 = var
%1:i32 = var (range=[1,0))
%2:i32 = addnsw 4294967295:i32, %1 (hasExternalUses)
%3:i32 = shl 1:i32, %2
%4:i32 = and %0, %3
%5:i1 = eq 0:i32, %4
infer %5

; Function: main
;[ORIGIN]   %shr.i48 = lshr i32 128, %shift.addr.143.i
%0:i32 = var
%1:i32 = lshr 128:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %34 = load i8, i8* %buf.addr.146.i, align 1, !tbaa !10
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %conv.i49 = zext i8 %34 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %or.i50 = or i32 %shr.i48, %conv.i49
%0:i32 = var
%1:i32 = lshr 128:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = or %1, %3
infer %4 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %neg.i = ashr i32 -129, %shift.addr.143.i
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %36 = load i8, i8* %buf.addr.146.i, align 1, !tbaa !10
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %conv7.i = zext i8 %36 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %and8.i = and i32 %neg.i, %conv7.i
%0:i32 = var
%1:i32 = ashr 4294967167:i32, %0
%2:i8 = var
%3:i32 = zext %2
%4:i32 = and %1, %3
infer %4 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %storemerge.in.i = phi i32 [ %and8.i, %35 ], [ %or.i50, %33 ]
%0:i32 = var
infer %0 (demandedBits=00000000000000000000000011111111)

; Function: main
;[ORIGIN]   %storemerge.i = trunc i32 %storemerge.in.i to i8
%0:i32 = var
%1:i8 = trunc %0
infer %1

; Function: main
;[ORIGIN]   %dec.i51 = add i32 %n_bits.addr.145.i, -1
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %inc.i52 = add i32 %shift.addr.143.i, 1
%0:i32 = var
%1:i32 = add 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp.i53 = icmp ugt i32 %inc.i52, 7
%0:i32 = var
%1:i32 = add 1:i32, %0 (hasExternalUses)
%2:i1 = ult 7:i32, %1
infer %2

; Function: main
;[ORIGIN]   %spec.select.i55 = select i1 %cmp.i53, i32 0, i32 %inc.i52
%0:i32 = var
%1:i32 = add 1:i32, %0
%2:i1 = ult 7:i32, %1 (hasExternalUses)
%3:i32 = select %2, 0:i32, %1
infer %3

; Function: main
;[ORIGIN]   %tobool3.i = icmp ne i32 %sub.i45, 0
%0:i32 = var (range=[1,0))
%1:i32 = addnsw 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: main
;[ORIGIN]   %tobool4.i = icmp ne i32 %dec.i51, 0
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1
infer %2

; Function: main
;[ORIGIN]   %38 = and i1 %tobool4.i, %tobool3.i
%0:i32 = var (range=[1,0))
%1:i32 = add 4294967295:i32, %0 (hasExternalUses)
%2:i1 = ne 0:i32, %1 (hasExternalUses)
%3:i32 = var (range=[1,0))
%4:i32 = addnsw 4294967295:i32, %3 (hasExternalUses)
%5:i1 = ne 0:i32, %4
%6:i1 = and %2, %5
infer %6

; Function: main
;[ORIGIN]   %shift.addr.1.lcssa.i56 = phi i32 [ %shift.addr.052.i, %31 ], [ %spec.select.i55, %37 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %bits.1.lcssa.i57 = phi i32 [ %bits.054.i, %31 ], [ %sub.i45, %37 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %n_bits.addr.1.lcssa.i58 = phi i32 [ %n_bits.addr.055.i, %31 ], [ %dec.i51, %37 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool4.lcssa.i = phi i1 [ %tobool442.i, %31 ], [ %tobool4.i, %37 ]
%0:i1 = var
infer %0

; Function: main
;[ORIGIN]   %shl13.i = shl i32 %accu.053.i, 8
%0:i32 = var
%1:i32 = shl %0, 8:i32
infer %1

; Function: main
;[ORIGIN]   %call.i61 = tail call i32 @fgetc(%struct._IO_FILE* %40) #3
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %or14.i = or i32 %call.i61, %shl13.i
%0:i32 = var
%1:i32 = var
%2:i32 = shl %1, 8:i32
%3:i32 = or %0, %2
infer %3

; Function: main
;[ORIGIN]   %add.i = add nsw i32 %bits.1.lcssa.i57, 8
%0:i32 = var
%1:i32 = addnsw 8:i32, %0
infer %1

; Function: main
;[ORIGIN]   %tobool.i62 = icmp eq i32 %n_bits.addr.1.lcssa.i58, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %41 = phi i32 [ %or14.i, %39 ], [ %accu.053.i, %._crit_edge.i60 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %42 = phi i32 [ %add.i, %39 ], [ %bits.1.lcssa.i57, %._crit_edge.i60 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc9 = add nuw nsw i32 %i.171, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond = icmp eq i32 %inc9, 10
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,10))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = eq 10:i32, %1
infer %2

; Function: main
;[ORIGIN]   %tobool.i64 = icmp eq i32 %42, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %sub.i65 = sub nsw i32 8, %42
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = subnsw 8:i32, %0
infer %2

; Function: main
;[ORIGIN]   %shl.i67 = shl i32 %41, %sub.i65
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = var
%3:i32 = subnsw 8:i32, %0
%4:i32 = shl %2, %3
infer %4
```
**benchmark4pipeline_c/eban_numbers.bc**
```


; Function: main
;[ORIGIN]   %idx.0111 = phi i32 [ 0, %0 ], [ %inc42, %30 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,8))
infer %0

; Function: main
;[ORIGIN]   %intv.sroa.0.0.copyload = load i32, i32* %intv.sroa.0.0..sroa_idx, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %intv.sroa.6.0.copyload = load i32, i32* %intv.sroa.6.0..sroa_idx96, align 4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp1 = icmp eq i32 %idx.0111, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,8))
%1:i1 = eq 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp7108 = icmp sgt i32 %intv.sroa.0.0.copyload, %intv.sroa.6.0.copyload
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: main
;[ORIGIN]   %5 = icmp ult i32 %idx.0111, 2
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,8))
%1:i1 = ult %0, 2:i32
infer %1

; Function: main
;[ORIGIN]   %i.0110.us = phi i32 [ %add.us, %16 ], [ %intv.sroa.0.0.copyload, %.lr.ph.split.us.preheader ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %count.0109.us = phi i32 [ %count.1.us, %16 ], [ 0, %.lr.ph.split.us.preheader ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %rem.us = srem i32 %i.0110.us, 1000000000
%0:i32 = var
%1:i32 = srem %0, 1000000000:i32
infer %1

; Function: main
;[ORIGIN]   %div8.us = sdiv i32 %rem.us, 1000000
%0:i32 = var
%1:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000000:i32
infer %2

; Function: main
;[ORIGIN]   %rem9.us = srem i32 %i.0110.us, 1000000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32
infer %1

; Function: main
;[ORIGIN]   %div10.us = sdiv i32 %rem9.us, 1000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32
infer %2

; Function: main
;[ORIGIN]   %6 = mul i32 %div10.us, 1000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
infer %3

; Function: main
;[ORIGIN]   %7 = sub i32 %rem9.us, %6
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3
infer %4

; Function: main
;[ORIGIN]   %rem9.off.us = add nsw i32 %rem9.us, -30000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = addnsw 4294937296:i32, %1
infer %2

; Function: main
;[ORIGIN]   %8 = icmp ult i32 %rem9.off.us, 37000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = addnsw 4294937296:i32, %1
%3:i1 = ult %2, 37000:i32
infer %3

; Function: main
;[ORIGIN]   %rem17.us = srem i32 %div10.us, 10
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = srem %2, 10:i32
infer %3

; Function: main
;[ORIGIN]   %t.0.us = select i1 %8, i32 %rem17.us, i32 %div10.us
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = addnsw 4294937296:i32, %1
%3:i1 = ult %2, 37000:i32
%4:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%5:i32 = srem %4, 10:i32
%6:i32 = select %3, %5, %4
infer %6

; Function: main
;[ORIGIN]   %rem11.off.us = add nsw i32 %7, -30
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3 (hasExternalUses)
%5:i32 = addnsw 4294967266:i32, %4
infer %5

; Function: main
;[ORIGIN]   %9 = icmp ult i32 %rem11.off.us, 37
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3 (hasExternalUses)
%5:i32 = addnsw 4294967266:i32, %4
%6:i1 = ult %5, 37:i32
infer %6

; Function: main
;[ORIGIN]   %rem20.us = srem i32 %7, 10
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3 (hasExternalUses)
%5:i32 = srem %4, 10:i32
infer %5

; Function: main
;[ORIGIN]   %r.0.us = select i1 %9, i32 %rem20.us, i32 %7
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3
%5:i32 = addnsw 4294967266:i32, %4
%6:i1 = ult %5, 37:i32
%7:i32 = srem %4, 10:i32
%8:i32 = select %6, %7, %4
infer %8

; Function: main
;[ORIGIN]   %i.0.off.us = add i32 %i.0110.us, 999999999
%0:i32 = var
%1:i32 = add 999999999:i32, %0
infer %1

; Function: main
;[ORIGIN]   %10 = icmp ult i32 %i.0.off.us, 1999999999
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
infer %2

; Function: main
;[ORIGIN]   %cmp22.us = icmp sgt i32 %i.0110.us, 1999999999
%0:i32 = var
%1:i1 = slt 1999999999:i32, %0
infer %1

; Function: main
;[ORIGIN]   %or.cond45.us = or i1 %cmp22.us, %10
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
infer %4

; Function: main
;[ORIGIN]   %rem.off.us = add nsw i32 %rem.us, -30000000
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%6:i32 = addnsw 4264967296:i32, %5
infer %6

; Function: main
;[ORIGIN]   %12 = icmp ult i32 %rem.off.us, 37000000
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%6:i32 = addnsw 4264967296:i32, %5
%7:i1 = ult %6, 37000000:i32
infer %7

; Function: main
;[ORIGIN]   %rem14.us = srem i32 %div8.us, 10
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%6:i32 = sdiv %5, 1000000:i32 (hasExternalUses)
%7:i32 = srem %6, 10:i32
infer %7

; Function: main
;[ORIGIN]   %m.0.us = select i1 %12, i32 %rem14.us, i32 %div8.us
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32
%6:i32 = addnsw 4264967296:i32, %5
%7:i1 = ult %6, 37000000:i32
%8:i32 = sdiv %5, 1000000:i32
%9:i32 = srem %8, 10:i32
%10:i32 = select %7, %9, %8
infer %10

; Function: main
;[ORIGIN]   %inc.us = add nsw i32 %count.0109.us, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %count.1.us = phi i32 [ %inc.us, %15 ], [ %count.0109.us, %14 ], [ %count.0109.us, %13 ], [ %count.0109.us, %11 ], [ %count.0109.us, %.lr.ph.split.us ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us = add nsw i32 %i.0110.us, 2
%0:i32 = var
%1:i32 = addnsw 2:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp7.us = icmp sgt i32 %add.us, %intv.sroa.6.0.copyload
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 2:i32, %1 (hasExternalUses)
%3:i1 = slt %0, %2
infer %3

; Function: main
;[ORIGIN]   %i.0110 = phi i32 [ %add, %27 ], [ %intv.sroa.0.0.copyload, %.lr.ph.split.preheader ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %count.0109 = phi i32 [ %count.1, %27 ], [ 0, %.lr.ph.split.preheader ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %rem = srem i32 %i.0110, 1000000000
%0:i32 = var
%1:i32 = srem %0, 1000000000:i32
infer %1

; Function: main
;[ORIGIN]   %div8 = sdiv i32 %rem, 1000000
%0:i32 = var
%1:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000000:i32
infer %2

; Function: main
;[ORIGIN]   %rem9 = srem i32 %i.0110, 1000000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32
infer %1

; Function: main
;[ORIGIN]   %div10 = sdiv i32 %rem9, 1000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32
infer %2

; Function: main
;[ORIGIN]   %17 = mul i32 %div10, 1000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
infer %3

; Function: main
;[ORIGIN]   %18 = sub i32 %rem9, %17
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3
infer %4

; Function: main
;[ORIGIN]   %rem9.off = add nsw i32 %rem9, -30000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = addnsw 4294937296:i32, %1
infer %2

; Function: main
;[ORIGIN]   %19 = icmp ult i32 %rem9.off, 37000
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = addnsw 4294937296:i32, %1
%3:i1 = ult %2, 37000:i32
infer %3

; Function: main
;[ORIGIN]   %rem17 = srem i32 %div10, 10
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = srem %2, 10:i32
infer %3

; Function: main
;[ORIGIN]   %t.0 = select i1 %19, i32 %rem17, i32 %div10
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = addnsw 4294937296:i32, %1
%3:i1 = ult %2, 37000:i32
%4:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%5:i32 = srem %4, 10:i32
%6:i32 = select %3, %5, %4
infer %6

; Function: main
;[ORIGIN]   %rem11.off = add nsw i32 %18, -30
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3 (hasExternalUses)
%5:i32 = addnsw 4294967266:i32, %4
infer %5

; Function: main
;[ORIGIN]   %20 = icmp ult i32 %rem11.off, 37
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3 (hasExternalUses)
%5:i32 = addnsw 4294967266:i32, %4
%6:i1 = ult %5, 37:i32
infer %6

; Function: main
;[ORIGIN]   %rem20 = srem i32 %18, 10
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3 (hasExternalUses)
%5:i32 = srem %4, 10:i32
infer %5

; Function: main
;[ORIGIN]   %r.0 = select i1 %20, i32 %rem20, i32 %18
%0:i32 = var
%1:i32 = srem %0, 1000000:i32 (hasExternalUses)
%2:i32 = sdiv %1, 1000:i32 (hasExternalUses)
%3:i32 = mul 1000:i32, %2
%4:i32 = sub %1, %3
%5:i32 = addnsw 4294967266:i32, %4
%6:i1 = ult %5, 37:i32
%7:i32 = srem %4, 10:i32
%8:i32 = select %6, %7, %4
infer %8

; Function: main
;[ORIGIN]   %i.0.off = add i32 %i.0110, 999999999
%0:i32 = var
%1:i32 = add 999999999:i32, %0
infer %1

; Function: main
;[ORIGIN]   %21 = icmp ult i32 %i.0.off, 1999999999
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
infer %2

; Function: main
;[ORIGIN]   %cmp22 = icmp sgt i32 %i.0110, 1999999999
%0:i32 = var
%1:i1 = slt 1999999999:i32, %0
infer %1

; Function: main
;[ORIGIN]   %or.cond45 = or i1 %cmp22, %21
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
infer %4

; Function: main
;[ORIGIN]   %rem.off = add nsw i32 %rem, -30000000
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%6:i32 = addnsw 4264967296:i32, %5
infer %6

; Function: main
;[ORIGIN]   %23 = icmp ult i32 %rem.off, 37000000
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%6:i32 = addnsw 4264967296:i32, %5
%7:i1 = ult %6, 37000000:i32
infer %7

; Function: main
;[ORIGIN]   %rem14 = srem i32 %div8, 10
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32 (hasExternalUses)
%6:i32 = sdiv %5, 1000000:i32 (hasExternalUses)
%7:i32 = srem %6, 10:i32
infer %7

; Function: main
;[ORIGIN]   %m.0 = select i1 %23, i32 %rem14, i32 %div8
%0:i32 = var
%1:i32 = add 999999999:i32, %0
%2:i1 = ult %1, 1999999999:i32
%3:i1 = slt 1999999999:i32, %0
%4:i1 = or %2, %3
pc %4 1:i1
%5:i32 = srem %0, 1000000000:i32
%6:i32 = addnsw 4264967296:i32, %5
%7:i1 = ult %6, 37000000:i32
%8:i32 = sdiv %5, 1000000:i32
%9:i32 = srem %8, 10:i32
%10:i32 = select %7, %9, %8
infer %10

; Function: main
;[ORIGIN]   %inc = add nsw i32 %count.0109, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %count.1 = phi i32 [ %inc, %26 ], [ %count.0109, %25 ], [ %count.0109, %24 ], [ %count.0109, %22 ], [ %count.0109, %.lr.ph.split ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add = add nsw i32 %i.0110, 2
%0:i32 = var
%1:i32 = addnsw 2:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp7 = icmp sgt i32 %add, %intv.sroa.6.0.copyload
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 2:i32, %1 (hasExternalUses)
%3:i1 = slt %0, %2
infer %3

; Function: main
;[ORIGIN]   %count.0.lcssa = phi i32 [ 0, %4 ], [ %count.1.us, %16 ], [ %count.1, %27 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %28 = icmp ult i32 %idx.0111, 2
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,8))
%1:i1 = ult %0, 2:i32
infer %1

; Function: main
;[ORIGIN]   %inc42 = add nuw nsw i32 %idx.0111, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,8))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond = icmp eq i32 %inc42, 8
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,8))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = eq 8:i32, %1
infer %2
```
**benchmark4pipeline_c/flipping_bits_game.bc**
```


; Function: fliprow
;[ORIGIN]   %cmp7 = icmp sgt i32 %sz, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: fliprow
;[ORIGIN]   %add = add nsw i32 %n, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: fliprow
;[ORIGIN]   %storemerge8 = phi i32 [ 0, %.lr.ph ], [ %inc, %2 ]
%0:i32 = var (range=[-2147483648,2147483647))
infer %0

; Function: fliprow
;[ORIGIN]   %3 = load i32, i32* %arrayidx1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: fliprow
;[ORIGIN]   %tobool = icmp eq i32 %3, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: fliprow
;[ORIGIN]   %lnot.ext = zext i1 %tobool to i32
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: fliprow
;[ORIGIN]   %4 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: fliprow
;[ORIGIN]   %inc = add nsw i32 %4, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: fliprow
;[ORIGIN]   %cmp = icmp slt i32 %inc, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: flipcol
;[ORIGIN]   %cmp6 = icmp slt i32 %sz, 1
%0:i32 = var
%1:i1 = slt %0, 1:i32
infer %1

; Function: flipcol
;[ORIGIN]   %storemerge7 = phi i32 [ %inc, %.lr.ph ], [ 1, %.lr.ph.preheader ]
%0:i32 = var
infer %0

; Function: flipcol
;[ORIGIN]   %2 = load i32, i32* %arrayidx1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: flipcol
;[ORIGIN]   %tobool = icmp eq i32 %2, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: flipcol
;[ORIGIN]   %lnot.ext = zext i1 %tobool to i32
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: flipcol
;[ORIGIN]   %3 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: flipcol
;[ORIGIN]   %inc = add nsw i32 %3, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: flipcol
;[ORIGIN]   %cmp = icmp slt i32 %3, %sz
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: initt
;[ORIGIN]   %cmp7 = icmp slt i32 %sz, 1
%0:i32 = var
%1:i1 = slt %0, 1:i32
infer %1

; Function: initt
;[ORIGIN]   %call.us = tail call i32 @rand() #5
%0:i32 = var
infer %0

; Function: initt
;[ORIGIN]   %rem.us = srem i32 %call.us, 2
%0:i32 = var
%1:i32 = srem %0, 2:i32
infer %1

; Function: initt
;[ORIGIN]   %2 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initt
;[ORIGIN]   %4 = load i32, i32* @j, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initt
;[ORIGIN]   %5 = load i32, i32* @j, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initt
;[ORIGIN]   %inc.us = add nsw i32 %5, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: initt
;[ORIGIN]   %cmp1.us = icmp slt i32 %inc.us, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: initt
;[ORIGIN]   %6 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initt
;[ORIGIN]   %inc3.us = add nsw i32 %6, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: initt
;[ORIGIN]   %cmp.us = icmp slt i32 %6, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i32 = var
%5:i1 = slt %4, %2
infer %5

; Function: initb
;[ORIGIN]   %cmp41 = icmp slt i32 %sz, 1
%0:i32 = var
%1:i1 = slt %0, 1:i32
infer %1

; Function: initb
;[ORIGIN]   %1 = phi i32 [ %inc5.us, %._crit_edge40.us ], [ 1, %.lr.ph39.us.preheader ]
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %3 = phi i32 [ %1, %.lr.ph39.us ], [ %8, %2 ]
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %storemerge2337.us = phi i32 [ 0, %.lr.ph39.us ], [ %inc.us, %2 ]
%0:i32 = var (range=[-2147483648,2147483647))
infer %0

; Function: initb
;[ORIGIN]   %5 = load i32, i32* %arrayidx2.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %7 = load i32, i32* @j, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %inc.us = add nsw i32 %7, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: initb
;[ORIGIN]   %cmp1.us = icmp slt i32 %inc.us, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: initb
;[ORIGIN]   %8 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %inc5.us = add nsw i32 %8, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: initb
;[ORIGIN]   %cmp.us = icmp slt i32 %8, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i32 = var
%5:i1 = slt %4, %2
infer %5

; Function: initb
;[ORIGIN]   %call.us = tail call i32 @rand() #5
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %rem.us = srem i32 %call.us, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i32 = var
%5:i1 = slt %4, %2
pc %5 0:i1
%6:i1 = slt %2, 1:i32
pc %6 0:i1
%7:i32 = var
%8:i32 = srem %7, %2
infer %8

; Function: initb
;[ORIGIN]   %add.i.us = add nsw i32 %rem.us, 2
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i32 = var
%5:i1 = slt %4, %2
pc %5 0:i1
%6:i1 = slt %2, 1:i32
pc %6 0:i1
%7:i32 = var
%8:i32 = srem %7, %2
%9:i32 = addnsw 2:i32, %8
infer %9

; Function: initb
;[ORIGIN]   %storemerge8.i.us = phi i32 [ 0, %.lr.ph.i.us ], [ %inc.i.us, %10 ]
%0:i32 = var (range=[-2147483648,2147483647))
infer %0

; Function: initb
;[ORIGIN]   %11 = load i32, i32* %arrayidx1.i.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %tobool.i.us = icmp eq i32 %11, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: initb
;[ORIGIN]   %lnot.ext.i.us = zext i1 %tobool.i.us to i32
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: initb
;[ORIGIN]   %12 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %inc.i.us = add nsw i32 %12, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: initb
;[ORIGIN]   %cmp.i.us = icmp slt i32 %inc.i.us, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: initb
;[ORIGIN]   %cmp831 = icmp sgt i32 %sz, 0
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i1 = slt 0:i32, %2
infer %4

; Function: initb
;[ORIGIN]   %call9 = tail call i32 @rand() #5
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %rem10 = srem i32 %call9, %sz
%0:i32 = var
%1:i32 = var
%2:i32 = srem %0, %1
infer %2

; Function: initb
;[ORIGIN]   %storemerge7.i = phi i32 [ 1, %.lr.ph.i24 ], [ %inc.i29, %13 ]
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %15 = load i32, i32* %arrayidx1.i26, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %tobool.i27 = icmp eq i32 %15, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: initb
;[ORIGIN]   %lnot.ext.i28 = zext i1 %tobool.i27 to i32
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: initb
;[ORIGIN]   %16 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: initb
;[ORIGIN]   %inc.i29 = add nsw i32 %16, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: initb
;[ORIGIN]   %cmp.i30 = icmp slt i32 %16, %sz
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
infer %2

; Function: initb
;[ORIGIN]   %inc11 = add nsw i32 %16, 2
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = addnsw 2:i32, %0
infer %3

; Function: initb
;[ORIGIN]   %cmp8 = icmp slt i32 %inc11, %sz
%0:i32 = var
%1:i32 = var
%2:i1 = slt %0, %1
pc %2 0:i1
%3:i32 = addnsw 2:i32, %0 (hasExternalUses)
%4:i1 = slt %3, %1
infer %4

; Function: printb
;[ORIGIN]   %cmp26 = icmp sgt i32 %sz, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: printb
;[ORIGIN]   %storemerge27 = phi i32 [ %inc, %.lr.ph29 ], [ 0, %.lr.ph29.preheader ]
%0:i32 = var (range=[-2147483648,2147483647))
infer %0

; Function: printb
;[ORIGIN]   %1 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printb
;[ORIGIN]   %inc = add nsw i32 %1, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: printb
;[ORIGIN]   %cmp = icmp slt i32 %inc, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: printb
;[ORIGIN]   %cmp321 = icmp slt i32 %sz, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i1 = slt %2, 1:i32
infer %4

; Function: printb
;[ORIGIN]   %storemerge1522.us = phi i32 [ %inc10.us, %._crit_edge.us ], [ 1, %.lr.ph.us.preheader ]
%0:i32 = var
infer %0

; Function: printb
;[ORIGIN]   %sub.us = add nsw i32 %storemerge1522.us, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: printb
;[ORIGIN]   %storemerge1720.us = phi i32 [ 0, %.lr.ph.us ], [ %inc8.us, %2 ]
%0:i32 = var (range=[-2147483648,2147483647))
infer %0

; Function: printb
;[ORIGIN]   %3 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printb
;[ORIGIN]   %5 = load i32, i32* %arrayidx6.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printb
;[ORIGIN]   %6 = load i32, i32* @j, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printb
;[ORIGIN]   %inc8.us = add nsw i32 %6, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: printb
;[ORIGIN]   %cmp5.us = icmp slt i32 %inc8.us, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: printb
;[ORIGIN]   %7 = load i32, i32* @i, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printb
;[ORIGIN]   %inc10.us = add nsw i32 %7, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: printb
;[ORIGIN]   %cmp3.us = icmp slt i32 %7, %sz
%0:i32 = var
%1:i32 = addnsw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i32 = var
%5:i1 = slt %4, %2
infer %5

; Function: eq
;[ORIGIN]   %cmp12 = icmp slt i32 %sz, 1
%0:i32 = var
%1:i1 = slt %0, 1:i32
infer %1

; Function: eq
;[ORIGIN]   %storemerge13.us = phi i32 [ %inc6.us, %._crit_edge.us ], [ 1, %.lr.ph.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,-2147483648))
infer %0

; Function: eq
;[ORIGIN]   %cmp1.us = icmp slt i32 %inc.us, %sz
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: eq
;[ORIGIN]   %storemerge811.us = phi i32 [ 0, %.lr.ph.us ], [ %inc.us, %3 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
infer %0

; Function: eq
;[ORIGIN]   %5 = load i32, i32* %arrayidx2.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: eq
;[ORIGIN]   %6 = load i32, i32* %arrayidx4.us, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: eq
;[ORIGIN]   %cmp5.us = icmp eq i32 %5, %6
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: eq
;[ORIGIN]   %inc.us = add nuw nsw i32 %storemerge811.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: eq
;[ORIGIN]   %inc6.us = add nuw nsw i32 %storemerge13.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: eq
;[ORIGIN]   %cmp.us = icmp slt i32 %storemerge13.us, %sz
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,2147483647))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
pc %3 0:i1
%4:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,-2147483648))
%5:i1 = slt %4, %2
infer %5

; Function: eq
;[ORIGIN]   %retval.0 = phi i32 [ 1, %0 ], [ 0, %4 ], [ 1, %._crit_edge.us ]
%0 = block 3
%1:i32 = phi %0, 1:i32, 0:i32, 1:i32
infer %1

; Function: main
;[ORIGIN]   %call.us.i = tail call i32 @rand() #5
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %rem.us.i = srem i32 %call.us.i, 2
%0:i32 = var
%1:i32 = srem %0, 2:i32
infer %1

; Function: main
;[ORIGIN]   %17 = load i32, i32* @i, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %19 = load i32, i32* @j, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %20 = load i32, i32* @j, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc.us.i = add nsw i32 %20, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp1.us.i = icmp slt i32 %20, 2
%0:i32 = var
%1:i1 = slt %0, 2:i32
infer %1

; Function: main
;[ORIGIN]   %21 = load i32, i32* @i, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc3.us.i = add nsw i32 %21, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp.us.i = icmp slt i32 %21, 3
%0:i32 = var
%1:i1 = slt %0, 3:i32
infer %1

; Function: main
;[ORIGIN]   %34 = load i32, i32* %10, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %35 = load i32, i32* %11, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i107 = icmp eq i32 %34, %35
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %36 = load i32, i32* %22, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %37 = load i32, i32* %23, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.1 = icmp eq i32 %36, %37
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %mov.088 = phi i32 [ 0, %._crit_edge108 ], [ %inc17, %eq.exit78.thread.backedge ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %50 = load i8, i8* %roc, align 1, !tbaa !8
%0:i8 = var
infer %0

; Function: main
;[ORIGIN]   %conv = sext i8 %50 to i32
%0:i8 = var
%1:i32 = sext %0
infer %1

; Function: main
;[ORIGIN]   %52 = load i32, i32* %n, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.i = add nsw i32 %52, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %storemerge8.i = phi i32 [ 0, %51 ], [ %inc.i83, %54 ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %55 = load i32, i32* %arrayidx1.i80, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool.i81 = icmp eq i32 %55, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %lnot.ext.i82 = zext i1 %tobool.i81 to i32
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: main
;[ORIGIN]   %56 = load i32, i32* @i, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc.i83 = add nsw i32 %56, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp.i84 = icmp slt i32 %56, 2
%0:i32 = var
%1:i1 = slt %0, 2:i32
infer %1

; Function: main
;[ORIGIN]   %57 = load i32, i32* %n, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %58 = load i32, i32* %arrayidx1.i101, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool.i102 = icmp eq i32 %58, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %lnot.ext.i103 = zext i1 %tobool.i102 to i32
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: main
;[ORIGIN]   %inc.i106 = phi i32 [ 2, %._crit_edge.lr.ph ], [ %inc.i, %._crit_edge ]
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %59 = load i32, i32* %arrayidx1.i, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %tobool.i = icmp eq i32 %59, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: main
;[ORIGIN]   %lnot.ext.i = zext i1 %tobool.i to i32
%0:i32 = var
%1:i1 = eq 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: main
;[ORIGIN]   %60 = load i32, i32* @i, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc.i = add nsw i32 %60, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %cmp.i = icmp slt i32 %60, 3
%0:i32 = var
%1:i1 = slt %0, 3:i32
infer %1

; Function: main
;[ORIGIN]   %inc17 = add nuw nsw i32 %mov.088, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %62 = load i32, i32* %10, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %63 = load i32, i32* %11, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72 = icmp eq i32 %62, %63
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %65 = load i32, i32* %38, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %66 = load i32, i32* %39, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.1 = icmp eq i32 %65, %66
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %69 = load i32, i32* %40, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %70 = load i32, i32* %41, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.2 = icmp eq i32 %69, %70
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %71 = load i32, i32* %12, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %72 = load i32, i32* %13, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.194 = icmp eq i32 %71, %72
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %74 = load i32, i32* %42, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %75 = load i32, i32* %43, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.1.1 = icmp eq i32 %74, %75
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %77 = load i32, i32* %44, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %78 = load i32, i32* %45, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.2.1 = icmp eq i32 %77, %78
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %79 = load i32, i32* %14, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %80 = load i32, i32* %15, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.295 = icmp eq i32 %79, %80
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %82 = load i32, i32* %46, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %83 = load i32, i32* %47, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.1.2 = icmp eq i32 %82, %83
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %85 = load i32, i32* %48, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %86 = load i32, i32* %49, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i72.2.2 = icmp eq i32 %85, %86
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %88 = load i32, i32* %24, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %89 = load i32, i32* %25, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.2 = icmp eq i32 %88, %89
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %90 = load i32, i32* %12, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %91 = load i32, i32* %13, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.197 = icmp eq i32 %90, %91
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %93 = load i32, i32* %26, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %94 = load i32, i32* %27, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.1.1 = icmp eq i32 %93, %94
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %96 = load i32, i32* %28, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %97 = load i32, i32* %29, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.2.1 = icmp eq i32 %96, %97
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %98 = load i32, i32* %14, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %99 = load i32, i32* %15, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.298 = icmp eq i32 %98, %99
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %101 = load i32, i32* %30, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %102 = load i32, i32* %31, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.1.2 = icmp eq i32 %101, %102
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %104 = load i32, i32* %32, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %105 = load i32, i32* %33, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i.2.2 = icmp eq i32 %104, %105
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: main
;[ORIGIN]   %106 = load i32, i32* %10, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %107 = load i32, i32* %11, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp5.us.i = icmp eq i32 %106, %107
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2
```
**benchmark4pipeline_c/paraffins.bc**
```


; Function: choose
;[ORIGIN]   %cmp110 = icmp ugt i64 %k, 1
%0:i64 = var
%1:i1 = ult 1:i64, %0
infer %1

; Function: choose
;[ORIGIN]   %r.012 = phi i64 [ %div, %.lr.ph ], [ %m, %.lr.ph.preheader ]
%0:i64 = var
infer %0

; Function: choose
;[ORIGIN]   %i.011 = phi i64 [ %add2, %.lr.ph ], [ 1, %.lr.ph.preheader ]
%0:i64 = var (nonZero) (range=[1,0))
infer %0

; Function: choose
;[ORIGIN]   %add = add i64 %i.011, %m
%0:i64 = var (nonZero) (range=[1,0))
%1:i64 = var
%2:i64 = add %0, %1
infer %2

; Function: choose
;[ORIGIN]   %mul = mul i64 %r.012, %add
%0:i64 = var
%1:i64 = var (nonZero) (range=[1,0))
%2:i64 = var
%3:i64 = add %1, %2
%4:i64 = mul %0, %3
infer %4

; Function: choose
;[ORIGIN]   %add2 = add nuw i64 %i.011, 1
%0:i64 = var (nonZero) (range=[1,0))
%1:i64 = addnuw 1:i64, %0
infer %1

; Function: choose
;[ORIGIN]   %div = udiv i64 %mul, %add2
%0:i64 = var
%1:i64 = var (nonZero) (range=[1,0))
%2:i64 = var
%3:i64 = add %1, %2
%4:i64 = mul %0, %3
%5:i64 = addnuw 1:i64, %1 (hasExternalUses)
%6:i64 = udiv %4, %5
infer %6

; Function: choose
;[ORIGIN]   %exitcond = icmp eq i64 %add2, %k
%0:i64 = var
%1:i64 = var (nonZero) (range=[1,0))
%2:i64 = addnuw 1:i64, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: choose
;[ORIGIN]   %retval.0 = phi i64 [ %m, %0 ], [ %div, %.lr.ph ]
%0 = block 2
%1:i64 = var
%2:i64 = var
%3:i64 = var (nonZero) (range=[1,0))
%4:i64 = add %3, %1
%5:i64 = mul %2, %4
%6:i64 = addnuw 1:i64, %3 (hasExternalUses)
%7:i64 = udiv %5, %6 (hasExternalUses)
%8:i64 = phi %0, %1, %7
infer %8

; Function: tree
;[ORIGIN]   %b.037 = add i64 %br, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %cmp38 = icmp ult i64 %b.037, 5
%0:i64 = var
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = ult %1, 5:i64
infer %2

; Function: tree
;[ORIGIN]   %idxprom = trunc i64 %n to i32
%0:i64 = var
%1:i32 = trunc %0
infer %1

; Function: tree
;[ORIGIN]   %mul5 = shl i64 %l, 1
%0:i64 = var
%1:i64 = shl %0, 1:i64
infer %1

; Function: tree
;[ORIGIN]   %dec34 = add i64 %n, -1
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %tobool35 = icmp eq i64 %dec34, 0
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
infer %2

; Function: tree
;[ORIGIN]   %b.039.us = phi i64 [ %b.0.us, %6 ], [ %b.037, %.lr.ph41.split.us.preheader ]
%0:i64 = var (range=[0,5))
infer %0

; Function: tree
;[ORIGIN]   %sub.us = sub i64 %b.039.us, %br
%0:i64 = var (range=[0,5))
%1:i64 = var
%2:i64 = sub %0, %1
infer %2

; Function: tree
;[ORIGIN]   %mul.us = mul i64 %sub.us, %n
%0:i64 = var
%1:i64 = var (range=[0,5))
%2:i64 = var
%3:i64 = sub %1, %2 (hasExternalUses)
%4:i64 = mul %0, %3
infer %4

; Function: tree
;[ORIGIN]   %add1.us = add i64 %mul.us, %sum
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i64 = mul %1, %4
%6:i64 = add %0, %5
infer %6

; Function: tree
;[ORIGIN]   %cmp2.us = icmp ugt i64 %add1.us, 32
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i64 = mul %1, %4
%6:i64 = add %0, %5 (hasExternalUses)
%7:i1 = ult 32:i64, %6
infer %7

; Function: tree
;[ORIGIN]   %2 = load i64, i64* %arrayidx, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %cmp110.i.us = icmp ugt i64 %sub.us, 1
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i64 = mul %1, %4
%6:i64 = add %0, %5 (hasExternalUses)
%7:i1 = ult 32:i64, %6
pc %7 0:i1
%8:i1 = ult 1:i64, %4
infer %8

; Function: tree
;[ORIGIN]   %r.012.i.us = phi i64 [ %div.i.us, %.lr.ph.i.us ], [ %2, %.lr.ph.i.us.preheader ]
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %i.011.i.us = phi i64 [ %add2.i.us, %.lr.ph.i.us ], [ 1, %.lr.ph.i.us.preheader ]
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
infer %0

; Function: tree
;[ORIGIN]   %add.i.us = add i64 %i.011.i.us, %2
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%2:i64 = add %0, %1
infer %2

; Function: tree
;[ORIGIN]   %mul.i.us = mul i64 %add.i.us, %r.012.i.us
%0:i64 = var
%1:i64 = var
%2:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%3:i64 = add %1, %2
%4:i64 = mul %0, %3
infer %4

; Function: tree
;[ORIGIN]   %add2.i.us = add nuw nsw i64 %i.011.i.us, 1
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%1:i64 = addnw 1:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %div.i.us = udiv i64 %mul.i.us, %add2.i.us
%0:i64 = var
%1:i64 = var
%2:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%3:i64 = add %1, %2
%4:i64 = mul %0, %3
%5:i64 = addnw 1:i64, %2 (hasExternalUses)
%6:i64 = udiv %4, %5
infer %6

; Function: tree
;[ORIGIN]   %exitcond.i.us = icmp eq i64 %add2.i.us, %sub.us
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i1 = eq %1, %4
infer %5

; Function: tree
;[ORIGIN]   %retval.0.i.us = phi i64 [ %2, %1 ], [ %div.i.us, %.lr.ph.i.us ]
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %mul4.us = mul i64 %retval.0.i.us, %cnt
%0:i64 = var
%1:i64 = var
%2:i64 = mul %0, %1
infer %2

; Function: tree
;[ORIGIN]   %cmp6.us = icmp ult i64 %mul5, %add1.us
%0:i64 = var
%1:i64 = shl %0, 1:i64 (hasExternalUses)
%2:i64 = var
%3:i64 = var
%4:i64 = var (range=[0,5))
%5:i64 = var
%6:i64 = sub %4, %5 (hasExternalUses)
%7:i64 = mul %3, %6
%8:i64 = add %2, %7 (hasExternalUses)
%9:i1 = ult %1, %8
infer %9

; Function: tree
;[ORIGIN]   %idxprom7.us = trunc i64 %add1.us to i32
%0:i64 = var
%1:i64 = shl %0, 1:i64 (hasExternalUses)
%2:i64 = var
%3:i64 = var
%4:i64 = var (range=[0,5))
%5:i64 = var
%6:i64 = sub %4, %5 (hasExternalUses)
%7:i64 = mul %3, %6
%8:i64 = add %2, %7 (hasExternalUses)
%9:i1 = ult %1, %8
pc %9 1:i1
%10:i32 = trunc %8
infer %10

; Function: tree
;[ORIGIN]   %4 = load i64, i64* %arrayidx8.us, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %add9.us = add i64 %4, %mul4.us
%0:i64 = var
%1:i64 = var
%2:i64 = var
%3:i64 = mul %1, %2 (hasExternalUses)
%4:i64 = add %0, %3
infer %4

; Function: tree
;[ORIGIN]   %cmp10.us = icmp eq i64 %b.039.us, 4
%0:i64 = var (range=[0,5))
%1:i1 = eq 4:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %idxprom11.us = trunc i64 %add1.us to i32
%0:i64 = var (range=[0,5))
%1:i1 = eq 4:i64, %0
pc %1 0:i1
%2:i64 = var
%3:i64 = var
%4:i64 = var
%5:i64 = sub %0, %4 (hasExternalUses)
%6:i64 = mul %3, %5
%7:i64 = add %2, %6 (hasExternalUses)
%8:i32 = trunc %7
infer %8

; Function: tree
;[ORIGIN]   %7 = load i64, i64* %arrayidx12.us, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %add13.us = add i64 %7, %mul4.us
%0:i64 = var
%1:i64 = var
%2:i64 = var
%3:i64 = mul %1, %2 (hasExternalUses)
%4:i64 = add %0, %3
infer %4

; Function: tree
;[ORIGIN]   %b.0.us = add i64 %b.039.us, 1
%0:i64 = var (range=[0,5))
%1:i1 = eq 4:i64, %0
pc %1 0:i1
%2:i64 = add 1:i64, %0
infer %2

; Function: tree
;[ORIGIN]   %cmp.us = icmp ult i64 %b.0.us, 5
%0:i64 = var (range=[0,5))
%1:i1 = eq 4:i64, %0
pc %1 0:i1
%2:i64 = add 1:i64, %0 (hasExternalUses)
%3:i1 = ult %2, 5:i64
infer %3

; Function: tree
;[ORIGIN]   %b.039 = phi i64 [ %b.0, %._crit_edge ], [ %b.037, %.lr.ph41.split.preheader ]
%0:i64 = var (range=[0,5))
infer %0

; Function: tree
;[ORIGIN]   %sub = sub i64 %b.039, %br
%0:i64 = var (range=[0,5))
%1:i64 = var
%2:i64 = sub %0, %1
infer %2

; Function: tree
;[ORIGIN]   %mul = mul i64 %sub, %n
%0:i64 = var
%1:i64 = var (range=[0,5))
%2:i64 = var
%3:i64 = sub %1, %2 (hasExternalUses)
%4:i64 = mul %0, %3
infer %4

; Function: tree
;[ORIGIN]   %add1 = add i64 %mul, %sum
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i64 = mul %1, %4
%6:i64 = add %0, %5
infer %6

; Function: tree
;[ORIGIN]   %cmp2 = icmp ugt i64 %add1, 32
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i64 = mul %1, %4
%6:i64 = add %0, %5 (hasExternalUses)
%7:i1 = ult 32:i64, %6
infer %7

; Function: tree
;[ORIGIN]   %9 = load i64, i64* %arrayidx, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %cmp110.i = icmp ugt i64 %sub, 1
%0:i64 = var
%1:i64 = var
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i64 = mul %1, %4
%6:i64 = add %0, %5 (hasExternalUses)
%7:i1 = ult 32:i64, %6
pc %7 0:i1
%8:i1 = ult 1:i64, %4
infer %8

; Function: tree
;[ORIGIN]   %r.012.i = phi i64 [ %div.i, %.lr.ph.i ], [ %9, %.lr.ph.i.preheader ]
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %i.011.i = phi i64 [ %add2.i, %.lr.ph.i ], [ 1, %.lr.ph.i.preheader ]
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
infer %0

; Function: tree
;[ORIGIN]   %add.i = add i64 %i.011.i, %9
%0:i64 = var
%1:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%2:i64 = add %0, %1
infer %2

; Function: tree
;[ORIGIN]   %mul.i = mul i64 %add.i, %r.012.i
%0:i64 = var
%1:i64 = var
%2:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%3:i64 = add %1, %2
%4:i64 = mul %0, %3
infer %4

; Function: tree
;[ORIGIN]   %add2.i = add nuw nsw i64 %i.011.i, 1
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%1:i64 = addnw 1:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %div.i = udiv i64 %mul.i, %add2.i
%0:i64 = var
%1:i64 = var
%2:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%3:i64 = add %1, %2
%4:i64 = mul %0, %3
%5:i64 = addnw 1:i64, %2 (hasExternalUses)
%6:i64 = udiv %4, %5
infer %6

; Function: tree
;[ORIGIN]   %exitcond.i = icmp eq i64 %add2.i, %sub
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,6))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i64 = var (range=[0,5))
%3:i64 = var
%4:i64 = sub %2, %3 (hasExternalUses)
%5:i1 = eq %1, %4
infer %5

; Function: tree
;[ORIGIN]   %retval.0.i = phi i64 [ %9, %8 ], [ %div.i, %.lr.ph.i ]
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %mul4 = mul i64 %retval.0.i, %cnt
%0:i64 = var
%1:i64 = var
%2:i64 = mul %0, %1
infer %2

; Function: tree
;[ORIGIN]   %cmp6 = icmp ult i64 %mul5, %add1
%0:i64 = var
%1:i64 = shl %0, 1:i64 (hasExternalUses)
%2:i64 = var
%3:i64 = var
%4:i64 = var (range=[0,5))
%5:i64 = var
%6:i64 = sub %4, %5 (hasExternalUses)
%7:i64 = mul %3, %6
%8:i64 = add %2, %7 (hasExternalUses)
%9:i1 = ult %1, %8
infer %9

; Function: tree
;[ORIGIN]   %idxprom7 = trunc i64 %add1 to i32
%0:i64 = var
%1:i64 = shl %0, 1:i64 (hasExternalUses)
%2:i64 = var
%3:i64 = var
%4:i64 = var (range=[0,5))
%5:i64 = var
%6:i64 = sub %4, %5 (hasExternalUses)
%7:i64 = mul %3, %6
%8:i64 = add %2, %7 (hasExternalUses)
%9:i1 = ult %1, %8
pc %9 1:i1
%10:i32 = trunc %8
infer %10

; Function: tree
;[ORIGIN]   %11 = load i64, i64* %arrayidx8, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %add9 = add i64 %11, %mul4
%0:i64 = var
%1:i64 = var
%2:i64 = var
%3:i64 = mul %1, %2 (hasExternalUses)
%4:i64 = add %0, %3
infer %4

; Function: tree
;[ORIGIN]   %cmp10 = icmp eq i64 %b.039, 4
%0:i64 = var (range=[0,5))
%1:i1 = eq 4:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %idxprom11 = trunc i64 %add1 to i32
%0:i64 = var (range=[0,5))
%1:i1 = eq 4:i64, %0
pc %1 0:i1
%2:i64 = var
%3:i64 = var
%4:i64 = var
%5:i64 = sub %0, %4 (hasExternalUses)
%6:i64 = mul %3, %5
%7:i64 = add %2, %6 (hasExternalUses)
%8:i32 = trunc %7
infer %8

; Function: tree
;[ORIGIN]   %13 = load i64, i64* %arrayidx12, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %add13 = add i64 %13, %mul4
%0:i64 = var
%1:i64 = var
%2:i64 = var
%3:i64 = mul %1, %2 (hasExternalUses)
%4:i64 = add %0, %3
infer %4

; Function: tree
;[ORIGIN]   %dec36 = phi i64 [ %dec34, %.lr.ph ], [ %dec, %14 ]
%0:i64 = var
infer %0

; Function: tree
;[ORIGIN]   %dec = add i64 %dec36, -1
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %tobool = icmp eq i64 %dec, 0
%0:i64 = var
%1:i64 = add 18446744073709551615:i64, %0 (hasExternalUses)
%2:i1 = eq 0:i64, %1
infer %2

; Function: tree
;[ORIGIN]   %b.0 = add i64 %b.039, 1
%0:i64 = var (range=[0,5))
%1:i64 = add 1:i64, %0
infer %1

; Function: tree
;[ORIGIN]   %cmp = icmp ult i64 %b.0, 5
%0:i64 = var (range=[0,5))
%1:i64 = add 1:i64, %0 (hasExternalUses)
%2:i1 = ult %1, 5:i64
infer %2

; Function: bicenter
;[ORIGIN]   %and = and i32 %s, 1
%0:i32 = var
%1:i32 = and 1:i32, %0
infer %1

; Function: bicenter
;[ORIGIN]   %tobool = icmp eq i32 %and, 0
%0:i32 = var
%1:i32 = and 1:i32, %0
%2:i1 = eq 0:i32, %1
infer %2

; Function: bicenter
;[ORIGIN]   %div = sdiv i32 %s, 2
%0:i32 = var
%1:i32 = and 1:i32, %0
%2:i1 = eq 0:i32, %1
pc %2 1:i1
%3:i32 = sdiv %0, 2:i32
infer %3

; Function: bicenter
;[ORIGIN]   %2 = load i64, i64* %arrayidx, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: bicenter
;[ORIGIN]   %add = add i64 %2, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: bicenter
;[ORIGIN]   %mul = mul i64 %add, %2
%0:i64 = var
%1:i64 = add 1:i64, %0
%2:i64 = mul %0, %1
infer %2 (demandedBits=1111111111111111111111111111111111111111111111111111111111111110)

; Function: bicenter
;[ORIGIN]   %div3 = lshr i64 %mul, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
%2:i64 = mul %0, %1
%3:i64 = lshr %2, 1:i64
infer %3

; Function: bicenter
;[ORIGIN]   %3 = load i64, i64* %arrayidx4, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: bicenter
;[ORIGIN]   %add5 = add i64 %div3, %3
%0:i64 = var
%1:i64 = var
%2:i64 = add 1:i64, %1
%3:i64 = mul %1, %2
%4:i64 = lshr %3, 1:i64
%5:i64 = add %0, %4
infer %5

; Function: main
;[ORIGIN]   %n.09 = phi i64 [ 1, %0 ], [ %inc, %bicenter.exit ]
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,33))
infer %0

; Function: main
;[ORIGIN]   %conv = trunc i64 %n.09 to i32
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,33))
%1:i32 = trunc %0
infer %1

; Function: main
;[ORIGIN]   %and.i = and i32 %conv, 1
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,33))
%1:i32 = trunc %0 (hasExternalUses)
%2:i32 = and 1:i32, %1
infer %2

; Function: main
;[ORIGIN]   %tobool.i = icmp eq i32 %and.i, 0
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,33))
%1:i32 = trunc %0 (hasExternalUses)
%2:i32 = and 1:i32, %1
%3:i1 = eq 0:i32, %2
infer %3

; Function: main
;[ORIGIN]   %.pre = load i64, i64* %arrayidx.phi.trans.insert, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: main
;[ORIGIN]   %div.i8 = lshr i32 %conv, 1
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,33))
%1:i32 = trunc %0 (hasExternalUses)
%2:i32 = and 1:i32, %1
%3:i1 = eq 0:i32, %2
pc %3 1:i1
%4:i32 = lshr %1, 1:i32
infer %4

; Function: main
;[ORIGIN]   %3 = load i64, i64* %arrayidx.i, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: main
;[ORIGIN]   %add.i = add i64 %3, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
infer %1

; Function: main
;[ORIGIN]   %mul.i = mul i64 %add.i, %3
%0:i64 = var
%1:i64 = add 1:i64, %0
%2:i64 = mul %0, %1
infer %2 (demandedBits=1111111111111111111111111111111111111111111111111111111111111110)

; Function: main
;[ORIGIN]   %div3.i = lshr i64 %mul.i, 1
%0:i64 = var
%1:i64 = add 1:i64, %0
%2:i64 = mul %0, %1
%3:i64 = lshr %2, 1:i64
infer %3

; Function: main
;[ORIGIN]   %4 = load i64, i64* %arrayidx4.i, align 8, !tbaa !2
%0:i64 = var
infer %0

; Function: main
;[ORIGIN]   %add5.i = add i64 %div3.i, %4
%0:i64 = var
%1:i64 = var
%2:i64 = add 1:i64, %1
%3:i64 = mul %1, %2
%4:i64 = lshr %3, 1:i64
%5:i64 = add %0, %4
infer %5

; Function: main
;[ORIGIN]   %5 = phi i64 [ %.pre, %.bicenter.exit_crit_edge ], [ %add5.i, %2 ]
%0:i64 = var
infer %0

; Function: main
;[ORIGIN]   %inc = add nuw nsw i64 %n.09, 1
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,33))
%1:i64 = addnw 1:i64, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond = icmp eq i64 %inc, 33
%0:i64 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (nonZero) (range=[1,33))
%1:i64 = addnw 1:i64, %0 (hasExternalUses)
%2:i1 = eq 33:i64, %1
infer %2
```
**benchmark4pipeline_c/pascal_matrix_generation.bc**
```


; Function: pascal_low
;[ORIGIN]   %cmp40 = icmp sgt i32 %n, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: pascal_low
;[ORIGIN]   %i.041.us = phi i32 [ %inc16.us, %._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_low
;[ORIGIN]   %sub.us = add nsw i32 %i.041.us, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: pascal_low
;[ORIGIN]   %j.039.us = phi i32 [ 0, %.lr.ph.us ], [ %inc.us, %8 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_low
;[ORIGIN]   %cmp2.us = icmp ult i32 %i.041.us, %j.039.us
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
infer %2

; Function: pascal_low
;[ORIGIN]   %cmp4.us = icmp eq i32 %i.041.us, %j.039.us
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
pc %2 0:i1
%3:i1 = eq %0, %1
infer %3

; Function: pascal_low
;[ORIGIN]   %cmp5.us = icmp eq i32 %j.039.us, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
pc %2 0:i1
%3:i1 = eq 0:i32, %1
infer %3

; Function: pascal_low
;[ORIGIN]   %or.cond.us = or i1 %cmp4.us, %cmp5.us
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
pc %2 0:i1
%3:i1 = eq 0:i32, %1
%4:i1 = eq %0, %1
%5:i1 = or %3, %4
infer %5

; Function: pascal_low
;[ORIGIN]   %sub9.us = add nsw i32 %j.039.us, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
pc %2 0:i1
%3:i1 = eq 0:i32, %1
%4:i1 = eq %0, %1
%5:i1 = or %3, %4
pc %5 0:i1
%6:i32 = addnsw 4294967295:i32, %1
infer %6

; Function: pascal_low
;[ORIGIN]   %6 = load i32, i32* %arrayidx10.us, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: pascal_low
;[ORIGIN]   %7 = load i32, i32* %arrayidx13.us, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: pascal_low
;[ORIGIN]   %add.us = add nsw i32 %7, %6
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: pascal_low
;[ORIGIN]   %.sink = phi i32 [ %add.us, %4 ], [ 1, %3 ], [ 0, %2 ]
%0:i32 = var
infer %0

; Function: pascal_low
;[ORIGIN]   %inc.us = add nuw nsw i32 %j.039.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_low
;[ORIGIN]   %exitcond = icmp eq i32 %inc.us, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: pascal_low
;[ORIGIN]   %inc16.us = add nuw nsw i32 %i.041.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_low
;[ORIGIN]   %exitcond46 = icmp eq i32 %inc16.us, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
pc %3 1:i1
%4:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%5:i32 = addnw 1:i32, %4 (hasExternalUses)
%6:i1 = eq %0, %5
infer %6

; Function: pascal_upp
;[ORIGIN]   %cmp40 = icmp sgt i32 %n, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: pascal_upp
;[ORIGIN]   %i.041.us = phi i32 [ %inc16.us, %._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_upp
;[ORIGIN]   %cmp5.us = icmp eq i32 %i.041.us, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
infer %1

; Function: pascal_upp
;[ORIGIN]   %sub.us = add nsw i32 %i.041.us, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: pascal_upp
;[ORIGIN]   %j.039.us47 = phi i32 [ %inc.us56, %11 ], [ 0, %.lr.ph..lr.ph.split_crit_edge.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_upp
;[ORIGIN]   %cmp2.us48 = icmp ugt i32 %i.041.us, %j.039.us47
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
infer %2

; Function: pascal_upp
;[ORIGIN]   %cmp4.us = icmp eq i32 %i.041.us, %j.039.us47
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
pc %2 0:i1
%3:i1 = eq %1, %0
infer %3

; Function: pascal_upp
;[ORIGIN]   %sub9.us49 = add nsw i32 %j.039.us47, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i1 = ult %0, %1
pc %2 0:i1
%3:i1 = eq %1, %0
pc %3 0:i1
%4:i32 = addnsw 4294967295:i32, %0
infer %4

; Function: pascal_upp
;[ORIGIN]   %4 = load i32, i32* %arrayidx10.us50, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: pascal_upp
;[ORIGIN]   %6 = load i32, i32* %arrayidx13.us51, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: pascal_upp
;[ORIGIN]   %add.us52 = add nsw i32 %6, %4
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: pascal_upp
;[ORIGIN]   %.sink = phi i32 [ 0, %9 ], [ 1, %7 ], [ %add.us52, %2 ]
%0:i32 = var
infer %0

; Function: pascal_upp
;[ORIGIN]   %inc.us56 = add nuw nsw i32 %j.039.us47, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_upp
;[ORIGIN]   %exitcond = icmp eq i32 %inc.us56, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: pascal_upp
;[ORIGIN]   %inc16.us = add nuw nsw i32 %i.041.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_upp
;[ORIGIN]   %exitcond62 = icmp eq i32 %inc16.us, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: pascal_upp
;[ORIGIN]   %j.039.us.us = phi i32 [ 0, %.lr.ph.split.us.us ], [ %inc.us.us, %12 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_upp
;[ORIGIN]   %inc.us.us = add nuw nsw i32 %j.039.us.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_upp
;[ORIGIN]   %exitcond61 = icmp eq i32 %inc.us.us, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: pascal_sym
;[ORIGIN]   %cmp30 = icmp sgt i32 %n, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: pascal_sym
;[ORIGIN]   %i.031.us = phi i32 [ %inc12.us, %._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_sym
;[ORIGIN]   %cmp2.us = icmp eq i32 %i.031.us, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
infer %1

; Function: pascal_sym
;[ORIGIN]   %sub.us = add nsw i32 %i.031.us, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: pascal_sym
;[ORIGIN]   %j.029.us35 = phi i32 [ %inc.us42, %8 ], [ 0, %.lr.ph..lr.ph.split_crit_edge.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_sym
;[ORIGIN]   %cmp3.us = icmp eq i32 %j.029.us35, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
infer %1

; Function: pascal_sym
;[ORIGIN]   %3 = load i32, i32* %arrayidx6.us36, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: pascal_sym
;[ORIGIN]   %sub8.us37 = add nsw i32 %j.029.us35, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: pascal_sym
;[ORIGIN]   %5 = load i32, i32* %arrayidx9.us38, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: pascal_sym
;[ORIGIN]   %add.us39 = add nsw i32 %5, %3
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: pascal_sym
;[ORIGIN]   %inc.us42 = add nuw nsw i32 %j.029.us35, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_sym
;[ORIGIN]   %exitcond = icmp eq i32 %inc.us42, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: pascal_sym
;[ORIGIN]   %inc12.us = add nuw nsw i32 %i.031.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_sym
;[ORIGIN]   %exitcond48 = icmp eq i32 %inc12.us, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: pascal_sym
;[ORIGIN]   %j.029.us.us = phi i32 [ 0, %.lr.ph.split.us.us ], [ %inc.us.us, %9 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: pascal_sym
;[ORIGIN]   %inc.us.us = add nuw nsw i32 %j.029.us.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: pascal_sym
;[ORIGIN]   %exitcond47 = icmp eq i32 %inc.us.us, %n
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: main
;[ORIGIN]   %12 = load i32, i32* %arrayidx10.us50.i.2.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us52.i.2.1 = add nsw i32 %12, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %13 = load i32, i32* %arrayidx10.us50.i.3.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us52.i.3.1 = add nsw i32 %add.us52.i.2.1, %13
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 1:i32, %1 (hasExternalUses)
%3:i32 = addnsw %0, %2
infer %3

; Function: main
;[ORIGIN]   %14 = load i32, i32* %arrayidx10.us50.i.4.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us52.i.4.1 = add nsw i32 %add.us52.i.3.1, %14
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i32 = addnsw %1, %3 (hasExternalUses)
%5:i32 = addnsw %0, %4
infer %5

; Function: main
;[ORIGIN]   %16 = load i32, i32* %arrayidx10.us50.i.3.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us52.i.3.2 = add nsw i32 %16, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %17 = load i32, i32* %arrayidx10.us50.i.4.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us52.i.4.2 = add nsw i32 %add.us52.i.3.2, %17
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 1:i32, %1 (hasExternalUses)
%3:i32 = addnsw %0, %2
infer %3

; Function: main
;[ORIGIN]   %19 = load i32, i32* %arrayidx10.us50.i.4.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us52.i.4.3 = add nsw i32 %19, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %.pre.pre = load i32, i32* %10, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %22 = load i32, i32* %arrayidx6.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %23 = load i32, i32* %arrayidx6.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %25 = load i32, i32* %arrayidx6.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %26 = load i32, i32* %arrayidx6.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %28 = load i32, i32* %27, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %29 = load i32, i32* %arrayidx6.1.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %30 = load i32, i32* %arrayidx6.2.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %32 = load i32, i32* %arrayidx6.3.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %33 = load i32, i32* %arrayidx6.4.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %35 = load i32, i32* %34, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %36 = load i32, i32* %arrayidx6.1.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %37 = load i32, i32* %arrayidx6.2.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %39 = load i32, i32* %arrayidx6.3.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %40 = load i32, i32* %arrayidx6.4.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %42 = load i32, i32* %41, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %43 = load i32, i32* %arrayidx6.1.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %44 = load i32, i32* %arrayidx6.2.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %46 = load i32, i32* %arrayidx6.3.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %47 = load i32, i32* %arrayidx6.4.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %49 = load i32, i32* %48, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %50 = load i32, i32* %arrayidx6.1.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %51 = load i32, i32* %arrayidx6.2.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %53 = load i32, i32* %arrayidx6.3.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %54 = load i32, i32* %arrayidx6.4.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %58 = load i32, i32* %56, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %59 = load i32, i32* %arrayidx13.us.i.1.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us.i.1.2 = add nsw i32 %59, %58
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %61 = load i32, i32* %57, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %62 = load i32, i32* %arrayidx13.us.i.1.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us.i.1.3 = add nsw i32 %62, %61
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %63 = load i32, i32* %arrayidx10.us.i.2.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %64 = load i32, i32* %arrayidx13.us.i.2.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us.i.2.3 = add nsw i32 %64, %63
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %66 = load i32, i32* %60, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %67 = load i32, i32* %arrayidx13.us.i.1.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us.i.1.4 = add nsw i32 %67, %66
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %68 = load i32, i32* %arrayidx10.us.i.2.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %69 = load i32, i32* %arrayidx13.us.i.2.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us.i.2.4 = add nsw i32 %69, %68
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %70 = load i32, i32* %arrayidx10.us.i.3.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %71 = load i32, i32* %arrayidx13.us.i.3.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us.i.3.4 = add nsw i32 %71, %70
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw %0, %1
infer %2

; Function: main
;[ORIGIN]   %.pre167 = load i32, i32* %55, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %73 = load i32, i32* %arrayidx15.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %74 = load i32, i32* %arrayidx15.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %76 = load i32, i32* %arrayidx15.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %77 = load i32, i32* %arrayidx15.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %79 = load i32, i32* %78, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %80 = load i32, i32* %arrayidx15.1.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %81 = load i32, i32* %arrayidx15.2.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %83 = load i32, i32* %arrayidx15.3.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %84 = load i32, i32* %arrayidx15.4.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %86 = load i32, i32* %85, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %87 = load i32, i32* %arrayidx15.1.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %88 = load i32, i32* %arrayidx15.2.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %90 = load i32, i32* %arrayidx15.3.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %91 = load i32, i32* %arrayidx15.4.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %93 = load i32, i32* %92, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %94 = load i32, i32* %arrayidx15.1.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %95 = load i32, i32* %arrayidx15.2.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %97 = load i32, i32* %arrayidx15.3.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %98 = load i32, i32* %arrayidx15.4.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %100 = load i32, i32* %99, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %101 = load i32, i32* %arrayidx15.1.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %102 = load i32, i32* %arrayidx15.2.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %104 = load i32, i32* %arrayidx15.3.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %105 = load i32, i32* %arrayidx15.4.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %107 = load i32, i32* %arrayidx6.us36.i.1.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.1.1 = add nsw i32 %107, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %108 = load i32, i32* %arrayidx6.us36.i.2.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.2.1 = add nsw i32 %add.us39.i.1.1, %108
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 1:i32, %1 (hasExternalUses)
%3:i32 = addnsw %0, %2
infer %3

; Function: main
;[ORIGIN]   %109 = load i32, i32* %arrayidx6.us36.i.3.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.3.1 = add nsw i32 %add.us39.i.2.1, %109
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i32 = addnsw %1, %3 (hasExternalUses)
%5:i32 = addnsw %0, %4
infer %5

; Function: main
;[ORIGIN]   %110 = load i32, i32* %arrayidx6.us36.i.4.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.4.1 = add nsw i32 %add.us39.i.3.1, %110
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = var
%4:i32 = addnsw 1:i32, %3 (hasExternalUses)
%5:i32 = addnsw %2, %4 (hasExternalUses)
%6:i32 = addnsw %1, %5 (hasExternalUses)
%7:i32 = addnsw %0, %6
infer %7

; Function: main
;[ORIGIN]   %112 = load i32, i32* %arrayidx6.us36.i.1.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.1.2 = add nsw i32 %112, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %113 = load i32, i32* %arrayidx6.us36.i.2.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.2.2 = add nsw i32 %add.us39.i.1.2, %113
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 1:i32, %1 (hasExternalUses)
%3:i32 = addnsw %0, %2
infer %3

; Function: main
;[ORIGIN]   %114 = load i32, i32* %arrayidx6.us36.i.3.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.3.2 = add nsw i32 %add.us39.i.2.2, %114
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i32 = addnsw %1, %3 (hasExternalUses)
%5:i32 = addnsw %0, %4
infer %5

; Function: main
;[ORIGIN]   %115 = load i32, i32* %arrayidx6.us36.i.4.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.4.2 = add nsw i32 %add.us39.i.3.2, %115
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = var
%4:i32 = addnsw 1:i32, %3 (hasExternalUses)
%5:i32 = addnsw %2, %4 (hasExternalUses)
%6:i32 = addnsw %1, %5 (hasExternalUses)
%7:i32 = addnsw %0, %6
infer %7

; Function: main
;[ORIGIN]   %117 = load i32, i32* %arrayidx6.us36.i.1.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.1.3 = add nsw i32 %117, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %118 = load i32, i32* %arrayidx6.us36.i.2.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.2.3 = add nsw i32 %add.us39.i.1.3, %118
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 1:i32, %1 (hasExternalUses)
%3:i32 = addnsw %0, %2
infer %3

; Function: main
;[ORIGIN]   %119 = load i32, i32* %arrayidx6.us36.i.3.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.3.3 = add nsw i32 %add.us39.i.2.3, %119
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i32 = addnsw %1, %3 (hasExternalUses)
%5:i32 = addnsw %0, %4
infer %5

; Function: main
;[ORIGIN]   %120 = load i32, i32* %arrayidx6.us36.i.4.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.4.3 = add nsw i32 %add.us39.i.3.3, %120
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = var
%4:i32 = addnsw 1:i32, %3 (hasExternalUses)
%5:i32 = addnsw %2, %4 (hasExternalUses)
%6:i32 = addnsw %1, %5 (hasExternalUses)
%7:i32 = addnsw %0, %6
infer %7

; Function: main
;[ORIGIN]   %122 = load i32, i32* %arrayidx6.us36.i.1.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.1.4 = add nsw i32 %122, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %123 = load i32, i32* %arrayidx6.us36.i.2.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.2.4 = add nsw i32 %add.us39.i.1.4, %123
%0:i32 = var
%1:i32 = var
%2:i32 = addnsw 1:i32, %1 (hasExternalUses)
%3:i32 = addnsw %0, %2
infer %3

; Function: main
;[ORIGIN]   %124 = load i32, i32* %arrayidx6.us36.i.3.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.3.4 = add nsw i32 %add.us39.i.2.4, %124
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = addnsw 1:i32, %2 (hasExternalUses)
%4:i32 = addnsw %1, %3 (hasExternalUses)
%5:i32 = addnsw %0, %4
infer %5

; Function: main
;[ORIGIN]   %125 = load i32, i32* %arrayidx6.us36.i.4.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %add.us39.i.4.4 = add nsw i32 %add.us39.i.3.4, %125
%0:i32 = var
%1:i32 = var
%2:i32 = var
%3:i32 = var
%4:i32 = addnsw 1:i32, %3 (hasExternalUses)
%5:i32 = addnsw %2, %4 (hasExternalUses)
%6:i32 = addnsw %1, %5 (hasExternalUses)
%7:i32 = addnsw %0, %6
infer %7

; Function: main
;[ORIGIN]   %.pre168.pre = load i32, i32* %.pre.i, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %127 = load i32, i32* %arrayidx26.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %128 = load i32, i32* %arrayidx26.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %130 = load i32, i32* %arrayidx26.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %131 = load i32, i32* %arrayidx26.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %133 = load i32, i32* %132, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %134 = load i32, i32* %arrayidx26.1.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %135 = load i32, i32* %arrayidx26.2.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %137 = load i32, i32* %arrayidx26.3.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %138 = load i32, i32* %arrayidx26.4.1, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %140 = load i32, i32* %139, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %141 = load i32, i32* %arrayidx26.1.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %142 = load i32, i32* %arrayidx26.2.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %144 = load i32, i32* %arrayidx26.3.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %145 = load i32, i32* %arrayidx26.4.2, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %147 = load i32, i32* %146, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %148 = load i32, i32* %arrayidx26.1.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %149 = load i32, i32* %arrayidx26.2.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %151 = load i32, i32* %arrayidx26.3.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %152 = load i32, i32* %arrayidx26.4.3, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %154 = load i32, i32* %153, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %155 = load i32, i32* %arrayidx26.1.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %156 = load i32, i32* %arrayidx26.2.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %158 = load i32, i32* %arrayidx26.3.4, align 4, !tbaa !6
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %159 = load i32, i32* %arrayidx26.4.4, align 4, !tbaa !6
%0:i32 = var
infer %0
```
**benchmark4pipeline_c/resistor_mesh.bc**
```


; Function: alloc2
;[ORIGIN]   %mul1 = shl i32 %w, 4
%0:i32 = var
%1:i32 = shl %0, 4:i32
infer %1 (demandedBits=11111111111111111111111111111011)

; Function: alloc2
;[ORIGIN]   %mul217 = or i32 %mul1, 4
%0:i32 = var
%1:i32 = shl %0, 4:i32
%2:i32 = or 4:i32, %1
infer %2

; Function: alloc2
;[ORIGIN]   %add = mul i32 %mul217, %h
%0:i32 = var
%1:i32 = var
%2:i32 = shl %1, 4:i32
%3:i32 = or 4:i32, %2
%4:i32 = mul %0, %3
infer %4

; Function: alloc2
;[ORIGIN]   %cmp18 = icmp sgt i32 %h, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: alloc2
;[ORIGIN]   %i.019 = phi i32 [ 0, %.lr.ph ], [ %inc, %6 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: alloc2
;[ORIGIN]   %tobool = icmp eq i32 %i.019, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
infer %1

; Function: alloc2
;[ORIGIN]   %sub = add nsw i32 %i.019, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: alloc2
;[ORIGIN]   %inc = add nuw nsw i32 %i.019, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: alloc2
;[ORIGIN]   %exitcond = icmp eq i32 %inc, %h
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: calc_diff
;[ORIGIN]   %cmp86 = icmp sgt i32 %h, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %cmp183 = icmp sgt i32 %w, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %i.087 = phi i32 [ 0, %.lr.ph90 ], [ %inc39.pre-phi, %._crit_edge ]
%0:i32 = var
infer %0

; Function: calc_diff
;[ORIGIN]   %.pre96 = add nuw nsw i32 %i.087, 1
%0:i32 = var
%1:i32 = addnw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %tobool = icmp eq i32 %i.087, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %add11 = add nuw nsw i32 %i.087, 1
%0:i32 = var
%1:i32 = addnw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %cmp12 = icmp slt i32 %add11, %h
%0:i32 = var
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: calc_diff
;[ORIGIN]   %j.084.us = phi i32 [ %add19.us, %13 ], [ 0, %.lr.ph.split.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: calc_diff
;[ORIGIN]   %tobool4.us = icmp eq i32 %j.084.us, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %sub6.us = add nsw i32 %j.084.us, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: calc_diff
;[ORIGIN]   %n.1.us = phi i32 [ 1, %4 ], [ 0, %.lr.ph.split.us ]
%0:i32 = var (knownBits=0000000000000000000000000000000x) (nonNegative) (signBits=31) (range=[0,2))
infer %0

; Function: calc_diff
;[ORIGIN]   %inc18.us = add nuw nsw i32 %n.1.us, 1
%0:i32 = var (knownBits=0000000000000000000000000000000x) (nonNegative) (signBits=31) (range=[0,2))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %n.2.us = phi i32 [ %inc18.us, %7 ], [ %n.1.us, %6 ]
%0:i32 = var (signBits=30) (range=[0,3))
infer %0

; Function: calc_diff
;[ORIGIN]   %add19.us = add nuw nsw i32 %j.084.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %cmp20.us = icmp slt i32 %add19.us, %w
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: calc_diff
;[ORIGIN]   %inc26.us = add nsw i32 %n.2.us, 1
%0:i32 = var (signBits=30) (range=[0,3))
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %n.3.us = phi i32 [ %inc26.us, %11 ], [ %n.2.us, %10 ]
%0:i32 = var (signBits=29) (range=[0,4))
infer %0

; Function: calc_diff
;[ORIGIN]   %15 = load i32, i32* %fixed.us, align 8, !tbaa !10
%0:i32 = var
infer %0

; Function: calc_diff
;[ORIGIN]   %tobool36.us = icmp eq i32 %15, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %exitcond94 = icmp eq i32 %add19.us, %w
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: calc_diff
;[ORIGIN]   %sub = add nsw i32 %i.087, -1
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: calc_diff
;[ORIGIN]   %j.084 = phi i32 [ 0, %.lr.ph.split ], [ %add19, %27 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: calc_diff
;[ORIGIN]   %tobool4 = icmp eq i32 %j.084, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %sub6 = add nsw i32 %j.084, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: calc_diff
;[ORIGIN]   %n.1 = phi i32 [ 2, %18 ], [ 1, %16 ]
%0:i32 = var (knownBits=000000000000000000000000000000xx) (nonNegative) (nonZero) (signBits=30) (range=[1,3))
infer %0

; Function: calc_diff
;[ORIGIN]   %inc18 = add nuw nsw i32 %n.1, 1
%0:i32 = var (knownBits=000000000000000000000000000000xx) (nonNegative) (nonZero) (signBits=30) (range=[1,3))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %n.2 = phi i32 [ %inc18, %21 ], [ %n.1, %20 ]
%0:i32 = var (signBits=29) (range=[1,4))
infer %0

; Function: calc_diff
;[ORIGIN]   %add19 = add nuw nsw i32 %j.084, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %cmp20 = icmp slt i32 %add19, %w
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = slt %1, %2
infer %3

; Function: calc_diff
;[ORIGIN]   %inc26 = add nsw i32 %n.2, 1
%0:i32 = var (signBits=29) (range=[1,4))
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %n.3 = phi i32 [ %inc26, %25 ], [ %n.2, %24 ]
%0:i32 = var (signBits=28) (range=[1,5))
infer %0

; Function: calc_diff
;[ORIGIN]   %29 = load i32, i32* %fixed, align 8, !tbaa !10
%0:i32 = var
infer %0

; Function: calc_diff
;[ORIGIN]   %tobool36 = icmp eq i32 %29, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: calc_diff
;[ORIGIN]   %exitcond = icmp eq i32 %add19, %w
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: calc_diff
;[ORIGIN]   %inc39.pre-phi = phi i32 [ %.pre96, %.._crit_edge_crit_edge ], [ %add11, %13 ], [ %add11, %27 ]
%0:i32 = var
infer %0

; Function: calc_diff
;[ORIGIN]   %exitcond95 = icmp eq i32 %inc39.pre-phi, %h
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: iter
;[ORIGIN]   %mul1.i = shl i32 %w, 4
%0:i32 = var
%1:i32 = shl %0, 4:i32
infer %1 (demandedBits=11111111111111111111111111111011)

; Function: iter
;[ORIGIN]   %mul217.i = or i32 %mul1.i, 4
%0:i32 = var
%1:i32 = shl %0, 4:i32
%2:i32 = or 4:i32, %1
infer %2

; Function: iter
;[ORIGIN]   %add.i = mul i32 %mul217.i, %h
%0:i32 = var
%1:i32 = var
%2:i32 = shl %1, 4:i32
%3:i32 = or 4:i32, %2
%4:i32 = mul %0, %3
infer %4

; Function: iter
;[ORIGIN]   %cmp18.i = icmp sgt i32 %h, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %i.019.i = phi i32 [ 0, %.lr.ph.i ], [ %inc.i, %6 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: iter
;[ORIGIN]   %tobool.i = icmp eq i32 %i.019.i, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %sub.i = add nsw i32 %i.019.i, -1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: iter
;[ORIGIN]   %inc.i = add nuw nsw i32 %i.019.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %exitcond.i = icmp eq i32 %inc.i, %h
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: iter
;[ORIGIN]   %cmp383 = icmp sgt i32 %w, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %cmp.us = fcmp ogt double %call1.us, 0x3AF357C299A88EA7
%0:i1 = var
infer %0

; Function: iter
;[ORIGIN]   %i.089.us.us = phi i32 [ %inc8.us.us, %._crit_edge87.us.us ], [ 0, %.lr.ph86.us.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: iter
;[ORIGIN]   %inc8.us.us = add nuw nsw i32 %i.089.us.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %exitcond115 = icmp eq i32 %inc8.us.us, %h
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: iter
;[ORIGIN]   %j.084.us.us = phi i32 [ 0, %.lr.ph86.us.us ], [ %inc.us.us, %12 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: iter
;[ORIGIN]   %inc.us.us = add nuw nsw i32 %j.084.us.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %exitcond114 = icmp eq i32 %inc.us.us, %w
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: iter
;[ORIGIN]   %cmp = fcmp ogt double %call1, 0x3AF357C299A88EA7
%0:i1 = var
infer %0

; Function: iter
;[ORIGIN]   %sub20 = add nsw i32 %h, -1
%0:i32 = var
%1:i1 = slt 0:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: iter
;[ORIGIN]   %sub23 = add nsw i32 %w, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %i.179.us = phi i32 [ %inc34.us, %._crit_edge.us ], [ 0, %.lr.ph.us.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: iter
;[ORIGIN]   %tobool.us = icmp ne i32 %i.179.us, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = ne 0:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %lnot.ext.us = zext i1 %tobool.us to i32
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = ne 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: iter
;[ORIGIN]   %cmp21.us = icmp slt i32 %i.179.us, %sub20
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1
%3:i1 = slt %0, %2
infer %3

; Function: iter
;[ORIGIN]   %conv.us = zext i1 %cmp21.us to i32
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1
%3:i1 = slt %0, %2
%4:i32 = zext %3
infer %4

; Function: iter
;[ORIGIN]   %add.us = add nuw nsw i32 %conv.us, %lnot.ext.us
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = ne 0:i32, %0
%2:i32 = zext %1
%3:i32 = var
%4:i32 = addnsw 4294967295:i32, %3
%5:i1 = slt %0, %4
%6:i32 = zext %5
%7:i32 = addnw %2, %6
infer %7

; Function: iter
;[ORIGIN]   %j.177.us = phi i32 [ 0, %.lr.ph.us ], [ %inc33.us, %19 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: iter
;[ORIGIN]   %tobool15.us = icmp ne i32 %j.177.us, 0
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = ne 0:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %lnot.ext19.us = zext i1 %tobool15.us to i32
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = ne 0:i32, %0
%2:i32 = zext %1
infer %2

; Function: iter
;[ORIGIN]   %cmp24.us = icmp slt i32 %j.177.us, %sub23
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1
%3:i1 = slt %0, %2
infer %3

; Function: iter
;[ORIGIN]   %conv25.us = zext i1 %cmp24.us to i32
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = var
%2:i32 = addnsw 4294967295:i32, %1
%3:i1 = slt %0, %2
%4:i32 = zext %3
infer %4

; Function: iter
;[ORIGIN]   %add22.us = add nuw nsw i32 %add.us, %lnot.ext19.us
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = ne 0:i32, %0
%2:i32 = zext %1
%3:i32 = var
%4:i32 = addnsw 4294967295:i32, %3
%5:i1 = slt %0, %4
%6:i32 = zext %5
%7:i32 = addnw %2, %6
%8:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%9:i1 = ne 0:i32, %8
%10:i32 = zext %9
%11:i32 = addnw %7, %10
infer %11

; Function: iter
;[ORIGIN]   %add26.us = add nuw nsw i32 %add22.us, %conv25.us
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i1 = ne 0:i32, %0
%2:i32 = zext %1
%3:i32 = var
%4:i32 = addnsw 4294967295:i32, %3
%5:i1 = slt %0, %4
%6:i32 = zext %5
%7:i32 = addnw %2, %6
%8:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%9:i1 = ne 0:i32, %8
%10:i32 = zext %9
%11:i32 = addnw %7, %10
%12:i32 = var
%13:i32 = addnsw 4294967295:i32, %12
%14:i1 = slt %8, %13
%15:i32 = zext %14
%16:i32 = addnw %11, %15
infer %16

; Function: iter
;[ORIGIN]   %21 = load i32, i32* %fixed.us, align 8, !tbaa !6
%0:i32 = var
infer %0

; Function: iter
;[ORIGIN]   %add30.us = add nsw i32 %21, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %inc33.us = add nuw nsw i32 %j.177.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %exitcond = icmp eq i32 %inc33.us, %w
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: iter
;[ORIGIN]   %inc34.us = add nuw nsw i32 %i.179.us, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: iter
;[ORIGIN]   %exitcond111 = icmp eq i32 %inc34.us, %h
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3
```
**benchmark4pipeline_c/run-length_encoding.bc**
```


; Function: sget
;[ORIGIN]   %4 = load i32, i32* %3, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: sget
;[ORIGIN]   %5 = load i8, i8* %arrayidx, align 1, !tbaa !9
%0:i8 = var
infer %0

; Function: sget
;[ORIGIN]   %cmp = icmp eq i8 %5, 0
%0:i8 = var
%1:i1 = eq 0:i8, %0
infer %1

; Function: sget
;[ORIGIN]   %conv = zext i8 %5 to i32
%0:i8 = var
%1:i1 = eq 0:i8, %0
pc %1 0:i1
%2:i32 = zext %0
infer %2

; Function: sget
;[ORIGIN]   %inc = add nsw i32 %4, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: sget
;[ORIGIN]   %retval.0 = phi i32 [ %conv, %6 ], [ -1, %0 ]
%0 = block 2
%1:i8 = var
%2:i32 = zext %1
%3:i32 = phi %0, %2, 4294967295:i32
infer %3

; Function: sput
;[ORIGIN]   %cmp = icmp eq i32 %c, -1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0
infer %1

; Function: sput
;[ORIGIN]   %1 = trunc i32 %c to i8
%0:i32 = var
%1:i8 = trunc %0
infer %1

; Function: sput
;[ORIGIN]   %conv = select i1 %cmp, i8 0, i8 %1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0 (hasExternalUses)
%2:i8 = trunc %0
%3:i8 = select %1, 0:i8, %2
infer %3

; Function: sput
;[ORIGIN]   %5 = load i32, i32* %4, align 4, !tbaa !8
%0:i32 = var
infer %0

; Function: sput
;[ORIGIN]   %inc = add nsw i32 %5, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: file_put
;[ORIGIN]   %call = tail call i32 @fputc(i32 %c, %struct._IO_FILE* %2)
%0:i32 = var
infer %0

; Function: output
;[ORIGIN]   %add = add nsw i32 %len, 128
%0:i32 = var
%1:i32 = addnsw 128:i32, %0
infer %1

; Function: output
;[ORIGIN]   %cmp10 = icmp sgt i32 %len, 0
%0:i32 = var
%1:i1 = slt 0:i32, %0
infer %1

; Function: output
;[ORIGIN]   %i.011 = phi i32 [ %inc, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: output
;[ORIGIN]   %3 = load i8, i8* %arrayidx, align 1, !tbaa !7
%0:i8 = var
infer %0

; Function: output
;[ORIGIN]   %conv = zext i8 %3 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: output
;[ORIGIN]   %inc = add nuw nsw i32 %i.011, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: output
;[ORIGIN]   %exitcond = icmp eq i32 %inc, %len
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: encode
;[ORIGIN]   %len.0.ph97 = phi i32 [ 0, %0 ], [ %len.0.ph.be, %.outer.backedge ]
%0:i32 = var
infer %0

; Function: encode
;[ORIGIN]   %repeat.0.ph96 = phi i32 [ 0, %0 ], [ %repeat.0.ph.be, %.outer.backedge ]
%0:i32 = var
infer %0

; Function: encode
;[ORIGIN]   %call98 = tail call i32 %2(%struct.stream_t* %in) #4
%0:i32 = var
infer %0

; Function: encode
;[ORIGIN]   %cmp99 = icmp eq i32 %call98, -1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %call = tail call i32 %2(%struct.stream_t* %in) #4
%0:i32 = var
infer %0

; Function: encode
;[ORIGIN]   %cmp = icmp eq i32 %call, -1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %call101 = phi i32 [ %call, %4 ], [ %call98, %.lr.ph102.preheader ]
%0:i32 = var (range=[0,-1))
infer %0 (demandedBits=00000000000000000000000011111111)

; Function: encode
;[ORIGIN]   %len.094100 = phi i32 [ %inc, %4 ], [ %len.0.ph97, %.lr.ph102.preheader ]
%0:i32 = var
infer %0

; Function: encode
;[ORIGIN]   %conv5 = trunc i32 %call101 to i8
%0:i32 = var (range=[0,-1))
%1:i8 = trunc %0
infer %1

; Function: encode
;[ORIGIN]   %inc = add nsw i32 %len.094100, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %cmp6 = icmp slt i32 %len.094100, 1
%0:i32 = var
%1:i1 = slt %0, 1:i32
infer %1

; Function: encode
;[ORIGIN]   %cmp.lcssa = phi i1 [ true, %.lr.ph ], [ false, %.lr.ph102 ], [ true, %4 ]
%0:i1 = var
infer %0

; Function: encode
;[ORIGIN]   %len.1 = phi i32 [ %len.0.ph97, %.lr.ph ], [ %inc, %4 ], [ %inc, %.lr.ph102 ]
%0:i32 = var
infer %0

; Function: encode
;[ORIGIN]   %tobool8 = icmp eq i32 %repeat.0.ph96, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %sub = add nsw i32 %len.1, -1
%0:i32 = var
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %5 = load i8, i8* %arrayidx9, align 1, !tbaa !8
%0:i8 = var
infer %0

; Function: encode
;[ORIGIN]   %sub11 = add nsw i32 %len.1, -2
%0:i32 = var
%1:i32 = addnsw 4294967294:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %6 = load i8, i8* %arrayidx12, align 1, !tbaa !8
%0:i8 = var
infer %0

; Function: encode
;[ORIGIN]   %cmp35 = icmp eq i8 %5, %6
%0:i8 = var
%1:i8 = var
%2:i1 = eq %0, %1
infer %2

; Function: encode
;[ORIGIN]   %spec.select = select i1 %cmp35, i32 %repeat.0.ph96, i32 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i8 = var
%3:i8 = var
%4:i1 = eq %2, %3 (hasExternalUses)
%5:i32 = select %4, %0, 0:i32
infer %5

; Function: encode
;[ORIGIN]   %tobool16 = icmp eq i32 %spec.select, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i8 = var
%3:i8 = var
%4:i1 = eq %2, %3 (hasExternalUses)
%5:i32 = select %4, %0, 0:i32 (hasExternalUses)
%6:i1 = eq 0:i32, %5
infer %6

; Function: encode
;[ORIGIN]   %cmp17 = icmp eq i32 %len.1, 129
%0:i32 = var
%1:i1 = eq 129:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %or.cond = or i1 %cmp17, %tobool16
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i8 = var
%3:i8 = var
%4:i1 = eq %2, %3 (hasExternalUses)
%5:i32 = select %4, %0, 0:i32 (hasExternalUses)
%6:i1 = eq 0:i32, %5
%7:i32 = var
%8:i1 = eq 129:i32, %7
%9:i1 = or %6, %8
infer %9

; Function: encode
;[ORIGIN]   %or.cond49 = or i1 %cmp.lcssa, %or.cond
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i1 = var
%3:i8 = var
%4:i8 = var
%5:i1 = eq %3, %4 (hasExternalUses)
%6:i32 = select %5, %0, 0:i32 (hasExternalUses)
%7:i1 = eq 0:i32, %6
%8:i32 = var
%9:i1 = eq 129:i32, %8
%10:i1 = or %7, %9
%11:i1 = or %2, %10
infer %11

; Function: encode
;[ORIGIN]   %cond = select i1 %cmp.lcssa, i32 %len.1, i32 %sub
%0:i32 = var
%1:i1 = eq 0:i32, %0
pc %1 0:i1
%2:i1 = var
%3:i8 = var
%4:i8 = var
%5:i1 = eq %3, %4 (hasExternalUses)
%6:i32 = select %5, %0, 0:i32 (hasExternalUses)
%7:i1 = eq 0:i32, %6
%8:i32 = var
%9:i1 = eq 129:i32, %8
%10:i1 = or %7, %9
%11:i1 = or %2, %10
pc %11 1:i1
%12:i32 = addnsw 4294967295:i32, %8 (hasExternalUses)
%13:i32 = select %2, %8, %12
infer %13

; Function: encode
;[ORIGIN]   %9 = load i8, i8* %1, align 16, !tbaa !8
%0:i8 = var
infer %0

; Function: encode
;[ORIGIN]   %conv24 = zext i8 %9 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: encode
;[ORIGIN]   %cmp37 = icmp sgt i32 %len.1, 2
%0:i32 = var
%1:i1 = slt 2:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %add.i = add nsw i32 %len.1, 126
%0:i32 = var
%1:i1 = slt 2:i32, %0
pc %1 1:i1
%2:i32 = addnsw 126:i32, %0
infer %2

; Function: encode
;[ORIGIN]   %i.011.i = phi i32 [ 0, %.lr.ph.i ], [ %inc.i, %13 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: encode
;[ORIGIN]   %15 = load i8, i8* %arrayidx.i, align 1, !tbaa !8
%0:i8 = var
infer %0

; Function: encode
;[ORIGIN]   %conv.i = zext i8 %15 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: encode
;[ORIGIN]   %inc.i = add nuw nsw i32 %i.011.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %exitcond.i = icmp eq i32 %inc.i, %sub11
%0:i32 = var
%1:i32 = addnsw 4294967294:i32, %0 (hasExternalUses)
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: encode
;[ORIGIN]   %cmp44 = icmp eq i32 %len.1, 128
%0:i32 = var
%1:i1 = eq 128:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %or.cond50 = or i1 %cmp.lcssa, %cmp44
%0:i1 = var
%1:i32 = var
%2:i1 = eq 128:i32, %1
%3:i1 = or %0, %2
infer %3

; Function: encode
;[ORIGIN]   %add.i82 = add nsw i32 %len.1, 128
%0:i1 = var
%1:i32 = var
%2:i1 = eq 128:i32, %1
%3:i1 = or %0, %2
pc %3 1:i1
%4:i32 = addnsw 128:i32, %1
infer %4

; Function: encode
;[ORIGIN]   %cmp10.i84 = icmp sgt i32 %len.1, 0
%0:i1 = var
%1:i32 = var
%2:i1 = eq 128:i32, %1
%3:i1 = or %0, %2
pc %3 1:i1
%4:i1 = slt 0:i32, %1
infer %4

; Function: encode
;[ORIGIN]   %i.011.i86 = phi i32 [ %inc.i90, %.lr.ph.i85 ], [ 0, %.lr.ph.i85.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: encode
;[ORIGIN]   %20 = load i8, i8* %arrayidx.i87, align 1, !tbaa !8
%0:i8 = var
infer %0

; Function: encode
;[ORIGIN]   %conv.i88 = zext i8 %20 to i32
%0:i8 = var
%1:i32 = zext %0
infer %1

; Function: encode
;[ORIGIN]   %inc.i90 = add nuw nsw i32 %i.011.i86, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: encode
;[ORIGIN]   %exitcond.i91 = icmp eq i32 %inc.i90, %len.1
%0:i32 = var
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: encode
;[ORIGIN]   %repeat.0.ph.be = phi i32 [ 1, %output.exit ], [ 1, %11 ], [ %spec.select, %8 ], [ %repeat.0.ph96, %7 ], [ 0, %16 ], [ 0, %17 ], [ 0, %.lr.ph.i85 ]
%0:i32 = var
infer %0

; Function: encode
;[ORIGIN]   %len.0.ph.be = phi i32 [ 2, %output.exit ], [ %len.1, %11 ], [ 1, %8 ], [ %len.1, %7 ], [ %len.1, %16 ], [ 0, %17 ], [ 0, %.lr.ph.i85 ]
%0:i32 = var
infer %0

; Function: decode
;[ORIGIN]   %call39 = tail call i32 %1(%struct.stream_t* %in) #4
%0:i32 = var
infer %0

; Function: decode
;[ORIGIN]   %cmp40 = icmp eq i32 %call39, -1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0
infer %1

; Function: decode
;[ORIGIN]   %call41 = phi i32 [ %call39, %.lr.ph42 ], [ %call, %.loopexit ]
%0:i32 = var (range=[0,-1))
infer %0

; Function: decode
;[ORIGIN]   %cmp2 = icmp sgt i32 %call41, 128
%0:i32 = var (range=[0,-1))
%1:i1 = slt 128:i32, %0
infer %1

; Function: decode
;[ORIGIN]   %sub = add nsw i32 %call41, -128
%0:i32 = var (range=[0,-1))
%1:i1 = slt 128:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967168:i32, %0
infer %2

; Function: decode
;[ORIGIN]   %i.037 = phi i32 [ 0, %.lr.ph38 ], [ %inc, %3 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: decode
;[ORIGIN]   %call6 = tail call i32 %5(%struct.stream_t* nonnull %in) #4
%0:i32 = var
infer %0

; Function: decode
;[ORIGIN]   %inc = add nuw nsw i32 %i.037, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: decode
;[ORIGIN]   %exitcond44 = icmp eq i32 %inc, %sub
%0:i32 = var (range=[0,-1))
%1:i32 = addnsw 4294967168:i32, %0
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: decode
;[ORIGIN]   %call10 = tail call i32 %7(%struct.stream_t* nonnull %in) #4
%0:i32 = var
infer %0

; Function: decode
;[ORIGIN]   %cmp1134 = icmp sgt i32 %call41, 0
%0:i32 = var (range=[0,-1))
%1:i1 = slt 128:i32, %0
pc %1 0:i1
%2:i1 = slt 0:i32, %0
infer %2

; Function: decode
;[ORIGIN]   %i.135 = phi i32 [ %inc14, %.lr.ph ], [ 0, %.lr.ph.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: decode
;[ORIGIN]   %inc14 = add nuw nsw i32 %i.135, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: decode
;[ORIGIN]   %exitcond = icmp eq i32 %inc14, %call41
%0:i32 = var (range=[0,-1))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: decode
;[ORIGIN]   %call = tail call i32 %9(%struct.stream_t* %in) #4
%0:i32 = var
infer %0

; Function: decode
;[ORIGIN]   %cmp = icmp eq i32 %call, -1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %5 = load i32, i32* bitcast (%struct._IO_FILE** @stdout to i32*), align 4, !tbaa !14
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %call39.i = call i32 %10(%struct.stream_t* nonnull %8) #4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp40.i = icmp eq i32 %call39.i, -1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0
infer %1

; Function: main
;[ORIGIN]   %call41.i = phi i32 [ %call.i, %.loopexit.i ], [ %call39.i, %.lr.ph42.i.preheader ]
%0:i32 = var (range=[0,-1))
infer %0

; Function: main
;[ORIGIN]   %cmp2.i = icmp sgt i32 %call41.i, 128
%0:i32 = var (range=[0,-1))
%1:i1 = slt 128:i32, %0
infer %1

; Function: main
;[ORIGIN]   %sub.i = add nsw i32 %call41.i, -128
%0:i32 = var (range=[0,-1))
%1:i1 = slt 128:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967168:i32, %0
infer %2

; Function: main
;[ORIGIN]   %i.037.i = phi i32 [ 0, %.lr.ph38.i ], [ %inc.i, %11 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %call6.i = call i32 %13(%struct.stream_t* nonnull %8) #4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %inc.i = add nuw nsw i32 %i.037.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond44.i = icmp eq i32 %inc.i, %sub.i
%0:i32 = var (range=[0,-1))
%1:i32 = addnsw 4294967168:i32, %0
%2:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%3:i32 = addnw 1:i32, %2 (hasExternalUses)
%4:i1 = eq %1, %3
infer %4

; Function: main
;[ORIGIN]   %call10.i = call i32 %15(%struct.stream_t* nonnull %8) #4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp1134.i = icmp sgt i32 %call41.i, 0
%0:i32 = var (range=[0,-1))
%1:i1 = slt 128:i32, %0
pc %1 0:i1
%2:i1 = slt 0:i32, %0
infer %2

; Function: main
;[ORIGIN]   %i.135.i = phi i32 [ %inc14.i, %.lr.ph.i ], [ 0, %.lr.ph.i.preheader ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
infer %0

; Function: main
;[ORIGIN]   %inc14.i = add nuw nsw i32 %i.135.i, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: main
;[ORIGIN]   %exitcond.i = icmp eq i32 %inc14.i, %call41.i
%0:i32 = var (range=[0,-1))
%1:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,-2147483648))
%2:i32 = addnw 1:i32, %1 (hasExternalUses)
%3:i1 = eq %0, %2
infer %3

; Function: main
;[ORIGIN]   %call.i = call i32 %17(%struct.stream_t* nonnull %8) #4
%0:i32 = var
infer %0

; Function: main
;[ORIGIN]   %cmp.i = icmp eq i32 %call.i, -1
%0:i32 = var
%1:i1 = eq 4294967295:i32, %0
infer %1
```
**benchmark4pipeline_c/zebra_puzzle.bc**
```


; Function: printHouses
;[ORIGIN]   %i.063 = phi i32 [ 0, %0 ], [ %inc, %27 ]
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,5))
infer %0

; Function: printHouses
;[ORIGIN]   %3 = load i32, i32* %arrayidx2, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printHouses
;[ORIGIN]   %cmp3 = icmp sgt i32 %3, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: printHouses
;[ORIGIN]   %8 = load i32, i32* %arrayidx10, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printHouses
;[ORIGIN]   %cmp11 = icmp sgt i32 %8, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: printHouses
;[ORIGIN]   %13 = load i32, i32* %arrayidx18, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printHouses
;[ORIGIN]   %cmp19 = icmp sgt i32 %13, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: printHouses
;[ORIGIN]   %18 = load i32, i32* %arrayidx26, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printHouses
;[ORIGIN]   %cmp27 = icmp sgt i32 %18, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: printHouses
;[ORIGIN]   %23 = load i32, i32* %arrayidx34, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: printHouses
;[ORIGIN]   %cmp35 = icmp sgt i32 %23, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: printHouses
;[ORIGIN]   %inc = add nuw nsw i32 %i.063, 1
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,5))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: printHouses
;[ORIGIN]   %exitcond = icmp eq i32 %inc, 5
%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,5))
%1:i32 = addnw 1:i32, %0 (hasExternalUses)
%2:i1 = eq 5:i32, %1
infer %2

; Function: checkHouses
;[ORIGIN]   %1 = load i32, i32* %arrayidx1, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp = icmp slt i32 %1, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp4 = icmp eq i32 %1, 2
%0:i32 = var
%1:i1 = eq 2:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond567 = or i1 %cmp, %cmp4
%0:i32 = var
%1:i1 = eq 2:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %3 = load i32, i32* %arrayidx6, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp7 = icmp slt i32 %3, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp10 = icmp eq i32 %3, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond568 = or i1 %cmp7, %cmp10
%0:i32 = var
%1:i1 = eq 4:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %i.0637 = phi i32 [ %inc.pre-phi, %87 ], [ 0, %.preheader ]
%0:i32 = var (range=[0,5))
infer %0

; Function: checkHouses
;[ORIGIN]   %s_or.0636 = phi i32 [ %s_or.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %s_add.0635 = phi i32 [ %s_add.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %a_or.0634 = phi i32 [ %a_or.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %a_add.0633 = phi i32 [ %a_add.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %d_or.0632 = phi i32 [ %d_or.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %d_add.0631 = phi i32 [ %d_add.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %m_or.0630 = phi i32 [ %m_or.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %m_add.0629 = phi i32 [ %m_add.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %c_or.0628 = phi i32 [ %c_or.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %c_add.0627 = phi i32 [ %c_add.1, %87 ], [ 0, %.preheader ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %5 = load i32, i32* %arrayidx13, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp14 = icmp sgt i32 %5, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %shl = shl i32 1, %5
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = shl 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %add = add nsw i32 %shl, %c_add.0627
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = addnsw %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %or = or i32 %shl, %c_or.0628
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = or %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %c_add.1 = phi i32 [ %add, %6 ], [ %c_add.0627, %4 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %c_or.1 = phi i32 [ %or, %6 ], [ %c_or.0628, %4 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %8 = load i32, i32* %arrayidx21, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp22 = icmp sgt i32 %8, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %shl25 = shl i32 1, %8
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = shl 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %add26 = add nsw i32 %shl25, %m_add.0629
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = addnsw %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %or30 = or i32 %shl25, %m_or.0630
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = or %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %m_add.1 = phi i32 [ %add26, %9 ], [ %m_add.0629, %7 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %m_or.1 = phi i32 [ %or30, %9 ], [ %m_or.0630, %7 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %11 = load i32, i32* %arrayidx32, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp33 = icmp sgt i32 %11, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %shl36 = shl i32 1, %11
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = shl 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %add37 = add nsw i32 %shl36, %d_add.0631
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = addnsw %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %or41 = or i32 %shl36, %d_or.0632
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = or %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %d_add.1 = phi i32 [ %add37, %12 ], [ %d_add.0631, %10 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %d_or.1 = phi i32 [ %or41, %12 ], [ %d_or.0632, %10 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %14 = load i32, i32* %arrayidx43, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp44 = icmp sgt i32 %14, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %shl47 = shl i32 1, %14
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = shl 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %add48 = add nsw i32 %shl47, %a_add.0633
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = addnsw %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %or52 = or i32 %shl47, %a_or.0634
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = or %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %a_add.1 = phi i32 [ %add48, %15 ], [ %a_add.0633, %13 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %a_or.1 = phi i32 [ %or52, %15 ], [ %a_or.0634, %13 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %17 = load i32, i32* %arrayidx54, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp55 = icmp sgt i32 %17, -1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %shl58 = shl i32 1, %17
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = shl 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %add59 = add nsw i32 %shl58, %s_add.0635
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = addnsw %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %or63 = or i32 %shl58, %s_or.0636
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i32 = shl 1:i32, %0 (hasExternalUses)
%4:i32 = or %2, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %s_add.1 = phi i32 [ %add59, %18 ], [ %s_add.0635, %16 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %s_or.1 = phi i32 [ %or63, %18 ], [ %s_or.0636, %16 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp72 = icmp ne i32 %8, 0
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = ne 0:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %cmp75 = icmp eq i32 %5, 0
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond569 = or i1 %cmp75, %cmp72
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 0:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp78 = icmp eq i32 %8, 0
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 0:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
pc %6 1:i1
%7:i1 = eq 0:i32, %0
infer %7

; Function: checkHouses
;[ORIGIN]   %cmp75.not = xor i1 %cmp75, true
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 0:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
pc %6 1:i1
%7:i1 = xor 1:i1, %4
infer %7

; Function: checkHouses
;[ORIGIN]   %brmerge = or i1 %cmp78, %cmp75.not
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 0:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
pc %6 1:i1
%7:i1 = xor 1:i1, %4
%8:i1 = eq 0:i32, %0
%9:i1 = or %7, %8
infer %9

; Function: checkHouses
;[ORIGIN]   %cmp90 = icmp ne i32 %8, 1
%0:i32 = var
%1:i1 = ne 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp93 = icmp eq i32 %14, 0
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond570 = or i1 %cmp90, %cmp93
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
infer %5

; Function: checkHouses
;[ORIGIN]   %cmp96 = icmp eq i32 %8, 1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = eq 1:i32, %3
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp93.not = xor i1 %cmp93, true
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
infer %6

; Function: checkHouses
;[ORIGIN]   %brmerge608 = or i1 %cmp96, %cmp93.not
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
%7:i1 = eq 1:i32, %3
%8:i1 = or %6, %7
infer %8

; Function: checkHouses
;[ORIGIN]   %cmp108 = icmp ne i32 %8, 2
%0:i32 = var
%1:i1 = ne 2:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp111 = icmp eq i32 %11, 0
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond571 = or i1 %cmp108, %cmp111
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 2:i32, %3
%5:i1 = or %2, %4
infer %5

; Function: checkHouses
;[ORIGIN]   %cmp114 = icmp eq i32 %8, 2
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 2:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = eq 2:i32, %3
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp111.not = xor i1 %cmp111, true
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 2:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
infer %6

; Function: checkHouses
;[ORIGIN]   %brmerge609 = or i1 %cmp114, %cmp111.not
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 0:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 2:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
%7:i1 = eq 2:i32, %3
%8:i1 = or %6, %7
infer %8

; Function: checkHouses
;[ORIGIN]   %cmp118 = icmp ne i32 %i.0637, 0
%0:i32 = var (range=[0,5))
%1:i1 = ne 0:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %sub = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i1 = ne 0:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %32 = load i32, i32* %arrayidx123, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp124 = icmp ne i32 %32, 1
%0:i32 = var
%1:i1 = ne 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp127 = icmp eq i32 %5, 2
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 2:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond572 = or i1 %cmp127, %cmp124
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 2:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
infer %5

; Function: checkHouses
;[ORIGIN]   %cmp131 = icmp eq i32 %32, 1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 2:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = eq 1:i32, %3
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp127.not = xor i1 %cmp127, true
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 2:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
infer %6

; Function: checkHouses
;[ORIGIN]   %brmerge610 = or i1 %cmp131, %cmp127.not
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 2:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
%7:i1 = eq 1:i32, %3
%8:i1 = or %6, %7
infer %8

; Function: checkHouses
;[ORIGIN]   %35 = or i32 %11, %5
%0:i32 = var
%1:i32 = var
%2:i32 = or %0, %1
infer %2

; Function: checkHouses
;[ORIGIN]   %36 = icmp slt i32 %35, 0
%0:i32 = var
%1:i32 = var
%2:i32 = or %0, %1
%3:i1 = slt %2, 0:i32
infer %3

; Function: checkHouses
;[ORIGIN]   %cmp143 = icmp ne i32 %5, 1
%0:i32 = var
%1:i1 = ne 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp146 = icmp eq i32 %11, 1
%0:i32 = var
%1:i1 = eq 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond573 = or i1 %cmp143, %cmp146
%0:i32 = var
%1:i1 = eq 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = ne 1:i32, %2
%4:i1 = or %1, %3
infer %4

; Function: checkHouses
;[ORIGIN]   %cmp149 = icmp eq i32 %5, 1
%0:i32 = var
%1:i1 = eq 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = ne 1:i32, %2
%4:i1 = or %1, %3
pc %4 1:i1
%5:i1 = eq 1:i32, %2
infer %5

; Function: checkHouses
;[ORIGIN]   %cmp146.not = xor i1 %cmp146, true
%0:i32 = var
%1:i1 = eq 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = ne 1:i32, %2
%4:i1 = or %1, %3
pc %4 1:i1
%5:i1 = xor 1:i1, %1
infer %5

; Function: checkHouses
;[ORIGIN]   %brmerge612 = or i1 %cmp149, %cmp146.not
%0:i32 = var
%1:i1 = eq 1:i32, %0 (hasExternalUses)
%2:i32 = var
%3:i1 = ne 1:i32, %2
%4:i1 = or %1, %3
pc %4 1:i1
%5:i1 = xor 1:i1, %1
%6:i1 = eq 1:i32, %2
%7:i1 = or %5, %6
infer %7

; Function: checkHouses
;[ORIGIN]   %cmp161 = icmp ne i32 %17, 0
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = ne 0:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %cmp164 = icmp eq i32 %14, 1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond574 = or i1 %cmp164, %cmp161
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 1:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp167 = icmp eq i32 %17, 0
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 1:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
pc %6 1:i1
%7:i1 = eq 0:i32, %0
infer %7

; Function: checkHouses
;[ORIGIN]   %cmp164.not = xor i1 %cmp164, true
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 1:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
pc %6 1:i1
%7:i1 = xor 1:i1, %4
infer %7

; Function: checkHouses
;[ORIGIN]   %brmerge613 = or i1 %cmp167, %cmp164.not
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 1:i32, %2 (hasExternalUses)
%5:i1 = ne 0:i32, %0
%6:i1 = or %4, %5
pc %6 1:i1
%7:i1 = xor 1:i1, %4
%8:i1 = eq 0:i32, %0
%9:i1 = or %7, %8
infer %9

; Function: checkHouses
;[ORIGIN]   %cmp179 = icmp ne i32 %17, 1
%0:i32 = var
%1:i1 = ne 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp182 = icmp eq i32 %5, 3
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond575 = or i1 %cmp182, %cmp179
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
infer %5

; Function: checkHouses
;[ORIGIN]   %cond = icmp eq i32 %17, 1
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 1:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = eq 1:i32, %3
infer %6

; Function: checkHouses
;[ORIGIN]   %trunc616 = trunc i32 %i.0637 to i31
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
infer %1

; Function: checkHouses
;[ORIGIN]   %add193 = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
pc %1 0:i31
%2:i32 = addnw 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %49 = load i32, i32* %arrayidx195, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp196 = icmp slt i32 %49, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp200 = icmp eq i32 %49, 2
%0:i32 = var
%1:i1 = eq 2:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond576 = or i1 %cmp196, %cmp200
%0:i32 = var
%1:i1 = eq 2:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %sub202 = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
pc %1 4:i31
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %51 = load i32, i32* %arrayidx204, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp205 = icmp eq i32 %51, 2
%0:i32 = var
%1:i1 = eq 2:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %add206 = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %53 = load i32, i32* %arrayidx208, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp209 = icmp slt i32 %53, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp213 = icmp eq i32 %53, 2
%0:i32 = var
%1:i1 = eq 2:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond577 = or i1 %cmp209, %cmp213
%0:i32 = var
%1:i1 = eq 2:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %sub214 = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %55 = load i32, i32* %arrayidx216, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp217 = icmp eq i32 %55, 2
%0:i32 = var
%1:i1 = eq 2:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %trunc615 = trunc i32 %i.0637 to i31
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
infer %1

; Function: checkHouses
;[ORIGIN]   %add222 = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
pc %1 0:i31
%2:i32 = addnw 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %58 = load i32, i32* %arrayidx224, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp225 = icmp slt i32 %58, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp229 = icmp eq i32 %58, 3
%0:i32 = var
%1:i1 = eq 3:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond578 = or i1 %cmp225, %cmp229
%0:i32 = var
%1:i1 = eq 3:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %sub231 = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
pc %1 4:i31
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %60 = load i32, i32* %arrayidx233, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp234 = icmp eq i32 %60, 3
%0:i32 = var
%1:i1 = eq 3:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %add235 = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %62 = load i32, i32* %arrayidx237, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp238 = icmp slt i32 %62, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp242 = icmp eq i32 %62, 3
%0:i32 = var
%1:i1 = eq 3:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond579 = or i1 %cmp238, %cmp242
%0:i32 = var
%1:i1 = eq 3:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %sub243 = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %64 = load i32, i32* %arrayidx245, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp246 = icmp eq i32 %64, 3
%0:i32 = var
%1:i1 = eq 3:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp191595599602 = phi i1 [ true, %54 ], [ true, %52 ], [ false, %46 ], [ false, %61 ], [ false, %63 ]
%0:i1 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp255 = icmp ne i32 %17, 3
%0:i32 = var
%1:i1 = ne 3:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp258 = icmp eq i32 %11, 3
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond580 = or i1 %cmp258, %cmp255
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 3:i32, %3
%5:i1 = or %2, %4
infer %5

; Function: checkHouses
;[ORIGIN]   %cmp261 = icmp eq i32 %17, 3
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 3:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = eq 3:i32, %3
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp258.not = xor i1 %cmp258, true
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 3:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
infer %6

; Function: checkHouses
;[ORIGIN]   %brmerge614 = or i1 %cmp261, %cmp258.not
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 3:i32, %0 (hasExternalUses)
%3:i32 = var
%4:i1 = ne 3:i32, %3
%5:i1 = or %2, %4
pc %5 1:i1
%6:i1 = xor 1:i1, %2
%7:i1 = eq 3:i32, %3
%8:i1 = or %6, %7
infer %8

; Function: checkHouses
;[ORIGIN]   %cmp191595599601 = phi i1 [ %cmp191595599602, %66 ], [ %cmp191595599602, %.thread600 ], [ false, %.thread589 ]
%0:i1 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp273 = icmp ne i32 %8, 3
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = ne 3:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %cmp276 = icmp eq i32 %17, 4
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i1 = eq 4:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond581 = or i1 %cmp273, %cmp276
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 4:i32, %2 (hasExternalUses)
%5:i1 = ne 3:i32, %0
%6:i1 = or %4, %5
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp279 = icmp eq i32 %8, 3
%0:i32 = var
%1:i1 = slt 4294967295:i32, %0
pc %1 1:i1
%2:i32 = var
%3:i1 = slt 4294967295:i32, %2
pc %3 1:i1
%4:i1 = eq 4:i32, %2 (hasExternalUses)
%5:i1 = ne 3:i32, %0
%6:i1 = or %4, %5
pc %6 1:i1
%7:i1 = eq 3:i32, %0
infer %7

; Function: checkHouses
;[ORIGIN]   %cmp285 = icmp eq i32 %8, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp286 = icmp ult i32 %i.0637, 4
%0:i32 = var (range=[0,5))
%1:i1 = ult %0, 4:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %add287 = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i1 = ult %0, 4:i32
pc %1 1:i1
%2:i32 = addnw 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %74 = load i32, i32* %arrayidx289, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp290 = icmp slt i32 %74, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp294 = icmp eq i32 %74, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond582 = or i1 %cmp290, %cmp294
%0:i32 = var
%1:i1 = eq 4:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %sub296 = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i1 = ne 0:i32, %0
pc %1 1:i1
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %77 = load i32, i32* %arrayidx298, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp299 = icmp eq i32 %77, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %.pre = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %trunc = trunc i32 %i.0637 to i31
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
infer %1

; Function: checkHouses
;[ORIGIN]   %add304 = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
pc %1 0:i31
%2:i32 = addnw 1:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %80 = load i32, i32* %arrayidx306, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp307 = icmp slt i32 %80, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp311 = icmp eq i32 %80, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond583 = or i1 %cmp307, %cmp311
%0:i32 = var
%1:i1 = eq 4:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %sub313 = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i31 = trunc %0
pc %1 4:i31
%2:i32 = addnsw 4294967295:i32, %0
infer %2

; Function: checkHouses
;[ORIGIN]   %82 = load i32, i32* %arrayidx315, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp316 = icmp eq i32 %82, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %add317 = add nuw nsw i32 %i.0637, 1
%0:i32 = var (range=[0,5))
%1:i32 = addnw 1:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %84 = load i32, i32* %arrayidx319, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp320 = icmp slt i32 %84, 0
%0:i32 = var
%1:i1 = slt %0, 0:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp324 = icmp eq i32 %84, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %or.cond584 = or i1 %cmp320, %cmp324
%0:i32 = var
%1:i1 = eq 4:i32, %0
%2:i1 = slt %0, 0:i32
%3:i1 = or %1, %2
infer %3

; Function: checkHouses
;[ORIGIN]   %sub325 = add nsw i32 %i.0637, -1
%0:i32 = var (range=[0,5))
%1:i32 = addnsw 4294967295:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %86 = load i32, i32* %arrayidx327, align 4, !tbaa !2
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp328 = icmp eq i32 %86, 4
%0:i32 = var
%1:i1 = eq 4:i32, %0
infer %1

; Function: checkHouses
;[ORIGIN]   %inc.pre-phi = phi i32 [ %.pre, %.thread604._crit_edge ], [ %add317, %83 ], [ %add317, %85 ]
%0:i32 = var
infer %0

; Function: checkHouses
;[ORIGIN]   %cmp11 = icmp ult i32 %inc.pre-phi, 5
%0:i32 = var
%1:i1 = ult %0, 5:i32
infer %1

; Function: checkHouses
;[ORIGIN]   %cmp329 = icmp eq i32 %c_add.1, %c_or.1
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: checkHouses
;[ORIGIN]   %cmp330 = icmp eq i32 %m_add.1, %m_or.1
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond585 = and i1 %cmp329, %cmp330
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
infer %6

; Function: checkHouses
;[ORIGIN]   %cmp331 = icmp eq i32 %d_add.1, %d_or.1
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond586 = and i1 %or.cond585, %cmp331
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
infer %10

; Function: checkHouses
;[ORIGIN]   %cmp332 = icmp eq i32 %a_add.1, %a_or.1
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond587 = and i1 %or.cond586, %cmp332
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
infer %14

; Function: checkHouses
;[ORIGIN]   %cmp333 = icmp eq i32 %s_add.1, %s_or.1
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
infer %2

; Function: checkHouses
;[ORIGIN]   %or.cond588 = and i1 %or.cond587, %cmp333
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
infer %18

; Function: checkHouses
;[ORIGIN]   %cmp334 = icmp ne i32 %c_add.1, 31
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %0
infer %19

; Function: checkHouses
;[ORIGIN]   %cmp335 = icmp ne i32 %m_add.1, 31
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %3
infer %19

; Function: checkHouses
;[ORIGIN]   %or.cond = or i1 %cmp334, %cmp335
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %0
%20:i1 = ne 31:i32, %3
%21:i1 = or %19, %20
infer %21

; Function: checkHouses
;[ORIGIN]   %cmp336 = icmp ne i32 %d_add.1, 31
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %7
infer %19

; Function: checkHouses
;[ORIGIN]   %or.cond339 = or i1 %or.cond, %cmp336
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %0
%20:i1 = ne 31:i32, %3
%21:i1 = or %19, %20
%22:i1 = ne 31:i32, %7
%23:i1 = or %21, %22
infer %23

; Function: checkHouses
;[ORIGIN]   %cmp337 = icmp ne i32 %a_add.1, 31
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %11
infer %19

; Function: checkHouses
;[ORIGIN]   %or.cond340 = or i1 %or.cond339, %cmp337
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %0
%20:i1 = ne 31:i32, %3
%21:i1 = or %19, %20
%22:i1 = ne 31:i32, %7
%23:i1 = or %21, %22
%24:i1 = ne 31:i32, %11
%25:i1 = or %23, %24
infer %25

; Function: checkHouses
;[ORIGIN]   %cmp338 = icmp ne i32 %s_add.1, 31
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %15
infer %19

; Function: checkHouses
;[ORIGIN]   %or.cond341 = or i1 %or.cond340, %cmp338
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %0
%20:i1 = ne 31:i32, %3
%21:i1 = or %19, %20
%22:i1 = ne 31:i32, %7
%23:i1 = or %21, %22
%24:i1 = ne 31:i32, %11
%25:i1 = or %23, %24
%26:i1 = ne 31:i32, %15
%27:i1 = or %25, %26
infer %27

; Function: checkHouses
;[ORIGIN]   %. = select i1 %or.cond341, i32 1, i32 2
%0:i32 = var
%1:i32 = var
%2:i1 = eq %0, %1
%3:i32 = var
%4:i32 = var
%5:i1 = eq %3, %4
%6:i1 = and %2, %5
%7:i32 = var
%8:i32 = var
%9:i1 = eq %7, %8
%10:i1 = and %6, %9
%11:i32 = var
%12:i32 = var
%13:i1 = eq %11, %12
%14:i1 = and %10, %13
%15:i32 = var
%16:i32 = var
%17:i1 = eq %15, %16
%18:i1 = and %14, %17
pc %18 1:i1
%19:i1 = ne 31:i32, %0
%20:i1 = ne 31:i32, %3
%21:i1 = or %19, %20
%22:i1 = ne 31:i32, %7
%23:i1 = or %21, %22
%24:i1 = ne 31:i32, %11
%25:i1 = or %23, %24
%26:i1 = ne 31:i32, %15
%27:i1 = or %25, %26
%28:i32 = select %27, 1:i32, 2:i32
infer %28

; Function: checkHouses
;[ORIGIN]   %retval.1 = phi i32 [ 0, %0 ], [ 0, %2 ], [ 0, %88 ], [ %., %89 ], [ 0, %21 ], [ 0, %24 ], [ 0, %27 ], [ 0, %31 ], [ 0, %37 ], [ 0, %40 ], [ 0, %43 ], [ 0, %45 ], [ 0, %48 ], [ 0, %50 ], [ 0, %54 ], [ 0, %57 ], [ 0, %59 ], [ 0, %63 ], [ 0, %65 ], [ 0, %68 ], [ 0, %70 ], [ 0, %73 ], [ 0, %76 ], [ 0, %79 ], [ 0, %81 ], [ 0, %85 ], [ 0, %22 ], [ 0, %25 ], [ 0, %28 ], [ 0, %33 ], [ 0, %38 ], [ 0, %41 ], [ 0, %66 ]
%0 = block 33
%1:i32 = var
%2:i1 = ne 31:i32, %1
%3:i32 = var
%4:i1 = ne 31:i32, %3
%5:i1 = or %2, %4
%6:i32 = var
%7:i1 = ne 31:i32, %6
%8:i1 = or %5, %7
%9:i32 = var
%10:i1 = ne 31:i32, %9
%11:i1 = or %8, %10
%12:i32 = var
%13:i1 = ne 31:i32, %12
%14:i1 = or %11, %13
%15:i32 = select %14, 1:i32, 2:i32
%16:i32 = phi %0, 0:i32, 0:i32, 0:i32, %15, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32, 0:i32
infer %16

; Function: bruteFill
;[ORIGIN]   %call = tail call i32 @checkHouses([5 x i32]* %ha)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %1 = or i32 %call, 2
%0:i32 = var
%1:i32 = or 2:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %2 = icmp eq i32 %1, 2
%0:i32 = var
%1:i32 = or 2:i32, %0
%2:i1 = eq 2:i32, %1
infer %2

; Function: bruteFill
;[ORIGIN]   %cmp7 = icmp slt i32 %attr, 4
%0:i32 = var
%1:i1 = slt %0, 4:i32
infer %1

; Function: bruteFill
;[ORIGIN]   %add = add nsw i32 %attr, 1
%0:i32 = var
%1:i32 = addnsw 1:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %not.cmp7 = xor i1 %cmp7, true
%0:i32 = var
%1:i1 = slt %0, 4:i32 (hasExternalUses)
%2:i1 = xor 1:i1, %1
infer %2

; Function: bruteFill
;[ORIGIN]   %add8 = zext i1 %not.cmp7 to i32
%0:i32 = var
%1:i1 = slt %0, 4:i32 (hasExternalUses)
%2:i1 = xor 1:i1, %1
%3:i32 = zext %2
infer %3

; Function: bruteFill
;[ORIGIN]   %nexthno.0 = add nsw i32 %add8, %hno
%0:i32 = var
%1:i32 = var
%2:i1 = slt %1, 4:i32 (hasExternalUses)
%3:i1 = xor 1:i1, %2
%4:i32 = zext %3
%5:i32 = addnsw %0, %4
infer %5

; Function: bruteFill
;[ORIGIN]   %nextattr.0 = select i1 %cmp7, i32 %add, i32 0
%0:i32 = var
%1:i1 = slt %0, 4:i32 (hasExternalUses)
%2:i32 = addnsw 1:i32, %0
%3:i32 = select %1, %2, 0:i32
infer %3

; Function: bruteFill
;[ORIGIN]   %call5 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp6 = icmp eq i32 %call5, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call10 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp11 = icmp eq i32 %call10, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call5.1 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp6.1 = icmp eq i32 %call5.1, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call10.lcssa = phi i32 [ %call10, %6 ], [ %call10.1, %10 ], [ %call10.2, %11 ], [ %call10.3, %12 ], [ %call10.4, %13 ]
%0 = block 5
%1:i32 = var
%2:i32 = var
%3:i32 = var
%4:i32 = var
%5:i32 = var
%6:i32 = phi %0, %1, %2, %3, %4, %5
infer %6

; Function: bruteFill
;[ORIGIN]   %8 = phi i32 [ %call10.lcssa, %7 ], [ 0, %13 ], [ 0, %.thread.3 ]
%0 = block 3
%1 = block 5
%2:i32 = var
%3:i32 = var
%4:i32 = var
%5:i32 = var
%6:i32 = var
%7:i32 = phi %1, %2, %3, %4, %5, %6
%8:i32 = phi %0, %7, 0:i32, 0:i32
infer %8

; Function: bruteFill
;[ORIGIN]   %retval.5 = phi i32 [ %8, %.loopexit ], [ %call, %0 ]
%0 = block 2
%1 = block 3
%2 = block 5
%3:i32 = var
%4:i32 = var
%5:i32 = var
%6:i32 = var
%7:i32 = var
%8:i32 = phi %2, %3, %4, %5, %6, %7
%9:i32 = phi %1, %8, 0:i32, 0:i32
%10:i32 = var
%11:i32 = phi %0, %9, %10
infer %11

; Function: bruteFill
;[ORIGIN]   %call10.1 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp11.1 = icmp eq i32 %call10.1, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call5.2 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp6.2 = icmp eq i32 %call5.2, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call10.2 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp11.2 = icmp eq i32 %call10.2, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call5.3 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp6.3 = icmp eq i32 %call5.3, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call10.3 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp11.3 = icmp eq i32 %call10.3, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call5.4 = call i32 @checkHouses([5 x i32]* nonnull %arraydecay)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp6.4 = icmp eq i32 %call5.4, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1

; Function: bruteFill
;[ORIGIN]   %call10.4 = call i32 @bruteFill([5 x i32]* nonnull %arraydecay, i32 %nexthno.0, i32 %nextattr.0)
%0:i32 = var
infer %0

; Function: bruteFill
;[ORIGIN]   %cmp11.4 = icmp eq i32 %call10.4, 0
%0:i32 = var
%1:i1 = eq 0:i32, %0
infer %1
```