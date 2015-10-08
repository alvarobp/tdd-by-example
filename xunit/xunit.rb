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
  attr_reader :was_run, :log

  def initialize(name)
    super(name)
  end

  def setup
    @was_run = false
    @log = 'setup '
  end

  def test_method
    @was_run = true
    @log = @log + 'test_method '
  end
end

class TestCaseTest < TestCase
  def setup
    @test = WasRun.new('test_method')
  end

  def test_running
    @test.run
    assert @test.was_run
  end

  def test_setup
    @test.run
    assert 'setup ' == @test.log
  end
end

TestCaseTest.new('test_running').run
TestCaseTest.new('test_setup').run
