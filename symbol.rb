# シンボルと文字列の違い
p :apple.class #=> Symbol
p 'apple'.class #=> String

# 文字列よりもシンボルの方がメモリの使用効率が良い


# 文字列は破壊的な変更が可能

string = 'apple'
string.upcase!
p string


#シンボルはイミュータブル（不変）なので破壊的な変更は不可能


#シンボルをハッシュのキーにする
currencies = { :japan => 'yen', :us => 'dollar', :india => 'rupee' }
p currencies[:japan] # シンボルを使って値を取り出す（文字列より高速）


puts '①---------------------------'


# =>ではなく、"シンボル: 値"の記法でハッシュを作成
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies[:us] # 値を取り出す時は同じ


puts '②---------------------------'