# ||= を使った自己代入

limit ||= 10 # 意味：「変数limitがnilまたはfalseであれば、10を代入する（それ以外はlimitの値をそのまま使う）」
# limit = limit || 10   と考えるとわかりやすい



limit = nil
limit ||= 10
p limit #=> 10


limit = 20
limit ||= 10
p limit #=> 20


puts '---------------------------'