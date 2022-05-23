# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

 # Pods for Mixo

target 'Mixo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks! :linkage => :static
  # use_modular_headers!

  # Dropdowns
  # Instructions: https://youtu.be/FJuSezRmEQI
  # Docs: https://github.com/AssistoLab/DropDown
  pod 'DropDown'


  # pod 'KMPlaceholderTextView', '~> 1.4.0' # Multiline placeholder support
  pod 'KMPlaceholderTextView' # Multiline placeholder support
  pod 'SwiftGifOrigin', '~> 1.7.0' # Gif support with UIImage
  pod "FontAwesome.swift" # Font awesome icons for chevron
  pod 'DALinedTextView', '~> 0.0' # Ruled line text iview
  pod 'IQKeyboardManager' # Keyboard manager to force screen keyboard to appear on DALinedTextView

  # Fix XCode No such module 'FirebaseUI'
  pod 'Firebase/Core'
  pod 'FirebaseUI'

  # Firebase Google Analytics (App business metrics)
  pod 'Firebase/Analytics'

  # add pods for any other desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'FirebaseUI/Google'
  pod 'FirebaseUI/Email'
  pod 'FirebaseUI/Storage'
  pod 'Fabric', '~> 1.10.2'
  pod 'Crashlytics', '~> 3.14.0' # Firebase Crashlytics


end

# def info_post_install(installer)
#  installer.pods_project.targets.each do |target|
#      target.build_configurations.each do |config|
#            config.build_settings['INFOPLIST_FILE'] = 'Target Support Files/'+target.name+'/'+target.name+'-Info.plist'
#        end
#    end
#
# end


post_install do |installer|
 # info_post_install(installer)
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
  end

 end

end