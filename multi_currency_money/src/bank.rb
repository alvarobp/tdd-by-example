class Bank
  class Pair
    def initialize(from, to)
      @from = from
      @to = to
    end

    def ==(other)
      @from == other.from && @to == other.to
    end
    alias :eql? :==

    def hash
      [@from, @to].hash
    end

    protected
    attr_reader :from, :to
  end

  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates[Pair.new(from, to)] = rate
  end

  def rate(from, to)
    @rates[Pair.new(from, to)]
  end
end
