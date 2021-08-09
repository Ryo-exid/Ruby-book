# 同名のクラスがあっても外側のモジュール名さえ異なっていれば名前の衝突は発生しなくなる

module Baseball
  # これはBaseballモジュールに属するSecondクラス
  class Second
    def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end

module Clock
  # これはClockモジュールに属するSecondクラス
  class Second
    def initialize(digits)
      @digits = digits
    end
  end
end


p Baseball::Second.new('Alice', 13)

p Clock::Second.new(13)


=begin


名前空間として使うモジュールがすでにどこかで定義されている場合、
ネストさせなくても "モジュール名::クラス名"のような形でクラスを定義することもできる


module Baseball
end

class Baseball::Second
  def initialize(player, uniform_number)
      @player = player
      @uniform_number = uniform_number
    end
  end
end


=end