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


# !!を使った真偽値の型変換（確実にtrueまたはfalseを返すイディオム）

=begin

def user_exists?
  # データベースなどからユーザを探す（なければnil）
  user = find_user
  if user
    true # userが見つかったのでtrue
  else
    false # userが見つからなかったのでfalse
  end
end

=end

#上のコードをコンパクトにする
def user_exists?
  !!find_user
end


=begin

!は否定の演算子。
!Aと書いた場合、Aが真であればfalseを、そうでなければtrueを返す。
つまりtrueかfalseに変換される。
ここでもう一度!で反転させると、元のAni対応する真偽値がtrueまたはfalseとして得ることが出来る。

=end

p !!true #=> true
p !!1 #=> true
p !! false #=> false
p !! nil #=> false