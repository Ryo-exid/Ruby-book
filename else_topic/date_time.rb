# Dateクラスは日付を扱うクラス、TimeとDateTimeクラスは日付と時刻を扱うクラス（Timeクラスだけはrequireせずに使える）

# Timeクラスで日時を表すオブジェクトを作成する
time = Time.new(2017, 1, 31, 23, 30, 50)
p time #=> 2017-01-31 23:30:50 +0000


# dateライブラリをrequireするとDateクラスとDateTimeクラスが使えるようになる
require 'date'


# Dateクラスで日付を表すオブジェクトを作成
date = Date.new(2017, 1, 31)
p date #=> #<Date: 2017-01-31 ((2457785j,0s,0n),+0s,2299161j)>


# DateTimeクラスで日時を表すオブジェクトを作成
 date_time = DateTime.new(2017, 1, 31, 23, 30, 50)
 p date_time #=> #<DateTime: 2017-01-31T23:30:50+00:00 ((2457785j,84650s,0n),+0s,2299161j


# 機能的にはほとんど違いがない。
# Timeクラスはサマータイムやうるう秒を扱える。また、requireせず手軽に使える。