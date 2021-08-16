# sendメソッド（レシーバーに対して指定した文字列（またはシンボル）のメソッドを実行する）
str = 'a,b,c'


# str.upcaseを呼ぶのと同じ
p str.send('upcase') #=> "A,B,C"


# str.split(',')を呼ぶのと同じ
p str.send('split', ',') #=> ["a", "b", "c"]