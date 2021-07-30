# equal?（object_idが等しい場合にtrueを返す。つまりまったく同じインスタンスかどうかを判断する場合に用いる。）

a = 'abc'
b = 'abc'
p a.equal?(b) # => false

c = a
p a.equal?(c) # => true


puts '①---------------------------'


# 前提知識
# 1 == 1.0 #=> true


# eql?メソッド（ハッシュのキーとして2つのオブジェクトが等しいかどうかを判断）

# ハッシュ上では1と1.0は別々のキーとして扱われる
h = { 1 => 'Integer', 1.0 => 'Float' }
p h[1] #=> "Integer"
p h[1.0] #=> "Float"

# 異なるキーとして扱われるのは、eql?メソッドで比較したときにfalseになるため
p 1.eql?(1.0) #=> false


a = 'Japan'
b = 'Japan'

# eql?が真なら、hashも同じ
p a.eql?(b) #=> true

p a.hash #=> -2719629359117629138
p b.hash #=> -2719629359117629138

c = 1
d = 1.0

# eql?が偽なら、hash値も異なる
p c.eql?(d) #=> false
p c.hash #=> -2103941603464300079
p d.hash #=> -4364889034759001924


puts '②---------------------------'


# ===（whan節のオブジェクト === case文のオブジェクト の結果を評価。case文のwhen節で使われる。）

text = '03-1234-5678'

case text
when /^\d{3}-\d{4}$/ # ^は先頭、$は行末を表す
  puts '郵便番号です'
when /^\d{4}\d{1,2}\d{1,2}$/
  puts '日付です'
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end
#=> 電話番号です


=begin


上記コードを実行すると内部的には

/^\d{3}-\d{4}$/ === text
や
/^\d{4}\d{1,2}\d{1,2}$/ === text

のように
when === case の結果を評価している


=end


# オブジェクトのデータ型（所属するクラス）を識別することが可能

value = [1, 2, 3]

# 内部的には String === value、Array === value、Hash === valueの結果が評価されている
case value
when String
  puts '文字列です'
when Array
  puts '配列です'
when Hash
  puts 'ハッシュです'
end
#=> 配列です

# このように独自に定義したクラスのオブジェクトをcase文のwhen節の中で使いたい場合は、===を要件に合わせて再定義する。