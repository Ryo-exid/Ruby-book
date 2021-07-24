# %q! !はシングルクオートで囲むのと同じ意味
puts %q!① He said, "Dont speak."!


# %Q! !　または　%Q! !　はダブルクオートで囲むのと同じ意味（改行文字や式展開が使える）
something = "Hello."
puts %Q!② said, "#{something}"!


# 文字列は改行できる
puts 'Line 1,
Line2'


# 複数行に渡る長い文字列はヒアドキュメントを使った方がスッキリ書ける
a =  <<Text
③ これはヒアドキュメントです。
複数行に渡る長い文字列を作成するのに便利です。
Text

puts a


# フォーマットを指定して文字列を作成
puts sprintf('%0.5f', 1.2)


# 配列を連結して一つの文字列にする
a = [10,20,30].join
puts a