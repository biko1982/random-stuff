fibo = [1,1]
100.times do
  fibo.push(fibo[-1] + fibo[-2])
  fibo.shift
end

p fibo


#Sum of first X even fibonacci numbers
X    = 17
fibo = [1,1]

X.times do
  fibo.push((fibo[-1] * 4) + fibo[-2])			#According to https://oeis.org/A015448 the sequence of (3*n+2)th fibonacci numbers can be
                                            #obtained by generating the sequence n = 4*(n-1) + (n - 2)
  fibo.shift
end

p (fibo[-1] - 1) / 2  						          #According to https://oeis.org/A099919 the n-th sum of even fibonacci numbers is the
                                            #(3*n+2)th fibonacci number minus 1, divided by 2
