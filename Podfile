# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

 # Pods for Mixo

target 'Mixo' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks! :linkage => :static # static is what's suggested
  use_frameworks! :linkage => :dynamic
  # use_modular_headers! # That's for objective C pods. Old way of compiling

  # Dropdowns
  # Instructions: https://youtu.be/FJuSezRmEQI
  # Docs: https://github.com/AssistoLab/DropDown

  pod 'DropDown'
  # pod 'KMPlaceholderTextView' # Multiline placeholder support
  # pod 'SwiftGifOrigin', '~> 1.7.0' # Gif support with UIImage
  pod 'SwiftGifOrigin' # Gif support with UIImage
  pod 'SDWebImageSwiftUI' # Load network image into Swift UI image
  pod "FontAwesome.swift" # Font awesome icons for chevron
  # pod 'IQKeyboardManager' # Keyboard manager to force screen keyboard to appear on DALinedTextView

  # Fix XCode No such module 'FirebaseUI'
  # pod 'Firebase/Core', :linkage => :static # That's the syntax for individual pods with different linking
  pod 'Firebase/Core'
  pod 'FirebaseUI'

  # Firebase Google Analytics (App business metrics)
  pod 'Firebase/Analytics'

  # add pods for any other desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'
  pod 'Firebase/Storage'
  pod 'FirebaseUI/Google'
  pod 'FirebaseUI/Email'
  pod 'FirebaseUI/Storage'
  # pod 'Fabric', '~> 1.10.2' # Deprecated in favor of: Firebase Crashlytics
  # pod 'Crashlytics', '~> 3.14.0' # Deprecated in favor of: Firebase Crashlytics
  pod 'FirebaseCrashlytics'
end

# def info_post_install(installer)
#   installer.pods_project.targets.each do |target|
#     target.build_configurations.each do |config|
#       config.build_settings['INFOPLIST_FILE'] = 'Target Support Files/'+target.name+'/'+target.name+'-Info.plist'
#     end
#   end
# end

# post_install do |installer|
#   installer.pods_project.targets.each do |target|
#     target.build_configurations.each do |config|
#       config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
#           config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64 i386"
#     end
#   end
# end

# post_install do |installer|
#   installer.pods_project.targets.each do |target|
#       flutter_additional_ios_build_settings(target)
#       target.build_configurations.each do |config|
#           config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64 i386"
#       end
#   end
# end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64 i386"
    end
  end
end