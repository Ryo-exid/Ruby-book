# refinementsを使うと独自の変更の有効範囲（スコープ）を限定することができる = 予期せぬバグやエラーに遭遇するリスクを低減することができる

# 以下、例としてrefinementsを使ってStringクラスに文字列の中身をランダムに入れ替えるshuffleメソッドを追加

module StringShuffle
  # refinementsが目的なので、refineメソッドを使う
  refine String do # Stringクラスに対する変更
    def shuffle
      chars.shuffle.join
    end
  end
end

class User
  using StringShuffle # refinementsを有効にするためにusingメソッドを使用

  def initialize(name)
    @name = name
  end

  def shuffled_name
    # Userクラスの内部であればStringクラスのshuffleメソッドが有効になる
    @name.shuffle
  end

  #Userクラスを抜けるとrefinementsは無効になる
end

user = User.new('Alice')
# Userクラス内ではshuffleメソッドが有効になっている
p user.shuffled_name #=> "ceAli"

# Userクラスを経由しない場合はshuffleメソッドは使えない
# p 'Alice'.shuffle #=> NoMethodError