require 'minitest/autorun'
require './lib/convert_hash_syntax'

class ConvertHashSyntaxTest < Minitest::Test
  # キーがシンボルなら新しいハッシュ記法に変換する
  def test_convert_hash_syntax
    old_syntax = <<~TEXT # <<~はヒアドキュメントからインデントを自動的に取り除いてくれる記法
      {
        :name => 'Alice',
        :age=>20,
        :gender  =>  :female
      }
    TEXT
    expected = <<~TEXT
      {
        name: 'Alice',
        age: 20,
        gender: :female
      }
    TEXT
    assert_equal expected, convert_hash_syntax(old_syntax)
  end
end