CocoaPods Mixotype Machine Migration Guide

Common errors you will encounter migrating to different machines. This guide is adapted to Mixotype though similar errors may be encountered migrating cocoapod apps.

Here are some things you may want to consider. Maybe try docker to install pod dependencies across machines. Other tools to "refresh" the code during your fix inside X Code:
- Clean build with Product -> Clean Build Product
- Clear Derived data at: /Users/wff/Library/Developer/Xcode/DerivedData
- Reinstall Pods by deleting Pods/ and Podfile.lock and running pod install (make sure Podfile still there)

Requirements:
A quick setup that you must do is `pod install` even if there is a Pods/ folder or else there will be a sync error when you build. Delete the Pods/ folder, Podfile.lock, then run `pod install`. No need to run `pod init` because you already have a podfile.

Listed from the most likely migration errors encoutered first:
- gRPC-C++ error during Pod install
- Firebase__ etc module not found
- Warning - Version but your version range is...
- Entitlement error - CODE_SIGN_ENTITLEMENTS
- Profile error - code couldn't find any iOS App Development provisioning profiles matching 'com.__'
- Build input file cannot be found: ....storyboard etc
- Inability to distribute to Apple Store / Test Flight

TOC:
- [gRPC-C++ error during Pod install](#grpc-c---error-during-pod-install)
  * [Fix - Add Path for correct OpenSSL](#fix---add-path-for-correct-openssl)
  * [Fix - Add Path for correct sed](#fix---add-path-for-correct-sed)
  * [Fix gRPC-C++ by updating software *Unlikely*](#fix-grpc-c---by-updating-software--unlikely-)
  * [Fix gRPC-C++ by updating Firebase *Unlikely*](#fix-grpc-c---by-updating-firebase--unlikely-)
- [Firebase__ etc module not found](#firebase---etc-module-not-found)
  * [Framework paths to find Firebase](#framework-paths-to-find-firebase)
  * [Add more Firebase Pods](#add-more-firebase-pods)
  * [New way to import Firebase](#new-way-to-import-firebase)
- [Warning - Version but your version range is...](#warning---version-but-your-version-range-is)
- [Entitlement error - CODE_SIGN_ENTITLEMENTS](#entitlement-error---code-sign-entitlements)
- [Profile error - code couldn't find any iOS App Development provisioning profiles matching 'com.__'](#profile-error---code-couldn-t-find-any-ios-app-development-provisioning-profiles-matching--com---)
- [Build input file cannot be found: ....storyboard etc](#build-input-file-cannot-be-found--storyboard-etc)
  * [Fix 1 *BEST*:](#fix-1--best--)
  * [Fix 2: Relink the files at the Build Phases](#fix-2--relink-the-files-at-the-build-phases)
  * [Fix 3:](#fix-3-)
- [Inability to distribute to Apple Store / Test Flight](#inability-to-distribute-to-apple-store---test-flight)
  * [Get a DISTRIBUTION certficate online then upload to Xcode:](#get-a-distribution-certficate-online-then-upload-to-xcode-)


# gRPC-C++ error during Pod install

What the error looks like
```
Installing gRPC-C++ (1.28.2)
[!] /bin/bash -c 
set -e
sed -E -i '' 's;#include <openssl/(.*)>;#if COCOAPODS==1\
  #include <openssl_grpc/\1>\
#else\
  #include <openssl/\1>\
...
sed: can't read s;#include <openssl/(.*)>;#if COCOAPODS==1\
  #include <openssl_grpc/\1>\
#else\
  #include <openssl/\1>\
#endif;g: No such file or directory
```

## Fix - Add Path for correct OpenSSL
1. First clear all cache and pods, then install pods:
```
cd ios/
rm -rf Pods/
rm Podfile.lock
pod cache clean --all
pod install
```

2. See if you are using the correct version of SSL which is OpenSSL 1.1.1g, not LibreSSL 2.6.12, etc
```
openssl version
```

3. Install OpenSSL 1.1.1g with instructions on google if applicable. Or you might find BoringSSL-GRPC at ios/Pods/Headers/Public if Pods have no problems creating it

4. Add to $PATH the openssl or BoringSSL so the correct openssl can be used. You add to ~/.bash_profile or ~/.zshrc depending on your default terminal.

To get open ssl's path:
```
which openssl
```

You add similar to:
```
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
```

5. Reload the shell with the new settings with either:

```
source ~/.bashrc 
```

Or

```
source ~/.zshrc
```

5. Run `pod install` again after removing Pods/ and Podfile.lock.

## Fix - Add Path for correct sed

The sed that ships with OS X is in /usr/bin. (/usr/bin/sed) (The correct sed)
The sed that homebrew installs is in /usr/local/bin. (/usr/local/bin/gsed)

1. Find out which version when sed is called:
```
sed --i
```

2. Force the correct sed if step 1 produced wrong results
```
alias sed=/usr/bin/sed
```

3. Remove any incorrect seds
brew unlink gnu-sed

## Fix gRPC-C++ by updating software *Unlikely*

Update Mac and XCode.

## Fix gRPC-C++ by updating Firebase *Unlikely*
Look for a warning in Xcode to "Update to recommended settings" and do that for Firestore and Firebase/Firestore if applicable.


# Firebase__ etc module not found

## Framework paths to find Firebase
1. Top Level -> Build Settings:
    a. Header Search Paths -> Framework Search Paths  -> $(inherited)
    b. Header Search Paths -> Header Search Paths -> $(inherited)
2. Use Header Maps -> Yes

Note: The fields may appear blank. They will populate with paths on the next visit.

## Add more Firebase Pods
For example:
```
  # Fix XCode No such module 'FirebaseUI'
  pod 'Firebase/Core'
  pod 'FirebaseUI'
```

This was above the other Firebase pods

## New way to import Firebase
Since FirebaseUI 11.0.0 it is no longer possible to simply import FirebaseUI framework

At the View Controller's .swift file:
//import FirebaseUI
import FirebaseAuthUI
import FirebaseDatabaseUI

From: https://stackoverflow.com/questions/51080476/no-such-module-as-firebaseui

@  MX ios Pod and XCode Erroors



# Warning - Version but your version range is...
Add this to the end of Podfile. It'll match the versions for you:
```
post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'

  end

 end

end
```

# Entitlement error - CODE_SIGN_ENTITLEMENTS
Error: Verify that the CODE_SIGN_ENTITLEMENTS build setting for target is correct and that the file exists on disk.

1. Top Level -> Build Settings -> "Signing" tab
2. Remove the line saying "Code Signing Entitlements"

# Profile error - code couldn't find any iOS App Development provisioning profiles matching 'com.__'

Exact error:
No profiles for 'com__' were found: Xcode couldn't find any iOS App Development provisioning profiles matching 'com.__'.

If part of a team:
1. Get invited to your company/organization's Developer account (that was paid for). Then sign up for an Apple account. You do not need to sign up for developer account and your email address does not have to end in appe.com
2. Select your invited account

If not part of a time:
1. Select yourself as the team under Signing & Capabilities -> 
https://developer.apple.com/forums/thread/64973

2. You may get this error: 'The app identifier "com....."" cannot be registered to your development team because it is not available. Change your bundle identifier to a unique string to try again'

Then change it to another name. This error is because Apple wants multiple developers using the same bundle identifier to be under a team or organization with a paid developer account and also to prevent app phishing.

# Build input file cannot be found: ....storyboard etc

## Fix 1 *BEST*:
Remove the red file in Project Navigator
Right click -> Add Files to __
Rename the .xml away (so now you can open the storyboard)

## Fix 2: Relink the files at the Build Phases
Top level -> Build Phases -> Copy Bundle Resources
Note: Bundle Resources are for pictures, storyboards, etc. "Compile Sources" are for .swift files.

## Fix 3: 
1. Click "Add Files to ..."
2. Find a folder with resources, and click CMD + A
3. Set check box on "Create folder references for any added folders". And in source code i use e.g. "fonts/font1.xml".

# Inability to distribute to Apple Store / Test Flight

## Get a DISTRIBUTION certficate online then upload to Xcode:
https://developer.apple.com/account/resources/certificates/list
Preferences -> Accounts > Manage Certificates -> + -> Browse for certificate file