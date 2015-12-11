Gem::Specification.new do |s|
  
  s.name          = 'savage-fontgen'
  s.version       = '0.1.3'
  s.licenses      = ['MIT']
  s.summary       = "Generate font files from svgs."
  s.description   = "Use individual svg files to generate a font file. Created for use in generating webfont icon sets. Also generates a css and html preview file."
  s.authors       = ["Alex Clink"]
  s.email         = 'code@alexclink.com'
  s.homepage      = 'https://github.com/SleepingInsomniac/Savage-fontgen'
  s.files         = [
    "lib/generate",
    "bin/savage-fontgen",
    'savage-conf/config.yaml',
    'savage-conf/templates/preview.html.erb',
    'savage-conf/templates/style.css.erb'
  ]
  s.executables   = ["savage-fontgen"]
  s.require_paths = ['lib', "savage-conf"]
  s.add_dependency 'colorize', '~> 0.7'
  s.add_dependency 'erubis', '~> 2.7'
  
end
