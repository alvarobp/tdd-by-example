def assert(test)
  raise 'AssertionFailed' unless test
end

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

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new('test_method')
    assert !test.was_run
    test.run
    assert test.was_run
  end
end

TestCaseTest.new('test_running').run
