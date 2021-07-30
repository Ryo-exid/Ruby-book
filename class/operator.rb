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