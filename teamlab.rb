def three_include
  #each文
  (1..30000).each do |num| # 1から30000までの数字を繰り返し処理
    if num % 3 == 0 || num.to_s.include?("3") # 3で割り切れるか3が含まれる数字であれば表示
      # p num
    end
  end
end

p three_include().sum # 3で割り切れるか3が含まれる数字の合計を表示


# -----------------------------------------------------------------------------------------


# トリボナッチ数列(python)

=begin

def tribonacci_list(n, t0, t1, t2):
    tri = [t0, t1, t2]
    if n == 1:
        tri = [t0]
    elif n == 2:
        tri = [t0, t1]
    else:
        for k in range(3, n):
            tri.append(tri[k-1]+tri[k-2]+tri[k-3])
    return tri

tri = tribonacci_list(32, 1, 0, 5) # 1,0,5の数字から始まる数字で、最後の数字を含む3つの和を足し続けていき、32番目の時の数字の和を求める
print(tri)


=end