#!/bin/bash

TAR=tensorflow.tar
find ./tensorflow/contrib/makefile/downloads -name '*.h' | tar cvf $TAR -s '/^./include/' -T -
find ./tensorflow/contrib/makefile/gen/proto -name '*.h' | tar rvf $TAR -s '/^./include/' -T -
find ./tensorflow/core -name '*.h' | tar rvf $TAR -s '/^./include/' -T -
tar rvf $TAR -s '/^./include/' ./third_party/eigen3/unsupported/Eigen
tar rvf $TAR -s '/^./include/' ./tensorflow/contrib/makefile/downloads/eigen/unsupported/Eigen
tar rvf $TAR -s '/^./include/' ./tensorflow/contrib/makefile/downloads/eigen/Eigen
(cd tensorflow/contrib/makefile/gen; tar rvf ../../../../$TAR lib/libtensorflow-core.a)
(cd tensorflow/contrib/makefile/gen/protobuf_ios; tar rvf ../../../../../$TAR lib/libprotobuf-lite.a lib/libprotobuf.a)
gzip $TAR
