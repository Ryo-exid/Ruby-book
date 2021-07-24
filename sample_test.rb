require 'minitest/autorun' # ライブラリを読み込む

class Sampletest < Minitest::Test # SampletestクラスがMinitest::Testクラスを継承 (class〜endまでがテストコードの本体)
  def test_sample # メソッド名をtest_で始めるのが必須
    assert_equal 'RUBY', 'ruby'.upcase # 実行結果を確認するための検証メソッド
   # assert_equal 期待する結果, テスト対象となる値や式
  end
end