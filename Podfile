# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

target 'Mixo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks! :linkage => :static
  # use_modular_headers!

  # Fix XCode No such module 'FirebaseUI'
  pod 'Firebase/Core'
  pod 'FirebaseUI'

  # Pods for Mixo
  # add the Firebase pod for Google Analytics
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
  pod 'Crashlytics', '~> 3.14.0'
  pod 'KMPlaceholderTextView', '~> 1.4.0'
  pod 'SwiftGifOrigin', '~> 1.7.0'

  target 'MixoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MixoUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'

  end

 end

end
