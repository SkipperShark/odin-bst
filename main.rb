class Node
  attr_accessor :data, :left, :right

  def initialize(data, left, right)
    @data = data
    @left = left
    @right = right
  end

end


class Tree
  attr_accessor :root, :array

  def initialize(array)
    return if array.empty? || array.nil?

    @array = array.sort.uniq

    puts "input array post sort+duplicate removal : #{array}\n\n"
    # midpoint = (array.length / 2)
    # mid_ele = array[midpoint]
    # self.root = Node.new(mid_ele, build_tree(array, root), build_tree(array, root))
    self.root = build_tree(array)
  end

  def build_tree(array)
    p "array : #{array}"
    return nil if array.empty? || array.nil?
    return Node.new(array.first, nil, nil) if array.length == 1

    midpoint = (array.length / 2)
    mid_ele = array[midpoint]
    left = build_tree(array[0...midpoint])
    right = build_tree(array[(midpoint + 1)..(array.length)])
    Node.new(mid_ele, left, right)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

end

arr1 = [10, 20]
arr2 = [10, 20, 30]
arr3 = [1, 2, 3, 4, 5, 6, 7]

bst = Tree.new(arr3)
pp bst.root
bst.pretty_print
