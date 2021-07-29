# 変数への代入と条件分岐を同時に実現するイディオム

# 国名に応じて通過を返す（該当する通貨がなければnil）
def find_currency(country)
  currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
  currencies[country]
end

# 指定された国の通貨を大文字にして返す
def show_currency(country)
  currency = find_currency(country)
  # nilでないことをチェック(nilだとupcaseが呼び出せないため)
  if currency
    currency.upcase
  end
end

# 通貨が見つかる場合と見つからない場合の結果を確認
p show_currency(:japan) #=> "YEN"
p show_currency(:brazil) #=> nil



puts '---------------------------'


# show_currencyメソッドを$.演算子で書き換えることが出来る
def show_currency(country)
  currency = find_currency(country)
  currency&.upcase # nilの場合にエラーを起こさずnilを出す
end