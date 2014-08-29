import sys
import json
# from fuzzywuzzy import fuzz

def item_xml(match):
    (name, url) = match

    return """
    <item arg="%s" uid="search-results-%s-%i">
        <title>%s</title>
        <subtitle>Open %s in browser</subtitle>
    </item>
    """ % (url, url, 100, name, url)


def f_str(st):
    return st.lower().strip()

query = format(sys.argv[1])

# load URLs from file
url_data = open('/Users/Mingle/fq.json')
urls = json.load(url_data)
url_data.close()

# fuzzy
# results = [(url, fuzz.partial_ratio(f_str(url[0]), query)) for url in urls]
# results = sorted(results, key=lambda x: -x[1])

# prev = None
# i = 0

# for result in results:
#     i += 1

#     if prev == None:
#         prev = result[1]
#         continue
#     else:
#         if prev - result[1] > 15:
#             i -= 1
#             break

# results = results[:i]

# not fuzzy
# get results
results = [url for url in urls if query in f_str(url[0])]
results = sorted(results, key=lambda x: x[0])
results = [item_xml(url) for url in results]

print """
<?xml version='1.0'?>
<items>
%s
</items>
""" % results
