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
    tear_down
  end

  def tear_down
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

  def tear_down
    @log = @log + 'tear_down '
  end
end

class TestCaseTest < TestCase
  def test_template_method
    test = WasRun.new('test_method')
    test.run
    assert 'setup test_method tear_down ' == test.log
  end

  def test_result
    test = WasRun.new('test_method')
    result = test.run
    assert '1 run, 0 failed' == result.summary
  end
end

TestCaseTest.new('test_template_method').run
TestCaseTest.new('test_result').run
