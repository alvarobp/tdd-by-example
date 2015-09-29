class TestCase
  def initialize(name)
    @name = name
  end

  def run
    public_send(@name)
  end
end

class WasRun < TestCase
  attr_reader :was_run

  def initialize(name)
    @was_run = false
    super(name)
  end

  def test_method
    @was_run = true
  end
end

test = WasRun.new('test_method')
puts test.was_run
test.run
puts test.was_run
