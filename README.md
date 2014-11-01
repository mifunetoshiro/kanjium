This file contains brief notes for a few things that need to be explained or pointed out.

CONTENTS:

	1. License, Copyright and Acknowledgements
	2. Notes
	3. To-Do

-----------

1. LICENSE, COPYRIGHT AND ACKNOWLEDGEMENTS

	Everything* in this package is licensed under the Creative Commons Attribution-ShareAlike 4.0 International license.
	You can find the copy of this license in the file LICENSE.txt, or at:
		http://creativecommons.org/licenses/by-sa/4.0/legalcode
	The human-readable summary of the license is available at:
		http://creativecommons.org/licenses/by-sa/4.0/

	You are free to use or modify the data however you like (for commercial or non-commercial purposes).

	* The majority of the data from this database comes from 3 main projects by the Electronic Dictionary Research and Development Group (EDRDG), led by James William Breen: EDICT (http://www.csse.monash.edu.au/~jwb/edict.html), KANJIDIC (http://www.csse.monash.edu.au/~jwb/kanjidic.html), KRADFILE (http://www.csse.monash.edu.au/~jwb/kradinf.html). These files are the property of the Group, and are used in conformance with the Group's license (http://www.edrdg.org/edrdg/licence.html).
		Example sentences come from the Tatoeba.org project.
		The copyright, author/s and license information of the fonts is embedded in their metadata. All are free to use.
		~6,400 kanji stroke order images were generated from the KanjiStrokeOrders font by Tim Eyre (http://www.nihilist.org.uk/). Copyright is held by Ulrich Apel and the Wadoku project (http://www.wadoku.de/).
		JLPT data for words comes from Jonathan Waller (http://www.tanos.co.uk/).
		Pinyin comes from CC-CEDICT (http://www.mdbg.net/chindict/chindict.php?page=cc-cedict).

	Please attribute only the changes and additions of this database to me, by e.g. displaying the following or similar text on your website or the "About" page in your application (and on the iTunes App Store/Google Play Store description):
		"The pitch accent notation, verb particle data, phonetics, homonyms and other additions or modifications to EDICT, KANJIDIC or KRADFILE were provided by Uros Ozvatic through his free database."

-----------

2. NOTES

	kanjidb.sqlite:
		'particles' column in compverbs, edict, jukugo tables: join with sentences.particle to output sentences containing that particle+word (parse first if multiple particles)
		'frequency' column in compverbs, edict, jukugo tables: frequencies marked with a * are ambiguous. For example, ? is read ?? and ??. It is impossible to know which reading the frequency is based on. Frequencies are based on an analysis of over 5,000 novels.
		elements table:
			elements.grade: 1=jouyou, 2=jinmeiyou, 3=hyougaiji
			elements.idc: ideographic description character (kanji shape); see multielements.txt for mapping table to images in idc_images folder
			elements.elements: 3-byte characters for multi-elements lookup system; see multielements.txt for element list and mapping table (for example, "? = ?": show ? on website/app, but search for ?)
			elements.extra_elements: for input box to search for kanji that contain a certain kanji (non-radicals that are not on the multi-elements lookup system only), for example, search for ? will return ?, ?, etc.
			elements.kanji_parts: list of elements that the kanji is made of (different from elements.elements; doesn't show ? for example but only ?)
			elements.part_of: list of kanji that contain the particular kanji
		segments table:
			segments.location: location where the reading is: J=jukugo, C=compverbs, Y=yojijukugo. Combinations are possible: CY, JC, JY
		kanjidict (note the "T" to separate it from KANJIDIC) table:
			kanjidict.reg_on & kanjidict.reg_kun: readings marked with * are less common
			kanjidict.frequency: mean of various frequency lists
			kanjidict.meaning: three labels are appended to some kanji as the last meaning, but they should really be a separate field: (kokuji), (extended shinjitai), (ghost character)
			kanjidict.compact_meaning: common meanings (limited to jouyou kanji only)
		search table:
			search.reg_reading & search.reading: each reading is enclosed with ";" to "simulate" full-text-search (FTS) of Japanese without a tokenizer
		conjugations table:
			conjugations.search: each reading is enclosed with ";" to "simulate" full-text-search (FTS) of Japanese without a tokenizer
		variants table:
			variants.traditional: traditional Chinese (Taiwan) characters. (C) means the character is frequently used (Common) in Taiwan
			variants.simplified: simplified Chinese characters. (C) means the character is frequently used (Common) in Mainland China
			variants.simplified2: ultra-simplified Chinese (non-official simplifications, requires Ultra-simplified.woff/svg font to view)
			variants.ryakuji: common ryakuji characters. Requires ryakuji.woff/svg font to view correctly
		pinyin table:
			pinyin.pinyin: readings in brackets are exclusive to Taiwan
	This should cover the ambiguities in the database. Everything else is (hopefully) covered at http://igg.me/at/kanjiproject.

	Other notes:
		The following kanji have duplicate index numbers (RTK, KO): ??,?; ?,?; ?,?; ?,?; ?,?; ?,?.
		It is very likely some kanji past the 6355 mark (including the jouyou kanji ?? above), radical variants and phonetics will not render on some mobile devices or even computers because the required fonts are not installed. For some cases, it is required to have the HanaMinA & HanaMinB (http://fonts.jp/hanazono/) (or similar) fonts installed! 3 phonetics and 1 kanji are not even encoded in Unicode (last 4 in 'kanjidict' table), and are assigned a Private Use Area code.
		Onyomi words (e.g. ? ichi) in the edict table are written with katakana, as opposed to hiragana in Jim Breen's EDICT/JMdict, thus they need to be converted before trying to synchronize with EDICT/JMdict
		/data/accent.css is an example CSS file to properly render the pitch accent information

	/data/source_files/raw folder:
		accents.txt: file containing pitch accent mora locations for 124,137 words. Use this to generate pitch accent data for any other words not in my database.
		particles.txt: file containing particle+verb pairs, Japanese sentences and English translations (from Tatoeba). Use this to extract particle data for any other verbs not in my database.
		wikipedia_freq.txt: file containing word frequency based on an analysis of Japanese Wikipedia
		novels_freq.txt: file containing word frequency based on an analysis of over 5,000 novels
		mecab-furigana.rb & furigana.rb: Ruby scripts to generate furigana; author is "lauri_ranta"
		word_segmentation.txt: link to a Python script (Ryuujouji) by Houssam Salem to segment words into individual character readings. The script is not a part of this package due to its GPL license. Also note that the script does not currently take renjou (??) into account, but there are not a lot of such words in the Japanese language.

	/misc folder:
		ghost.txt: "ghost kanji" - questionable characters that were encoded into the JIS X 02xx standards (and Unicode) by mistake
		repeat.txt: kanji where one element repeats 3 times
		xxx_yypercent.txt: x number of kanji required to read y percent of Wikipedia
		surnames.txt: some of the most common Japanese surnames and the kanji required to know how to read them
		boynames.txt: some of the most common Japanese boy names and the kanji required to know how to read them
		girlnames.txt: some of the most common Japanese girl names and the kanji required to know how to read them
		unknown.txt: kanji with no known meaning
		future.txt: jouyou kanji that should be simplified, but probably won't be
		common_elements.txt: most frequent elements kanji are composed of
		confusing_okurigana.txt: words where different readings share the same okurigana
		irregular_readings.txt: some words/place names with weird or irregular (missing okurigana) readings
		jukujikun.txt: list of official jukujikun and below a list of unofficial jukujikun

-----------

3. TO-DO

	For the Japanese sentences, I wanted to include a "difficulty" scale by taking the Hayashi score (http://www.ideosity.com/ourblog/post/ideosphere-blog/2010/01/14/readability-tests-and-formulas#Hayashi) and word frequency into account. I think this would be an interesting bit of information, but I lack the programming skills to do it.
	An example C# code by Christopher Brochtrup (cb4960) for calculating the Hayashi score can be found here: http://pastebin.com/196BBEpg. Hopefully one of you with the skills required will generate the data and make it or the script available to the public.
