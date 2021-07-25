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