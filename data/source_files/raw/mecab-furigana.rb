#!/bin/env ruby
# encoding: utf-8
#author: "lauri_ranta" http://jptxt.net/scripts.html
Encoding.default_external = Encoding::UTF_8
require "./furigana"

def mecab_furigana(line)
  IO.popen(["C:/Program Files/MeCab/bin/mecab.exe", "-F%m\\t%f[7]\\n", "-U%m\\t\\n", "-E", ""], "r+") { |io|
    io.puts line
    io.close_write
    io.read
  }.lines.map { |l| furigana(*l.chomp.split("\t", 2)) }.join
end

"「ＩＴ」は何の略か知っていますか。
この綱は直径２０ｃｍあるそうです。
妹は来年、二十歳になります。
今日の新聞、どこに置いた？
３月は仕事が忙しい。
彼は数学の博士だそうです。
彼女はＯＬです。
工事は３月まで続きます。
定価から２０００円割り引きますよ。
私の国について少しお話しましょう。
東京ドーム
10ヶ国
１２ヶ月
どうしよ～。
Ｘ線
Ｎｏ．２
命の親
〆切".split.each { |line|
  puts mecab_furigana(line)
}