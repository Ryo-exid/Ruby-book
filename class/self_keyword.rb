class User
  attr_accessor :name # attr_accessor はゲッター、セッターを定義しなくてもインスタンス変数参照、更新を可能にするメソッド

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    name = 'Bob' # 間違った例
  end

  def rename_to_carol
    # メソッド内でセッターメソッド（クラス外からでもインスタンス変数内の値を更新できるようにしたメソッドのこと）を呼び出す場合は必ずselfをつける！
    self.name = 'Carol'
  end

  def rename_to_dave
    @name = 'Dove' # 直接インスタンス変数を書き換える
  end
end
user = User.new('Alice')

user.rename_to_bob
p user.name #=> "Alice"

user.rename_to_carol
p user.name #=> "Carol"

user.rename_to_dave
p user.name #=> "Dove"