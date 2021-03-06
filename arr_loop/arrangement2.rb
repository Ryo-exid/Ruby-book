# 2つ目の要素から3つ分の要素を取り出す
a = [1, 2, 3, 4, 5]
p a[1, 3]


puts '①---------------------------'


# values_atメソッドを使うと、取得したい要素の添え字をを指定
a = [1, 2, 3, 4, 5]
p a.values_at(0, 2, 4)


puts '②---------------------------'


# 最後の文字を取得
a = [1, 2, 3]
p a[-1]

# 最後から2番目の文字を取得
p a[-2]

# 最後から2番目の要素から2つの要素を取得する
p a[-2, 2]

# lastメソッドでも最後の要素を取得できる
p a.last

p a.last(2)


puts '③---------------------------'


a = [1, 2, 3, 4, 5]
# 2つ目から3要素分を100で置き換える
a[1, 3] = 100
p a


# <<だけでなく、pushメソッドを使っても要素を追加できる
a = []
p a.push(1)
p a.push(2, 3)


puts '④---------------------------'


# 配列の連結
# concatメソッド（破壊的）か+演算子（変更なし）を使う

a = [1]
b = [2, 3]

p a.concat(b)

# aは変更される（破壊的）
p a
# bは変更されない
p b



a = [1]
b = [2, 3]

p a + b

# aもbも破戒されない
p a
p b


puts '⑤---------------------------'


# 配列の和集合
a = [1, 2, 3]
b = [3, 4, 5]

p a | b


# 配列の差集合
a = [1, 2, 3]
b = [3, 4, 5]

p a - b


# 配列の積集合（2つの配列に共通する要素を取得）
a = [1, 2, 3]
b = [3, 4, 5]

p a & b


puts '⑥---------------------------'


# はみ出した値が切り捨てられる
e, f = 100, 200, 300
p e
p f

# *を付けると残りの全要素を配列として受け取る
e, *f = 100, 200, 300
p e
p f


puts '⑦---------------------------'


# 複数の要素を一度に追加
a = []
a.push(1)
p a.push(2, 3)


a = []
b = [2, 3]
a.push(1)
p a.push(*b)


puts '⑧---------------------------'


#可変長引数（個数に制限のない引数のこと。自分で定義するメソッドで可変長引数を使いたい場合は引数名の手前に*をつける）

def greeting(*names)
  "#{names.join('と')}、こんにちは！"
end
p greeting('田中さん')
p greeting('田中さん', '鈴木さん')
p greeting('田中さん', '鈴木さん', '佐藤さん')



a = [1, 2, 3]
p [-1, 0, *a, 4, 5]


puts '⑨---------------------------'


# 文字列を配列に変換
p 'Ruby'.chars


# 以下のコードはa = []と同じ
a = Array.new


# 要素が5つの配列を作成(すべてnil)
p a = Array.new(5)


# 要素が5つで0を初期値とする配列を作成
p a = Array.new(5, 0)


# 要素数が10で、1,2,3,1,2,3...と繰り返す配列を作成
a = Array.new(10) { |n| n % 3 + 1}
p a


=begin

注意点: 文字列Stringはミュータブル（意味：変更可能な）なオブジェクトのため、ブロックにしないと下記の例のような不具合が発生

a = Array.new(5, default)
a #=> ["default", "default", "default", "default", "default"]

str = a[0]
str #=> "default"

str.upcase!
str #=> "DEFAULT"

a #=> ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]  すべて大文字に変わってしまう！


=end


# 上記の問題を避ける

a = Array.new(5) { 'default' }
p a

str = a[0]
p str

str.upcase!
p str

p a #=> ["DEFAULT", "default", "default", "default", "default"]


=begin

イミュータブル（意味：不変の）なオブジェクトであればブロックにしなくても上記のような問題は発生しない

・数値（integer/float）
・シンボル
・true/false
・nil

=end


puts '⑩---------------------------'


a = 'abcde'

# 3文字目を取得
p a[2]

# 2文字目から3文字分を取得
p a[1, 3]

# 最後の1文字を取得
p a[-1]

# 1文字目をXに置き換える
a[0] = 'X'
p a

# 2文字目から3文字分をYに置き換える
a[1, 3] = 'Y'
p a

# 末尾に"PQR"を連結する
p a << 'PQR'