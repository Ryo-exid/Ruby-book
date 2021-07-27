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


# 正規表現入門その1  https://qiita.com/jnchito/items/893c887fbf19e17d3ff9


=begin

 \d は「1個の半角数字（0123456789）」を意味するメタ文字

 {n,m} は「直前の文字が n 個以上、m 個以下」の意味

 {n} とすれば「ちょうど n 文字」の意味

電話番号を検索するには、

\d{2,5}-\d{1,4}-\d{4}

とすることで検索することが出来る。



電話：03(1234)5678
のように、ハイフンだけではなくカッコにも対応するには

[ABC] と書けば、「AまたはBまたはCのいずれか1文字」の意味

\d{2,5}[-(]\d{1,4}[-)]\d{4}

とすることで検索することが出来る。



[a-z] と書くと、「aまたはbまたはcまたは・・・yまたはz」の意味になる

[a-zA-Z0-9] であれば「aまたはbまたは・・・z、AまたはBまたは・・・Z、0または1または・・・9」の意味になる。（端的に言うと、これは「半角英数字1文字」の意味）

[-az] や [az-] のように、ハイフンが [ ] の最初、または最後に置かれると「ハイフン1文字」の意味に変わる。

[-az] や [az-] は「aまたはzまたはハイフンのいずれか1文字」の意味


[0-9] という正規表現を入力すると、半角数字のみにマッチ（つまり \d と同じ）
[-09] と入力すると、「0または9またはハイフン」にマッチ



RFC（公式な仕様）に準拠した電子メールアドレスの「99.99%正確な正規表現」

(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])

現実的には「100%完璧ではなく、そこそこ正しいレベルの正規表現」で妥協することがよくある。



電話番号の「1文字目はゼロ、2文字目はゼロ以外の半角数字」

0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}

精度が上がり、"9999-99-9999" はマッチしなくなったが、"03(1234-5678" にはまだマッチしている


=end


text = <<-TEXT
名前：伊藤淳一
電話：03(1234)5678
？？：9999-99-9999
？？：03(1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT

p numbers = text.scan(/0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/) # => ["03(1234)5678", "03(1234-5678"]
p numbers.grep(/\(\d+\)|-\d+-/) # => ["03(1234)5678"]