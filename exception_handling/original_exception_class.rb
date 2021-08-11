# 独自の例外クラスを定義

class NoCountryError < StandardError
  # 独自のクラス名を与えるのが目的なので、コードは特に書かない（継承のみ）
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 独自に定義したNoCountryErrorを発生させる
    raise NoCountryError, "無効な国名です。#{country}"
  end
end

currency_of(:italy) #=> NoCountryError: 無効な国名です。italy