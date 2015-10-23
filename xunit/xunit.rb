def assert(test)
  raise 'AssertionFailed' unless test
end

class TestResult
  def initialize
    @run_count = 0
    @error_count = 0
  end

  def test_started
    @run_count += 1
  end

  def test_failed
    @error_count += 1
  end

  def summary
    "#{@run_count} run, #{@error_count} failed"
  end
end

class TestCase
  def initialize(name)
    @name = name
  end

  def setup
  end

  def run(result)
    result.test_started
    setup
    begin
      public_send(@name)
    rescue
      result.test_failed
    end
    tear_down
  end

  def tear_down
  end
end

class TestSuite
  def initialize
    @tests = []
  end

  def add(test)
    @tests << test
  end

  def run(result)
    @tests.each { |test| test.run(result) }
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
  def setup
    @result = TestResult.new
  end

  def test_template_method
    test = WasRun.new('test_method')
    test.run(@result)
    assert 'setup test_method tear_down ' == test.log
  end

  def test_result
    test = WasRun.new('test_method')
    test.run(@result)
    assert '1 run, 0 failed' == @result.summary
  end

  def test_failed_result
    test = WasRun.new('test_broken_method')
    test.run(@result)
    assert '1 run, 1 failed' == @result.summary
  end

  def test_failed_result_formatting
    @result.test_started
    @result.test_failed
    assert '1 run, 1 failed' == @result.summary
  end

  def test_suite
    suite = TestSuite.new
    suite.add(WasRun.new('test_method'))
    suite.add(WasRun.new('test_broken_method'))
    suite.run(@result)
    assert '2 run, 1 failed' == @result.summary
  end
end

suite = TestSuite.new
suite.add(TestCaseTest.new('test_template_method'))
suite.add(TestCaseTest.new('test_result'))
suite.add(TestCaseTest.new('test_failed_result_formatting'))
suite.add(TestCaseTest.new('test_failed_result'))
suite.add(TestCaseTest.new('test_suite'))
result = TestResult.new
suite.run(result)
puts result.summary
