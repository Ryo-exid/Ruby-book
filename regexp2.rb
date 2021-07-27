# 正規表現入門その2  http://qiita.com/jnchito/items/64c3fdc53766ac6f2008

=begin


「◯が1文字、または無し」を表現するためには ? というメタ文字を使用。（文字量を指定するので 量指定子 のひとつ）

クープ[ 　・]?バ[ゲケ]ット


[ 　・] の部分では「半角スペースまたは全角スペースまたは中黒」と厳密に文字種を指定しなくても、現実的には「任意の1文字」という考えで十分だったりする。
「任意の1文字」を表す . というメタ文字（文字クラス）がある。

クープ.?バ[ゲケ]ット


=end


text = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT

puts text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)

#=> クープバゲットのパンは美味しかった。
#   今日はクープ バゲットさんに行きました。
#   クープ　バゲットのパンは最高。
#   また行きたいです。クープ・バゲット。
#   クープ・バケットのパン、売り切れだった（><）


puts '①---------------------------'

=begin

-----------------------------------------------------------------------
<select name="game_console">
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>


上記を「selectタグの中身（option）をCSVに変換する」（下記の結果にする）


wii_u,Wii U
ps4,プレステ4
gb,ゲームボーイ
-----------------------------------------------------------------------


「直前の文字が 1文字以上 」を表す場合は + というメタ文字（量指定子）を使用

「英数字またはアンダースコア」は [a-z0-9_]

よって、value="[a-z0-9_]+"のように書けばvalueの部分にマッチ



①まず行全体にマッチする正規表現を作成
<option value="[a-z0-9_]+">.+<\/option>

②valueと表示テキストをそれぞれ ( ) で囲む
<option value="([a-z0-9_]+)">(.+)<\/option>


.+ これは「任意の文字が1文字以上」の意味

「直前の文字が0文字以上」を表す場合は * というメタ文字（量指定子）を使用
.* に変更

<option value="([a-z0-9_]+)">(.*)<\/option>



「"selected"があり、または無し」というOR条件を追加

A? のような正規表現は「Aがあり、または無し」の意味
メタ文字の ? は2文字以上の文字列に対しても使える。ただしその場合は対象となる文字列を ( ) で囲む。

(ABC)? のように書くと、「文字列 ABC があり、または無し」の意味


<option value="([a-z0-9_]+)"( selected)?>(.*)<\/option>



( ) を使うと、すべての ( ) がキャプチャ対象になってしまう。
キャプチャする必要がない ( ) は (?: ) のように、?: をつける。


<option value="([a-z0-9_]+)"(?: selected)?>(.*)<\/option>



\d と [0-9] は同じ意味

[a-z0-9_]+ は [a-z\d_]+ に置き換えることが可能


<option value="([a-z\d_]+)"(?: selected)?>(.*)<\/option>



RubyやJavaScriptでは「\w = [a-zA-Z0-9_]（半角英数字とアンダースコア1文字） 」という仕様

[a-z\d_]+ は \w+ と書き換えてもほぼ同じ意味になる（厳密には\wを使うと大文字のアルファベットも含まれる点が異なる）。


<option value="(\w+)"(?: selected)?>(.*)<\/option>


=end


html = <<-HTML
<select name="game_console">
<option value="none"></option>
<option value="wii_u" selected>Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
HTML

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/, '\1,\2')

puts replaced

# <select name="game_console">
# none,
# wii_u,Wii U
# ps4,プレステ4
# gb,ゲームボーイ
# </select>


# \1 と \2 はそれぞれキャプチャされた1番目の文字列と2番目の文字列を表している。
# つまり、\1,\2 はマッチした文字列を value,表示テキスト の文字列に置換していることになる。


puts '②---------------------------'


# 重要： * と + は「貪欲」であることに注意！


html = <<-HTML
<option value="ps4">プレステ4</option><option value="gb">ゲームボーイ</option>
HTML

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*)<\/option>/, '\1,\2')

puts replaced #=> ps4,プレステ4</option><option value="gb">ゲーム


puts '③---------------------------'


# 解決策１：「任意の1文字」よりも厳しい条件を指定する

# [^AB] であれば「AでもなくBでもない任意の1文字」の意味
# よって、「< 以外の任意の文字」を表す場合は [^<]
html = <<-HTML
<option value="ps4">プレステ4</option><option value="gb">ゲームボーイ</option>
HTML

replaced = html.gsub(/<option value="(\w+)"(?: selected)?>([^<]*)<\/option>/, '\1,\2')

puts replaced


puts '④---------------------------'


# 解決策２：最短のマッチを返すように指定する

# * や + の「貪欲さ」をなくすこと

# >(.*)< の意味をもう少し厳密に書くと
# 「> で始まり、任意の文字が0個以上連続し（.*）、 最後に見つかった < で終わる」


# よって、「> で始まり、任意の文字が0個以上連続し（.*）、 最初に見つかった < で終わる」にする
# ? を付ける。
# *? や +? にすると最長ではなく、最短のマッチを結果として返すようになる（これを 最小量指定子 と呼ぶ）。


replaced = html.gsub(/<option value="(\w+)"(?: selected)?>(.*?)<\/option>/,'\1,\2')

puts replaced