import fontforge, os, os.path
import yaml

stream = open("./conf/config.yaml", "r")
config = yaml.load(stream)

execfile("./lib/mkdir.py") # Customer mkdir function

# create an empty font in memory
font = fontforge.font()
font.fontname = config['fontname']
font.familyname = config['familyname']

unicode = 2304 # &#x900

glyphs = dict()

for root, _, files in os.walk('./glyphs'):
    for f in files:
        if f[0] == '.':
            continue
        name = os.path.splitext(f)[0]
        # print unicode, " => ", name
        glyphs[name] = unicode
        glyph = font.createChar(unicode, name)
        # Import the glyph info
        glyph.importOutlines("./glyphs/%s.svg" % name)
        glyph.width = config['glyphwidth']
        unicode = unicode + 1

_mkdir("./out/fonts")

with open('./out/glyphs.yaml', 'w') as outfile:
    outfile.write( yaml.dump(glyphs) )

# Write the font from memory to a TTF file
for ext in config['formats']:
    font.generate("./out/fonts/{}.{}".format(config['fontname'], ext))
