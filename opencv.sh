BITCODES="canny.tmp.bc stereobm.tmp.bc deriv.tmp.bc optflowgf.tmp.bc smooth.dispatch.tmp.bc mathfuncs.tmp.bc morph.dispatch.tmp.bc types.tmp.bc shapedescr.tmp.bc contours.tmp.bc drawing.tmp.bc cascadedetect.tmp.bc matrix.tmp.bc resize.tmp.bc bindings.tmp.bc umatrix.tmp.bc matrix_expressions.tmp.bc median_blur.dispatch.tmp.bc color_lab.tmp.bc color_hsv.dispatch.tmp.bc color_yuv.dispatch.tmp.bc color_rgb.dispatch.tmp.bc color.tmp.bc, thresh.tmp.bc arithm.tmp.bc cascadedetect_convert.tmp.bc cascadedetect.tmp.bc contours.tmp.bc trees.tmp.bc"

for f in $BITCODES
do
    echo "$FOLDER/$f"
    #python3 -m crow.entrypoints.bc2wasm "opencv_$f" "$FOLDER/$f"
done