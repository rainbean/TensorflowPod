#
#  Be sure to run `pod spec lint TensorflowPod.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "TensorflowPod"
  s.version      = "1.0.0-alpha"
  s.summary      = "Cocoapod based on Tensorflow (unofficial)"
  s.homepage     = "https://github.com/rainbean/TensorflowPod"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Jimmy Lee" => "Jimmy.m.Lee@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform     = :ios, "8.2"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source = { :http => "https://github.com/rainbean/TensorflowPod/releases/download/v#{s.version}/tensorflow.tar.gz" }
  s.preserve_paths = "include/**"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.ios.framework  = "Accelerate"
  s.ios.vendored_libraries = "lib/libtensorflow-core.a", "lib/libprotobuf-lite.a", "lib/libprotobuf.a"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  s.xcconfig = { 
    "HEADER_SEARCH_PATHS" => [
      "${PODS_ROOT}/#{s.name}/include",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/downloads/protobuf/src",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/downloads",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/downloads/eigen",
      "${PODS_ROOT}/#{s.name}/include/tensorflow/contrib/makefile/gen/proto",
    ],
    "OTHER_LDFLAGS" => "-force_load $(PODS_ROOT)/#{s.name}/lib/libtensorflow-core.a" 
  }
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }

end
