# printデバッグ実行例  ※printデバッグをした後はデバッグのために追加したコードを忘れずに削除する

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


# -----------------------------------------------------------------


# printデバッグ/pとputsの使い分け（putsは戻り値がnilに、pは引数がそのまま戻り値になる）

def calc_fare(ticket)
  from = STATIONS.index(@name)
  # to - fromの結果をターミナルに出力しつつ、変数distanceに代入
  distance = p to - from
  FARES[distance - 1]
end