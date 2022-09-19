platform :ios, '9.0'

post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CODE_SIGN_IDENTITY'] = ''
         end
    end
  end
end

target 'RotationTest' do
  use_frameworks!

  pod 'LEEAlert'

end
