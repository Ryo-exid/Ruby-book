class User
  # weightは外部に公開しない
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 何かしらの理由でユーザ同士の体重を比較しなければならなくなった
  def heavier_than?(other_user)
    other_user.weight < @weight # 自分がother_userより重い場合はtrue
  end


  protected # 外部に公開したくないが、同じクラスやサブクラスの中であればレシーバー付きで呼び出せるようにする

  def weight
    @weight
  end
end

alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

# 同じクラスのインスタンスメソッド内であればweightが呼び出せる
p alice.heavier_than?(bob) #=> false
p bob.heavier_than?(alice) #=> true


# クラスの外ではweightは呼び出せない
# alice.weight #=> NoMethodError



=begin


# 後からprotectedメソッドに変更する場合（こちらの方がシンプルかも）

----------------------------------------------------
class User
  # 一旦publicメソッドとしてweightを定義する
  attr_reader :name :weight

  # weightのみ、あとからprotectedメソッドに変更する
  protected :weight

  # 省略
end
----------------------------------------------------


=end