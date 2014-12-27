Kanjium - the ultimate kanji resource
=======

This file contains brief notes for a few things that need to be explained or pointed out.

CONTENTS:

  1. License, Copyright and Acknowledgements
  2. Notes

-----------

1) LICENSE, COPYRIGHT AND ACKNOWLEDGEMENTS

   Everything* in this package is licensed under the Creative Commons Attribution-ShareAlike 4.0 International license.<br />
   You can find the copy of this license in the file LICENSE.txt, or at:<br />
     http://creativecommons.org/licenses/by-sa/4.0/legalcode<br />
   The human-readable summary of the license is available at:<br />
     http://creativecommons.org/licenses/by-sa/4.0/

   You are free to use or modify the data however you like (for commercial or non-commercial purposes).

   *The majority of the data from this database comes from 3 main projects by the Electronic Dictionary Research and Development Group (EDRDG), led by James William Breen: EDICT (http://www.csse.monash.edu.au/~jwb/edict.html), KANJIDIC (http://www.csse.monash.edu.au/~jwb/kanjidic.html), KRADFILE (http://www.csse.monash.edu.au/~jwb/kradinf.html). These files are the property of the Group, and are used in conformance with the Group's license (http://www.edrdg.org/edrdg/licence.html).<br />
     Example sentences come from the Tatoeba.org project.<br />
     The copyright, author/s and license information of the fonts is embedded in their metadata. All are free to use.<br />
     ~6,400 kanji stroke order images were generated from the KanjiStrokeOrders font by Tim Eyre (http://www.nihilist.org.uk/). Copyright is held by Ulrich Apel and the Wadoku project (http://www.wadoku.de/).<br />
     The /origin/ images are composite images from http://chineseetymology.org. Copyright is held by Richard Sears.<br />
     JLPT data for words comes from Jonathan Waller (http://www.tanos.co.uk/).<br />
     Hangul data comes from libhangul (http://code.google.com/p/libhangul/), specifically the hanja.txt file released under the BSD 3-clause license. Copyright and all rights reserved by Choe Hwanjin.<br />
     Pinyin comes from CC-CEDICT (http://www.mdbg.net/chindict/chindict.php?page=cc-cedict).

   Please attribute only the changes and additions of this database to me, by e.g. displaying the following or similar text on your website or the "About" page in your application (and on the iTunes App Store/Google Play Store description):<br />
     "The pitch accent notation, verb particle data, phonetics, homonyms and other additions or modifications to EDICT, KANJIDIC or KRADFILE were provided by Uros Ozvatic through his free database."

-----------

2) NOTES

   * *kanjidb.sqlite*:<br />
      '*frequency*' column in compverbs, edict, jukugo tables: frequencies marked with a * are ambiguous. For example, 七 is read シチ and なな. It is impossible to know which reading the frequency is based on. Frequencies are based on an analysis of over 5,000 novels.<br />
      '*particles*' column in compverbs, edict, jukugo tables: join with *sentences.particle* to output sentences containing that particle+word (parse first if multiple particles)<br />
      * conjugations table:<br />
             * *conjugations.search*: each reading is enclosed with ";" to "simulate" full-text-search (FTS) of Japanese without a tokenizer<br />
      * elements table:<br />
             * *elements.grade*: 1=jouyou, 2=jinmeiyou, 3=hyougaiji<br />
             * *elements.idc*: ideographic description character (kanji shape); see *multielements.txt* for mapping table to images in *idc_images* folder<br />
             * *elements.elements*: 3-byte characters for multi-elements lookup system; see *multielements.txt* for element list and mapping table (for example, "屶 = 山": show 山 on website/app, but search for 屶)<br />
             * *elements.extra_elements*: for input box to search for kanji that contain a certain kanji (non-radicals that are not on the multi-elements lookup system only), for example, search for 合 will return 姶, 恰, etc.<br />
             * *elements.kanji_parts*: list of elements that the kanji is made of (different from *elements.elements*; doesn't show 屶 for example but only 山)<br />
             * *elements.part_of*: list of kanji that contain the particular kanji<br />
      * kanjidict table (note the "T" to separate it from KANJIDIC):<br />
             * *kanjidict.reg_on* & *kanjidict.reg_kun*: readings marked with * are less common<br />
             * *kanjidict.frequency*: mean of various frequency lists<br />
             * *kanjidict.meaning*: three labels are appended to some kanji as the last meaning, but they should ideally be a separate field: *(kokuji)*, *(extended shinjitai)*, *(ghost character)*<br />
             * *kanjidict.compact_meaning*: common meanings (limited to jouyou kanji only)<br />
      * pinyin table:<br />
             * *pinyin.pinyin*: readings in brackets are exclusive to Taiwan<br />
      * search table:<br />
             * *search.reg_reading* & *search.reading*: each reading is enclosed with ";" to "simulate" full-text-search (FTS) of Japanese without a tokenizer<br />
      * segments table:<br />
             * *segments.location*: location where the reading is: *J*=jukugo, *C*=compverbs, *Y*=yojijukugo. Combinations are also possible: *CY*, *JC*, *JY*<br />
      * sentences table:<br />
             * *sentences.obi2*: this is the Obi-2 readability score of the sentence (http://kotoba.nuee.nagoya-u.ac.jp/sc/obi2/obi_e.html)<br /> 
      * variants table:<br />
             * *variants.traditional*: traditional Chinese (Taiwan) characters. *(C)* means the character is frequently used (Common) in Taiwan<br />
             * *variants.simplified*: simplified Chinese characters. *(C)* means the character is frequently used (Common) in Mainland China<br />
             * *variants.simplified2*: ultra-simplified Chinese (non-official simplifications, requires *Ultra-simplified.woff/svg* font to view)<br />
             * *variants.ryakuji*: common ryakuji characters. Requires *ryakuji.woff/svg* font to view correctly<br />

   This should cover the ambiguities in the database. Everything else is (hopefully) covered at http://igg.me/at/kanjiproject.

   * Other notes:<br />
      * The following kanji have duplicate index numbers (RTK, KO): 𠮟,叱; 塡,填; 剝,剥; 頰,頬; 喻,喩; 籠,篭, and 𠮟 & 叱 also have identical frequency ranks<br />
      * It is very likely some kanji past the 6,355 mark (including the jouyou kanji 𠮟 above), radical variants and phonetics will not render on some mobile devices or even computers because the required fonts are not installed. For some cases, it is required to have the *HanaMinA* & *HanaMinB* (http://fonts.jp/hanazono/) (or similar) fonts installed! 3 phonetics and 1 kanji are not even encoded in Unicode (last 4 in the tables), and are assigned a Private Use Area code<br />
      * Onyomi words (e.g. 一 ichi) in the edict table are written with katakana, as opposed to hiragana in Jim Breen's EDICT/JMdict, thus they need to be converted before trying to synchronize with EDICT/JMdict<br />
      * */data/accent.css* is an example CSS file to properly render the pitch accent information<br />

   * */data/source_files/raw* folder:<br />
      * *accents.txt*: file containing pitch accent mora locations for 124,137 words. Use this to generate pitch accent data for any other words not in my database<br />
      * *particles.txt*: file containing particle+verb pairs, Japanese sentences and English translations (from Tatoeba). Use this to extract particle data for any other verbs not in my database<br />
      * *wikipedia_freq.txt*: file containing word frequency based on an analysis of Japanese Wikipedia<br />
      * *novels_freq.txt*: file containing word frequency based on an analysis of over 5,000 novels<br />
      * *mecab-furigana.rb* & *furigana.rb*: Ruby scripts to generate furigana; author is "lauri_ranta"<br />
      * *word_segmentation.txt*: link to a Python script (Ryuujouji) by Houssam Salem to segment words into individual character readings. The script is not a part of this package due to its GPL license. Also note that the script does not currently take renjou (連声) into account, but there are not a lot of such words in the Japanese language<br />

   * */images* folder:<br />
      * All the images are saved with a character's decimal numeric character reference as the filename<br />

   * */misc* folder:<br />
      * *ghost.txt*: "ghost kanji" - questionable characters that were encoded into the JIS X 02xx standards (and Unicode) by mistake<br />
      * *repeat.txt*: kanji where one element repeats 3 times<br />
      * *xxx_yypercent.txt*: x number of kanji required to read y percent of Wikipedia<br />
      * *surnames.txt*: some of the most common Japanese surnames and the kanji required to know how to read them<br />
      * *boynames.txt*: some of the most common Japanese boy names and the kanji required to know how to read them<br />
      * *girlnames.txt*: some of the most common Japanese girl names and the kanji required to know how to read them<br />
      * *unknown.txt*: kanji with no known meaning<br />
      * *future.txt*: jouyou kanji that should be simplified, but probably won't be<br />
      * *common_elements.txt*: most frequent elements kanji are composed of<br />
      * *confusing_okurigana.txt*: words where different readings share the same okurigana<br />
      * *irregular_readings.txt*: some words/place names with weird or irregular (missing okurigana) readings<br />
      * *jukujikun.txt*: list of official jukujikun and below a list of unofficial jukujikun<br />
