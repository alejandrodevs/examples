require 'minitest/autorun'
require './node.rb'

class FileNodeTest < MiniTest::Unit::TestCase
  def path
    './test/folder/file.txt'
  end

  def setup
    @node = Node.new(path)
  end

  def test_initialize_with_path
    assert_equal path, @node.path
  end

  def test_name
    assert_equal 'file.txt', @node.name
  end

  def test_file_children
    assert_equal [], @node.children
  end

  def test_file_size
    assert_equal 10, @node.size
  end

  def test_file_sorted_children
    assert_equal [], @node.sorted_children
  end

  def test_file_to_s
    assert_equal "file.txt | 10KB\n", @node.to_s
  end
end
