require 'minitest/autorun'
require './node.rb'

class FolderNodeTest < MiniTest::Unit::TestCase
  def path
    './test/folder'
  end

  def setup
    @node = Node.new(path)
  end

  def test_initialize_with_path
    assert_equal path, @node.path
  end

  def test_name
    assert_equal 'folder', @node.name
  end

  def test_folder_children
    assert_equal 3, @node.children.size
    assert_equal [Node, Node, Node], @node.children.map(&:class)
    assert_equal 'file_2.txt', @node.children.first.name
    assert_equal 'folder', @node.children[1].name
    assert_equal 'file.txt', @node.children.last.name
  end

  def test_folder_size
    assert_equal 30, @node.size
  end

  def test_folder_sorted_children
    assert_equal 'file_2.txt', @node.sorted_children.first.name
    assert_equal 'file.txt', @node.sorted_children[1].name
    assert_equal 'folder', @node.sorted_children.last.name
  end

  def test_folder_to_s
    assert_equal "folder | 30KB\n"\
                 "\tfile_2.txt | 5KB\n"\
                 "\tfile.txt | 10KB\n"\
                 "\tfolder | 15KB\n"\
                 "\t\tfile_2.txt | 5KB\n"\
                 "\t\tfile.txt | 10KB\n", @node.to_s
  end
end
