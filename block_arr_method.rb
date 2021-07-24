# map

# 配列の各要素を10倍して新しい配列を作るコード
puts '①---------------------------'


numbers = [1, 2, 3, 4, 5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10 }
p new_numbers


puts '②---------------------------'

# mapメソッドは各要素に対してブロックを評価した新しい配列にして返す

numbers = [1, 2, 3, 4, 5]
new_numbers = numbers.map { |n| n * 10 }
p new_numbers


puts '③---------------------------'


# select

numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値が真になった要素のみ集められる
even_numbers = numbers.select { |n| n.even? }
p even_numbers


puts '④---------------------------'


# reject

numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値が偽である要素を集められる(下記は3の倍数のみ集める)
non_multiples_of_three = numbers.reject { |n| n % 3 == 0 }
p non_multiples_of_three


puts '⑤---------------------------'


# find

numbers = [1, 2, 3, 4, 5, 6]
# ブロックの戻り値が真になった最初の要素のみを返す
even_number = numbers.find { |n| n.even? }
p even_number


puts '⑥---------------------------'


# inject（畳み込み演算をおこなうメソッド）


numbers = [1, 2, 3, 4]
sum = numbers.inject(0) { |result, n| result + n }
p sum

# ・1回目：result = 0、 n = 1で、 0 + 1 = 1 この結果が次のresultに入る
# ・2回目：result = 1、 n = 2で、 1 + 2 = 3 この結果が次のresultに入る

p ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].inject('Sun') { |result, s| result + s }


puts '⑦---------------------------'

=begin
＆とシンボルでもっと簡潔に書く

条件
①ブロック引数が一個だけである
②メソッドには引数がない
③メソッドを一回呼び出す以外の処理がない
=end

# このコードは
p ['ruby', 'java', 'python'].map { |s| s.upcase }
# こう書き換えられる
p ['ruby', 'java', 'python'].map(&:upcase)


# このコードは
p [1, 2, 3, 4, 5, 6].select { |n| n.odd? }
# こう書き換えられる
p [1, 2, 3, 4, 5, 6].select(&:odd?)