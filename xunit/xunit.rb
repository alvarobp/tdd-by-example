def assert(test)
  raise 'AssertionFailed' unless test
end

class TestCase
  def initialize(name)
    @name = name
  end

  def setup
  end

  def run
    setup
    public_send(@name)
  end
end

class WasRun < TestCase
  attr_reader :log

  def initialize(name)
    super(name)
  end

  def setup
    @log = 'setup '
  end

  def test_method
    @log = @log + 'test_method '
  end
end

class TestCaseTest < TestCase
  def setup
    @test = WasRun.new('test_method')
  end

  def test_template_method
    @test.run
    assert 'setup test_method ' == @test.log
  end
end

TestCaseTest.new('test_template_method').run
