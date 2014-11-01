#!/bin/env ruby
# encoding: utf-8
#author: "lauri_ranta" http://jptxt.net/scripts.html
def kata2hira(x)
  x.gsub(/[\u{30a1}-\u{30fa}]/) { [$&.ord - 96].pack("U") }
end

def amp(x)
  x.gsub("&", "&amp;").gsub("<", "&lt;").gsub(">", "&gt;")
end

def furigana(word, reading)
  hira = kata2hira(reading)
  if word == reading or reading == "" or word =~ /^[\u{3040}-\u{30ff}\u{ff00}-\u{ffef}]+$/
    word
  elsif word == hira
    word
  elsif word =~ /^[\u{4e00}-\u{9fff}]+$/
    "<ruby><rb>#{amp(word)}</rb><rp>(</rp><rt>#{amp(hira)}</rt><rp>)</rp></ruby>"
  else
    groups = word.scan(/(?:[^\u{3040}-\u{30ff}]+|[\u{3040}-\u{30ff}]+)/)
    regex = "^" + groups.map { |g|
      if g =~ /^[\u{3040}-\u{30ff}]+$/
        "(#{Regexp.escape(kata2hira(g))}|#{Regexp.escape(g)})"
      else
        "(.+?)"
      end
    }.join + "$"
    kanagroups = hira.scan(Regexp.new(regex))[0]
    return "<ruby><rb>#{amp(word)}</rb><rp>(</rp><rt>#{amp(hira)}</rt><rp>)</rp></ruby>" unless kanagroups
    0.upto(groups.length - 1) { |i|
      unless groups[i] =~ /[\u{3040}-\u{30ff}]/
        groups[i] = "<ruby><rb>#{amp(groups[i])}</rb><rp>(</rp><rt>#{amp(kanagroups[i])}</rt><rp>)</rp></ruby>"
      end
    }
    groups.join
  end
end

if __FILE__ == $0
  "次々 つぎつぎ
ユニークな ユニークな
痛い いたい
困難な こんなんな
言い訳 いいわけ
ごろごろ
カット かっと
くっ付ける くっつける
ジェット機 じぇっとき
湿っぽい しめっぽい
東京ドーム とうきょうドーム
３月 さんげつ
一ヶ月 いっかげつ
Ｘ線 エックスせん
八ッ橋 やつはし
４ヵ年 よんかねん
ィ形容詞 イけいようし
黄色い きいろい
物の怪 もののけ
鬼に金棒 おににかなぼう
千円貸してください せんえんかしてください".split("\n").each { |line|
    puts furigana(*line.split(" ", 2))
  }
end