# モジュールに他のモジュールをincludeする
module Greeting
  def hello
    'hello.'
  end
end

module Aisatsu
  # 別のモジュールをincludeする
  include Greeting

  def konnnichiwa
    'こんにちは。'
  end
end

class User
  # Aisatsuモジュールだけをinclude
  include Aisatsu
end

user = User.new

p user.konnnichiwa #=> "こんにちは。"

p user.hello #=> "hello."