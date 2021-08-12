module Effects
  def self.reverse
    # Procオブジェクト（ラムダ）をメソッドの戻り値にする
    ->(words) do
      # スペースで分解 > 逆順に並べ替え > スペースで連結
      words.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate)
    ->(words) do
      # スペースならそのまま返す
      # スペース以外ならその文字列を指定された回数だけ繰り返す
      words.chars.map { |c| c == ' ' ? c : c * rate }.join
    end
  end
end