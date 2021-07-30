# equal?（object_idが等しい場合にtrueを返す。つまりまったく同じインスタンスかどうかを判断する場合に用いる。）

a = 'abc'
b = 'abc'
p a.equal?(b) # => false

c = a
p a.equal?(c) # => true