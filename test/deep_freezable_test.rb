require 'minitest/autorun'
require './lib/bank'
require './lib/team'

class DeepFreezableTest < Minitest::Test
  def test_deep_freeze_to_array
    assert_equal ['Japan', 'US', 'India'], Team::COUNTRIES # 配列の値は正しいか？
    assert Team::COUNTRIES.frozen? # 配列自身がfreezeされているか？
    assert Team::COUNTRIES.all? { |country| country.frozen? } # 配列の要素すべてがfreezeされているか？
  end

  def test_deep_freeze_to_hash
    # ハッシュの値は正しいのか？
    assert_equal(
      {'Japan' => 'yen', 'US' => 'dollar', 'India' => 'rupee' },
      Bank::CURRENCIES
    )
    assert Bank::CURRENCIES.frozen?
    assert Bank::CURRENCIES.all? { |key, value| key.frozen? && value.frozen? } # キーと値がすべてfreezeされているか？
  end
end