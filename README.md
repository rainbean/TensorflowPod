# TensorflowPod

## Build Tensorflow on macOS

* [Prerequsite] Install xcode cli tools
    ```
    $ xcode-select --install
    ```

* [Prerequsite] Install automake and libtool
    ```
    $ brew install automake libtool
    ```

* Clone TensorFlow repository
    ```
    $ cd ~/Code
    $ git clone https://github.com/tensorflow/tensorflow/
    ```

* Clone TensorflowPod repository
    ```
    $ cd ~/Code
    $ git clone https://github.com/rainbean/TensorflowPod
    ```

* Compile TensorFlow 
    ```
    $ cd ~/Code/tensorflow
    $ tensorflow/contrib/makefile/build_all_ios.sh
    ```

* Pack necessary header and static library
    ```
    $ cd ~/Code/tensorflow
    $ ~/Code/TensorflowPod/pack.sh
    $ ls tensorflow.tar.gz
    ```

## Integrate TensorFlow as Pod

* 