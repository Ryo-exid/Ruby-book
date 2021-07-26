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