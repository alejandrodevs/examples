class Node
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def name
    path.split('/').last
  end

  def size
    return File.size(path) if File.file?(path)
    children.map(&:size).reduce(0, :+)
  end

  def children
    Dir["#{path}/*"].map { |path| Node.new(path) }
  end

  def sorted_children
    children.sort_by { |node| [node.size, node.name] }
  end

  def to_s(tabs = 0)
    str = ''
    str << "\t" * tabs
    str << "#{name} | #{size}KB\n"
    str << sorted_children.map { |node| node.to_s(tabs + 1) }.join
  end
end
