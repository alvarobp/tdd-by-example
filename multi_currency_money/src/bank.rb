class Bank
  def reduce(source, to)
    return source. if source.is_a?(Money)
    source.reduce(to)
  end
end
