#!/usr/bin/env ruby
require 'yaml'
require 'erubis'

`python lib/generate.py`

conf = YAML.load_file 'conf/config.yaml'
glyphs = YAML.load_file 'out/glyphs.yaml'
nocache = Time.now.to_i.to_s

glyphs.each do |name, unicode|
  puts "#{name} => #{unicode.to_s(16)}"
end

File.open "out/#{conf["familyname"]}.css", "w" do |f|
  template = Erubis::Eruby.new File.read("templates/style.css.erb")
  f.write template.result(nocache: nocache, glyphs: glyphs, conf: conf)
end

File.open "out/preview.html", "w" do |f|
  template = Erubis::Eruby.new File.read("templates/preview.html.erb")
  f.write template.result(nocache: nocache, glyphs: glyphs, conf: conf)
end
