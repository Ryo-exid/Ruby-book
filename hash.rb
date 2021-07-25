# イタリアの通貨を追加するコード
currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }
currencies['italy'] = 'euro'
p currencies
# 既存の値を上書き
currencies['japan'] = '円'
p currencies

# ハッシュを取り出す
p currencies['india']


puts '①---------------------------'


# ハッシュを使った繰り返し処理

currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }

currencies.each do |key, value| # ブロック引数2つの場合
  puts "#{key} : #{value}"
end


puts '②---------------------------'


currencies = { 'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee' }

currencies.each do |key_value| # ブロック引数1つの場合
  key = key_value[0]
  value = key_value[1]
  puts "#{key} : #{value}"
end


puts '③---------------------------'