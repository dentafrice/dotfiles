import sys
from os import listdir
from os.path import splitext, abspath

from related import RELATED

IMAGES_PATH = 'images/emoticons'

def item_xml(match):
    (code, _ext) = splitext(match)

    full_code = "(%s)" % code
    image_path = abspath("%s/%s") % (IMAGES_PATH, match)

    return """
    <item arg="%s" uid="%s">
        <title>%s</title>
        <subtitle>Copy %s to clipboard</subtitle>
        <icon>%s</icon>
    </item>
    """ % (full_code, match, full_code, full_code, image_path)

def is_match(match, query):
    (code, _ext) = splitext(match)

    related_words = RELATED.get(code, [])

    for related_word in related_words:
        if query in related_word:
            return True

    return query in match

query = sys.argv[1]
emoticons = listdir(IMAGES_PATH)

matches = [match for match in emoticons if is_match(match, query)]
items = "".join([item_xml(match) for match in matches])

print """
<?xml version='1.0'?>
<items>
%s
</items>
""" % items
