# sendメソッド
str = 'a,b,c'


# str.upcaseを呼ぶのと同じ
p str.send('upcase') #=> "A,B,C"


# str.split(',')を呼ぶのと同じ
p str.send('split', ',') #=> ["a", "b", "c"]