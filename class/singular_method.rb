# 特異メソッド（特定のオブジェクトにだけ紐付くメソッド） ※数値やシンボルだけはRubyの実装上の制約により特異メソッドを定義できない


alice = 'I am Alice.'
bob = 'I am Bob'

# aliceのオブジェクトにだけ、shuffleメソッドを定義する
def alice.shuffle
  chars.shuffle.join
end

# aliceはshuffleメソッドを持つが、bobは持たない
p alice.shuffle #=> " aIAclei.m "
# p bob.shuffle #=> NoMethodError


puts '---------------------------------------------------------------'


# 次のような方法での定義も可能

alice = 'I am Alice.'

class << alice
  def shuffle
    chars.shuffle.join
  end
end
p alice.shuffle #=> ".i aIe Aclm"


puts '---------------------------------------------------------------'


# クラスメソッドは特異メソッドの一種

# クラスメソッドを定義するコード例

class User
  def self.hello
    'Hello'
  end

  class << self
    def hi
      'Hi.'
    end
  end
end

# 特異メソッドを定義するコード例
alice = 'I am alice.'

def alice.hello
  'Hello'
end

class << alice
  def hi
    'Hi.'
  end
end


# -------------------------------------------------------------------


# クラスメソッドは以下のようなコードで定義することも可能

class User
end

# クラス構文の外部でクラスメソッドを定義する方法1
def User.hello
  'Hello!'
end

# クラス構文の外部でクラスメソッドを定義する方法2
class << User
  def hi
    'Hi.'
  end
end

p User.hello #=> "Hello!"
p User.hi #=> "Hi."