class WasRun
  attr_reader :was_run

  def initialize(name)
    @was_run = false
  end
end

test = WasRun.new('test_method')
puts test.was_run
test.test_method
puts test.was_run
