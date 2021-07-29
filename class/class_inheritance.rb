# クラスメソッドの継承

class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end

# Fooを継承したBarでもクラスメソッドのhelloが呼び出せる
p Foo.hello #=> "hello"
p Bar.hello #=> "hello"

# ただしインスタンスメソッドに比べると、継承されたクラスメソッドを活用する機会は少ない