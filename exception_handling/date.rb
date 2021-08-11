# 例外処理の対象範囲と対象クラスを極力絞り込む

# "平成28年12月31日"のような日付文字列をDateクラスのオブジェクトに変換するメソッド

require 'date'

def convert_heisei_to_date(heisei_text)
  m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
  year = m[:jp_year].to_i + 1988
  month = m[:month].to_i
  day = m[:day].to_i
  # 例外処理の範囲を狭め、補足する例外クラスを限定する
  begin
    Date.new(year, month, day)
  rescue ArgumentError
    # 無効な日付であればnilを返す
    nil
  end
end

p convert_heisei_to_date('平成28年12月31日') #=> #<Date: 2016-12-31 ((2457754j,0s,0n),+0s,2299161j)>

p convert_heisei_to_date('平成28年99月99日') #=> nil