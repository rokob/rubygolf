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
    (0...l).each {|n| (1..l).each {|k| r << a.slice(n,k) }}
    r.uniq.sort_by {|x| [x.size, x[0]]}
  end

  def self.hole6(n)
    (1..n).map{|k| (k%3<1) ? (k%5<1) ? "fizzbuzz" : "fizz" : (k%5<1) ? "buzz" : k}
  end

  def self.hole7(a)
    r = [a[0]]
    a.each_cons(2){|x,y| r << x << y if y-x!=1}
    r << a[-1] if a[-1] != r[-1]
    r.each_slice(2).map{|a,b| if b.nil?||a==b then "#{a}" else "#{a}-#{b}" end}
  end

  def self.hole8(f)
    (1..f).inject([1,1]) {|a,n| a << a[-1] + a[-2]}.take(f)
  end

  def self.hole9(f)
    v = []
    open(f) { |e|
      e.each { |l|
        t = []
        l.split(", ").each { |a| t << a.chomp }
        v << t
      }
    }
    loop {
      r = v.inject(Hash.new(0)) {|a, n| a[n[0]] += 1; a}
      r.each { |k, c| return k if c > v.length/2 }
      z = r.find { |a, b| b == r.values.min}[0]
      v.map { |e| e.delete(z) }
      return r.find { |a, b| b == r.values.max}[0] if r.keys.compact.length == 2
    }
  end
end
