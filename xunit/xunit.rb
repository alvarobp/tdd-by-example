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
  attr_reader :was_run, :was_setup

  def initialize(name)
    super(name)
  end

  def setup
    @was_run = false
    @was_setup = true
  end

  def test_method
    @was_run = true
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
    assert @test.was_setup
  end
end

TestCaseTest.new('test_running').run
TestCaseTest.new('test_setup').run
