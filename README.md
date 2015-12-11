Svg icon font generator
====

##Requirements

* Ruby
* Python
* pyyaml
* fontforge

##Install

###OSX:

* `brew install fontforge`
* `pip install pyyaml`
* `gem install savage-fontgen`

###Windows
* https://fontforge.github.io/en-US/downloads
* `pip install pyyaml`
* `gem install savage-fontgen`

##Run

* Edit conf/config.yaml (or specify config.yaml at runtime)
* place svgs outlines in a glyphs folder
* `savage-fontgen path/to/glyphs [-o out/folder/path] [-c config/file.yaml]`
* Review output in 'out' folder
