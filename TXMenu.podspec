Pod::Spec.new do |s|
  s.name         = 'TXMenu'
  s.version      = '0.1'
  s.summary      = '自定义菜单，并且可以控制自己定义的任何视图。'
  s.description  = <<-DESC
			自定义菜单，并且可以控制自己定义的任何视图。更多功能等待你的发现。
                   DESC
  s.homepage     = 'https://github.com/xtzPioneer/TXMenu'
  s.license      = 'MIT'
  s.author       = { 'zhangxiong' => 'xtz_pioneer@163.com' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/xtzPioneer/TXMenu.git', :tag => s.version.to_s }
  s.source_files = 'TXMenu/**/*.{h,m}'
  s.requires_arc = true  
end