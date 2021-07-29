class User
  def initialize(name)
    @name = name # インスタンス変数に保存
  end

  def hello # インスタンスメソッドの定義
    # suffled_nameはローカル変数（メソッドやブロックの内部で作成される変数）
    shuffled_name = @name.chars.shuffle.join
    "Hello, I am #{shuffled_name}."
  end
end
# Userクラスのオブジェクト（インスタンス）
user = User.new('Alice')

# インスタンスメソッドの呼び出し
p user.hello #=> "Hello, I am lcAie."