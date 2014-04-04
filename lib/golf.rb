class Golf
  def self.hole1(a)
    a.inject(1,:*)
  end

  def self.hole2(s)
    s.split.sort{|x,y| x[1]<=>y[1]}.join(" ")
  end

  def self.hole3(n)
    (1..n).inject(1,:*)
  end

  def self.hole4(a)
    a.map do |x|
      case x
        when /(man\(.*\))/
          "hat(#{$1})"
        when /dog\((.*)\)/
          "dog(#{$1}(bone))"
        when /cat(\(.*\))/
          "dead#{$1}"
      end
    end
  end

  def self.hole5(a)
    r,l = [], a.length
    (0...l).each {|n| (1..l).each {|k| r << a.slice(n,k) }}
    r.uniq.sort_by {|x| [x.length, x[0]]}
  end

  def self.hole6(n)
    (1..n).map{|k| (k%3==0) ? (k%5==0) ? "fizzbuzz" : "fizz" : (k%5==0) ? "buzz" : k}
  end

  def self.hole7(a)
    res = [a[0]]
    a.each_cons(2){|x,y| res << x << y if y-x!=1}
    res << a[-1] if a[-1] != res[-1]
    res.each_slice(2).map{|a,b| if b.nil?||a==b then "#{a}" else "#{a}-#{b}" end}
  end

  def self.hole8(f)
    (1..f).inject([1,1]) {|a,n| a << a[-1] + a[-2]}.take(f)
  end
end
