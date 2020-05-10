Pod::Spec.new do |spec|

  spec.name                  = "SwiftGui"
  spec.version               = "0.8.3"
  spec.summary               = "SwiftGUI is an experimental API inspired by SwiftUI DSL."
  spec.homepage              = "https://github.com/erickjung/SwiftGUI"
  spec.license               = { :type => 'Copyright', :file => 'LICENSE' }
  spec.author                = { "Erick Jung" => "erickjung@gmail.com" }
  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.13"
  spec.source                = { :git => "https://github.com/erickjung/SwiftGUI.git", :tag => "0.8.3" }
  spec.source_files          = 'Source/SwiftGui/**/*.{h,m,mm,cpp,swift}'
  spec.swift_version         = '5.0'
  spec.public_header_files = [
    'Source/SwiftGui/Core/ImGuiWrapper.h',
    'Source/SwiftGui/Core/ImGuiStyleWrapper.h',
    'Source/SwiftGui/Core/TextEditorWrapper.h',
    'Source/SwiftGui/Core/GuiRenderer.h',
  ]

end
