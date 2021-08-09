=begin

モジュールではなくクラスを使ってデザインパターン本来の「シングルトンパターン」を実現する場合Singletonモジュールを使うと便利

・newメソッドがprivateメソッドになり、外部から呼び出せなくなる。
・クラスの特異メソッドとしてinstanceメソッドが定義され、ここから「唯一、1つだけ」のインスタンスを取得できる

=end

require 'singleton'

class Configuration
  include Singleton

  attr_accessor :base_url, :debug_mode

  def initialize
    # 設定値を初期化する
    @base_url = ''
    @debug_mode = false
  end
end

# Configurationクラスはnewできない
# config = Configuration.new #=> NoMethodError

# instanceメソッドを使ってインスタンスを取得する
config = Configuration.instance
# 設定値を設定する
config.base_url = 'http://example.com'
config.debug_mode = true

# instanceメソッドを使って再度インスタンスを取得する
other = Configuration.instance

# 先程設定した設定値を取得できる
p other.base_url #=> "http://example.com"
p other.debug_mode #=> true

# どちらも全く同じオブジェクト（インスタンス）になっている
p config.object_id #=> 20256800
p other.object_id #=> 20256800
p config.equal?(other) #=> true