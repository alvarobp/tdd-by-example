def assert(test)
  raise 'AssertionFailed' unless test
end

class TestResult
  def initialize
    @run_count = 0
  end

  def test_started
    @run_count += 1
  end

  def summary
    "#{@run_count} run, 0 failed"
  end
end

class TestCase
  def initialize(name)
    @name = name
  end

  def setup
  end

  def run
    result = TestResult.new
    result.test_started
    setup
    public_send(@name)
    tear_down
    result
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

  def test_broken_method
    raise StandardError
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

  def test_failed_result
    test = WasRun.new('test_broken_method')
    result = test.run
    assert '1 run, 1 failed' == result.summary
  end

  def test_failed_result_formatting
    result = TestResult.new
    result.test_started
    result.test_failed
    assert '1 run, 1 failed' == result.summary
  end
end

TestCaseTest.new('test_template_method').run
TestCaseTest.new('test_result').run
TestCaseTest.new('test_failed_result_formatting').run
