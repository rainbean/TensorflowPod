# TensorflowPod

## Build Tensorflow for iOS on macOS

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

* [Prerequsite] Install Cocoapods
    ```
    sudo gem install cocoapods
    ```

* Create or add pod into your project ```Podfile```, which should look like
    ```
    target 'DemoApp' do
        # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
        use_frameworks!

        # Pods for DemoApp
        pod 'TensorflowPod', :podspec => 'https://raw.githubusercontent.com/rainbean/TensorflowPod/master/TensorflowPod.podspec'

    end
    ```

* Install Pod
    ```
    pod install
    ```

* Follow official demo app to develop, [link](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/examples/ios)
    ```
    #include "google/protobuf/message_lite.h"
    #include "tensorflow/core/framework/tensor.h"
    #include "tensorflow/core/public/session.h"

    tensorflow::GraphDef graph;
    ...
    ``` 

## Apply hotfix

* Issue [#1740](https://github.com/tensorflow/models/issues/1740): No OpKernel was registered to support Op 'Switch'
    ```
    $ sed  -i -- '98s/$/ m(bool)/' tensorflow/core/framework/register_types.h
    $ git diff
        ...
        -#define TF_CALL_bool(m)
        +#define TF_CALL_bool(m) m(bool)
    ```

* Issue [#9476](https://github.com/tensorflow/tensorflow/issues/9476): No OpKernel was registered to support Op 'Less'
    ```
    $ sed  -i -- '302,430s/__ANDROID_TYPES_SLIM__/__ANDROID_TYPES_FULL__/' tensorflow/contrib/makefile/Makefile
    $ git diff
        ...
        - -D__ANDROID_TYPES_SLIM__ \
        + -D__ANDROID_TYPES_FULL__ \
    ```
