require 'minitest/autorun'
require './lib/bank'
require './lib/team'

class DeepFreezableTest < Minitest::Test
  def test_deep_freeze_to_array
    assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES # 配列の値は正しいか？
    assert Team::COUNTRIES.frozen? # 配列自身がfreezeされているか？
    assert Team::COUNTRIES.all? { |country| country.frozen? } # 配列の要素すべてがfreezeされているか？
  end
end