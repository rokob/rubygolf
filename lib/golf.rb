class Golf
  def self.hole1(a)
    a.inject(1,:*)
  end

  def self.hole2(s)
    s.split.sort{|x,y| x[1]<=>y[1]}*" "
  end

  def self.hole3(n)
    (1..n).inject(1,:*)
  end

  def self.hole4(a)
    a.map { |x|
      case x
        when /(man\(.*\))/
          "hat(#{$1})"
        when /dog\((.*)\)/
          "dog(#{$1}(bone))"
        when /cat(\(.*\))/
          "dead#{$1}"
      end
    }
  end

  def self.hole5(a)
    r,l = [], a.size
    (0...l).map {|n| (1..l).map {|k| r << a.slice(n,k) }}
    r.uniq.sort_by {|x| [x.size, x[0]]}
  end

  def self.hole6(n)
    (1..n).map { |i| "#{[:fizz][i%3]}#{[:buzz][i%5]}"[/.+/] || i }
  end

  def self.hole7(a)
    r = [a[0]]
    a.each_cons(2){|x,y| r << x << y if y-x>1}
    r << a[-1] if a[-1] != r[-1]
    r.each_slice(2).map{|a,b| a!=b ? "#{a}-#{b}" : "#{a}"}
  end

  def self.hole8(f)
    (1..f-2).inject([1,1]) {|a| a << a[-1] + a[-2]}
  end

  def self.hole9(f)
    v = []
    open(f) { |e| e.map { |l| v << l.chomp.split(", ") } }
    loop {
      r = v.inject(Hash.new(0)) {|a, n| a[n[0]] += 1; a}
      r.each { |k, c| return k if c > v.size/2 }
      m,x=r.values.minmax
      v.map {|e| e.delete(r.find {|a, b| b == m}[0]) }
      return r.find {|a, b| b == x}[0] if r.keys.compact.size < 3
    }
  end
end
