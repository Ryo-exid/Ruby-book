# Rubyにおける正規表現オブジェクト

regex = /\d{3}-\d{4}/
p regex.class #=> Regexp


# if文で =~ を使うとマッチしたかどうかを判別できる
if '123-4567' =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end
#=> マッチしました



text = '私の誕生日は1996年7月7日です。'
m = /(\d+)年(\d+)月(\d+)日/.match(text)
p m[1] #=> "1996"
p m[2] #=> "7"
p m[3] #=> "7"


p /(\d+)年(\d+)月(\d+)日/.match(text) #=> #<MatchData "1996年7月7日" 1:"1996" 2:"7" 3:"7">



text = '私の誕生日は1996年7月7日です。'

if m = /(\d+)年(\d+)月(\d+)日/.match(text)
  # マッチした場合の処理
else
  # マッチしなかった場合の処理
end


puts '①---------------------------'


# キャプチャの結果に名前をつける

text = '私の誕生日は1996年7月7日です。'

m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)

p m[:year] #=> "1996"
p m[:month] #=> "7"
p m[:day] #=> "7"

# 文字列で指定もできる
p m['year']


# =~演算子を使うと、キャプチャの名前がそのままローカル変数に割り当てられる ※左辺と右辺が逆だと使うことができない。
text = '私の誕生日は1996年7月7日です。'

if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}/#{month}/#{day}"
end
#=> 1996/7/7


=begin


正規表現オブジェクトを一旦変数に入れたりした場合も使うことができない

---------------------------------------------------------
text = '私の誕生日は1996年7月7日です。'
regrexp = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/

if regrexp =~ text
  puts "#{year}/#{month}/#{day}"
end

#=> NameError
---------------------------------------------------------


=end


puts '②---------------------------'


# scanメソッド（引数で渡した正規表現にマッチする部分を配列に入れて返す）
p '123 456 789'.scan(/\d+/) #=> ["123", "456", "789"]

p '1996年12月31日 2021年7月28日'.scan(/(\d+)年(\d+)月(\d+)日/) #=> [["1996", "12", "31"], ["2021", "7", "28"]]

# グループ化はしたいがキャプチャはしたくないという場合は (?:) というメタ文字を使用
p '1996年12月31日 2021年7月28日'.scan(/(?:\d+)年(?:\d+)月(?:\d+)日/) #=> ["1996年12月31日", "2021年7月28日"]


puts '③---------------------------'


# []


# []に正規表現を渡すと、文字列から正規表現にマッチした部分を抜き出す
text = '郵便番号は123-4567です'
p text[/\d{3}-\d{4}/] #=> "123-4567"

# マッチする部分が複数ある場合は、最初にマッチした文字列が返る
text = '333-3333 456-7890'
p text[/\d{3}-\d{4}/] #=> "333-3333"


# キャプチャを使うと第2引数で指定して取得できる
text = "誕生日は2000年12月31日です"
p text[/(\d+)年(\d+)月(\d+)日/, 3] #=>"31"

# シンボルで指定
p text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, :month] #=>"12"

# 文字列で指定
p text[/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/, 'year'] #=>"2000"


puts '④---------------------------'


# slice（[]のエイリアスメソッド）
text = '郵便番号は123-4567です'
p text.slice(/\d{3}-\d{4}/) #=> ""123-4567

# slice!（マッチした部分が文字列から破壊的に取り除かれる）
text = '郵便番号は123-4567です'
text.slice!(/\d{3}-\d{4}/)
p text #=> "郵便番号はです"


puts '⑤---------------------------'


# split（マッチした文字列を区切り文字にして文字列を分解し、配列として返す）

text = '123,456-789'
# 文字列で区切り文字を指定する
p text.split(',') #=>["123", "456-789"]

# 正規表現を使ってカンマまたはハイフンを区切り文字に指定
p text.split(/,|-/) #=> ["123", "456", "789"]