# Introduction #

This document is a draft on requirements and ideas on how to add Sakha ЙЦУКЕН keyboard layout to "Transliterator", a Firefox extension.

# Transliteration table #

We need five extra symbols over the Russian ЙЦУКЕН

  * 4 ҥ
  * 5 ҕ
  * 6 ө
  * 7 һ
  * 8 ү

Here is what we need to add/modify to the existing Russian ЙЦУКЕН:

```
["1","?"],["2","'"],["3","%"],
["4","ҥ"],["5","ҕ"],["6","ө"],["7","һ"],["8","ү"],
["$","Ҥ"],["%","Ҕ"],["^","Ө"],["&","Һ"],["*","Ү"],
["9",";"],["0",":"]
```

# How-to step-by-step nstructions #

  1. Open you Mozilla Firefox
  1. Install Transliterator from https://addons.mozilla.org/en-US/firefox/addon/transliterator/
  1. Open firefox configuration editor (type about:config in the location field), then filter the preferences by "transliterator".
  1. Right-click on the configuration editor, choose New -> String, enter the name extensions.transliterator.layouts.sah, hit enter, paste your transliteration table. Here is the string value. Copy it in whole and paste into the config value
```
[["`","ё"],["~","Ё"],["@","\""],["#","№"],["1","?"],["2","'"],["3","%"],["4","ҥ"],["5","ҕ"],["6","ө"],["7","һ"],["8","ү"],["$","Ҥ"],["%","Ҕ"],["^","Ө"],["&","Һ"],["*","Ү"],["9",";"],["0",":"],["q","й"],["w","ц"],["e","у"],["r","к"],["t","е"],["y","н"],["u","г"],["i","ш"],["o","щ"],["p","з"],["[","х"],["{","Х"],["]","ъ"],["}","Ъ"],["|","/"],["a","ф"],["s","ы"],["d","в"],["f","а"],["g","п"],["h","р"],["j","о"],["k","л"],["l","д"],[";","ж"],[":","Ж"],["'","э"],["\"","Э"],["z","я"],["x","ч"],["c","с"],["v","м"],["b","и"],["n","т"],["m","ь"],[",","б"],["<","Б"],[".","ю"],[">","Ю"],["/","."],["?",","]]
```
  1. Right-click and add new string again, this time enter extensions.transliterator.layouts.sah.description and a name for your transliteration table, e.g. "Сахалыы ЙЦУКЕН"