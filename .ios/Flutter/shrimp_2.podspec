Pod::Spec.new do |s|
  s.name                  = 'shrimp_2'
  s.version               = '0.0.1'
  s.summary               = 'Flutter module'
  s.description           = 'Flutter module - shrimp_2'
  s.homepage              = 'https://flutter.dev'
  s.license               = { :type => 'BSD' }
  s.author                = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.source                = { :path => '.' }
  s.ios.deployment_target = '8.0'
  s.vendored_frameworks   = 'App.framework'
  s.dependency 'Flutter'
end