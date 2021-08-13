# printデバッグ実行例

def to_hex(r, g, b)
  [r, g, b].inject('#') do |hex, n|
    puts hex # 変数（ブロック引数）の中身をターミナルに出力する
    hex + n.to_s(16).rjust(2, '0')
  end
end


# -----------------------------------------------------------------


# printデバッグは変数やメソッドの値を出力するだけではなく、メソッドや条件分岐が意図したとおりに実行されているかどうかを確認する場合にも使える。

def greeting(country)
  # greetingメソッドが呼ばれたことを確認
  puts 'greeting start'
  return 'countryを入力してください' if country.nil?

  if country == 'japan'
    puts 'japan' # 真の分岐に入ったことを確認
    'こんにちは'
  else
    puts 'other' # 偽の分岐に入ったことを確認
    'hello'
  end
end