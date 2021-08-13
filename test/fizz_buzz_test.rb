require 'minitest/autorun'
require './lib/fizz_buzz' # 他のファイルの読み込み

class FizzBuzzTest < Minitest::Test
  def test_fizz_buzz
    # require 'byebug'; byebug # byebugライブラリをrequireし、それからbyebugメソッドを実行 ※2行に分けても良い
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'Fizz', fizz_buzz(6)
    assert_equal 'Fizz Buzz', fizz_buzz(15)
  end
end

# ターミナルで
# ruby test/fizz_buzz_test.rb
# を入力し、実行