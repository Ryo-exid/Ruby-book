class Ticket
  attr_reader :fare, :stamped_at # 運賃（fare）と乗車駅（stamped_at）が外部から取得できるようにゲッターメソッドを追加

  def initialize(fare)
    @fare = fare
  end

  def stamp(name)
    @stamped_at = name # stamped_atというインスタンス変数に駅名を格納
  end
end