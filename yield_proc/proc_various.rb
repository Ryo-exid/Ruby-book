# Procオブジェクトを実行するさまざまな方法
add_proc = Proc.new { |a, b| a + b }

# callメソッドを使う
p add_proc.call(10, 20) #=> 30

#yieldメソッドを使う
p add_proc.yield(10, 20) #=> 30

# .()を使う
p add_proc.(10, 20) #=> 30

# []を使う
p add_proc[10, 20] #=> 30

# ===を使う
p add_proc === [10, 20] #=> 30


puts '---------------------------------------'


# Procオブジェクトとcase文を組み合わせて、大人、子供、二十歳のいずれかを判断する例
def judge(age)
  # 20より大きければtrueを返すProcオブジェクト
  adult = Proc.new { |n| n > 20 }

  # 20より小さければtrueを返すProcオブジェクト
  child = Proc.new { |n| n < 20 }

  case age
  when adult
    '大人です'
  when child
    '子供です'
  else
    'はたちです'
  end
end

p judge(25) #=> "大人です
p judge(18) #=> "子供です"
p judge(20) #=> "はたち"