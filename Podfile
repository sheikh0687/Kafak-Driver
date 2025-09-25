# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Kafak Driver' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Kafak Driver

pod 'R.swift', '~> 5.4.0'

pod 'Cosmos'

pod 'Alamofire'
pod 'IQKeyboardManagerSwift'
pod 'SDWebImage'

pod 'DropDown'

pod 'Firebase/Core'
pod 'Firebase/Messaging'
pod 'Firebase/Storage'

pod 'OTPFieldView'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    # Fix libarclite_xxx.a file not found.
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
