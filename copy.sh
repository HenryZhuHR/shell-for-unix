FILES=(
    color_print.sh

    compile-opencv.sh
    compile-qt.sh
    compile-gflags.sh
    compile-glog.sh
    compile-onnx.sh
    compile-onnxruntime.sh

    delete-node_modules_dist.sh
    rsync.sh
)

DEFAULT=$(echo -en '\033[0m')
LGREEN=$(echo -en '\033[01;32m')
LYELLOW=$(echo -en '\033[01;33m')


SRC_DIR=$HOME/shell

for file_name in ${FILES[@]};
do
    if [ -f $SRC_DIR/$file_name ]; then 
        echo " --> copy $LGREEN$file_name$DEFAULT from $LGREEN$SRC_DIR/$file_name$DEFAULT"
        cp  $SRC_DIR/$file_name .
    else
        echo "$LYELLOW --> not found: $SRC_DIR/$file_name $DEFAULT"
    fi
done