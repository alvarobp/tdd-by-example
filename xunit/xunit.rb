class WasRun
  attr_reader :was_run

  def initialize(name)
    @was_run = false
  end

  def test_method
    @was_run = true
  end
end

test = WasRun.new('test_method')
puts test.was_run
test.run
puts test.was_run
