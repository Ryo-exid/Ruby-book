# ハッシュで使用頻度が高いメソッド


# keys（ハッシュのキーを配列として返す）
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.keys #=> [:japan, :us, :india]


# values（ハッシュの値を配列として返す）
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.values #=> ["yen", "dollar", "rupee"]


# has_key?/key?/include?/member?（ハッシュの中に指定されたキーが存在するかどうかを確認）
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
p currencies.has_key?(:japan) #=> true
p currencies.has_key?(:italy) #=> false


puts '①---------------------------'


# **でハッシュを展開させる

h = { us: 'dollar', india: 'rupee' }
# 変数hのキーと値を**で展開（**を付けない場合は構文エラーになる）
p g = { japan: 'yen', **h } #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}


puts '②---------------------------'


# 擬似キーワード引数（ハッシュを受け取ってキーワード引数のように見せるテクニック）

# ハッシュを引数として受け取り、擬似キーワード引数を実現する
def buy_burger(menu, options = {})
  drink = options[:drink]
  potato = options[:potato]
  # 省略
end
p buy_burger('cheese', drink: true, potato: true)
p buy_burger('fish', salad: true) # 擬似キーワード引数はどんな値を渡してもエラーにならない（無効なキーをエラーにするには明示的な実装が必要）
