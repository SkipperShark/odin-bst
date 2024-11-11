class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
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
    self.root = build_tree(array)
  end

  def build_tree(array)
    # p "array : #{array}"
    return nil if array.empty? || array.nil?
    return Node.new(array.first, nil, nil) if array.length == 1

    midpoint = (array.length / 2)
    node = Node.new(array[midpoint])
    node.left = build_tree(array[0...midpoint])
    node.right = build_tree(array[(midpoint + 1)..(array.length)])
    node
  end

  def insert(value)
    insert_recursive(value, root)
  end

  def delete
    
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def print_pre_order
    pre_order_recursive(root)
    puts ""
  end

  private

  def insert_recursive(value, node)
    pp node
    puts ""
    leaf_node = node.left.nil? && node.right.nil?
    if leaf_node
      new_node = Node.new(value)
      if value <= node.data
        node.left = new_node
      elsif value > node.data
        node.right = new_node
      end
      return
    end
    
    if value <= node.data
      insert_recursive(value, node.left)
    elsif value > node.data
      insert_recursive(value, node.right)
    end
  end

  def pre_order_recursive(node)
    return if node.nil?
  
    print "#{node.data} "
    pre_order_recursive(node.left)
    pre_order_recursive(node.right)
  end
  
end


arr1 = [10, 20]
arr2 = [10, 20, 30]
arr3 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr4 = [10, 20, 30, 100, 500]
arr5 = [10, 20, 100, 500]

bst = Tree.new(arr5)
bst.pretty_print
puts "\n\n"
bst.insert(30)
bst.pretty_print

