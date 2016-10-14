Pod::Spec.new do |s|
    s.name         = 'UIButtonState'
    s.version      = '1.0.0'
    s.summary      = 'An easy way to use config button state'
    s.homepage     = 'https://github.com/spWang/UIButton-State'
    s.license      = 'MIT'
    s.authors      = {'spWang' => 'wsp810@163.com'}
    s.platform     = :ios, '6.0'
    s.source       = {:git => 'https://github.com/spWang/UIButton-State.git', :tag => s.version}
    s.source_files = 'UIButtonState/UIButton+State/*.{h,m}'
    s.requires_arc = true
end
