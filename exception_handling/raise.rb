# 意図的に例外を発生させる
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # RuntimeErrorではなく、ArgumentErrorを発生させる
    raise ArgumentError, "無効な国名です。#{country}" # 例外を発生させるときはエラーメッセージをつけておくべき

    # raise ArgumentError.new("無効な国名です。#{country}")  ※この方法でも良い。
  end
end

currency_of(:italy) #=> ArgumentError: 無効な国名です。itary