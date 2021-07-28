class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [150, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name) # ticketクラスのstampを呼び出し、自分の駅名を渡す
  end

  def exit(ticket)
    # 運賃と切符の購入額を比較し、足りているかどうかを戻り値として返す
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket) # 外部からアクセスされないメソッドなので、本来はprivateメソッドにするべき

    from = STATIONS.index(ticket.stamped_at) # indexメソッドは、配列に中から引数に合致する要素の添字を取得するメソッド
    to = STATIONS.index(@name)

    distance = to - from # 乗車駅が:umeda、降車駅が:mikuniであればdistanceは「2 - 0 = 2」になる

    FARES[distance - 1] # 配列の添え字は0から始まるので、配列FARESから値を取得する場合はdeistanceの値から1を引く
  end
end