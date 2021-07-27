# 正規表現（Regular Expression） ※文字列の集合を一つの模試列で表現する方法のひとつ


=begin

初心者歓迎！手と目で覚える正規表現入門(参考記事)

その1  https://qiita.com/jnchito/items/893c887fbf19e17d3ff9
その2  https://qiita.com/jnchito/items/64c3fdc53766ac6f2008
その3  https://qiita.com/jnchito/items/6f0c885c1c4929092578
その4  https://qiita.com/jnchito/items/b0839f4f4651c29da408

=end


text = <<TEXT
I live Ruby.
Python is a great language.
Java and JavaScript are different.
TEXT

p text.scan(/[A-Z][A-Za-z]+/) #=> ["Ruby", "Python", "Java", "JavaScript"]



text = <<TEXT
私の郵便番号は1234567です。
僕の住所は6770056 東京都渋谷区初台1234だよ。
TEXT

puts text.gsub(/(\d{3})(\d{4})/, '\1-\2')

#=> 私の郵便番号は123-4567です。
#   僕の住所は677-0056 東京都渋谷区初台1234だよ


puts '①---------------------------'


