class Node
  attr_accessor :data
  attr_accessor :left
  attr_accessor :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

end

class BinarySearchTree
  attr_accessor :root

  def initialize(root=nil)
    @root = root
  end

  def insert(node)
    if root
      insert_into_subtree_rooted_at(node, root)
    else
      root = node
    end
  end

  def insert_into_subtree_rooted_at_recursive(node, subtree_root)
    if node.data < subtree_root.data
      if !subtree_root.left
        # if there is nothing to the left, set left to node
        subtree_root.left = node
      else
        # if there is a subtree to the left, insert node into that subtree
        insert_into_subtree_rooted_at_recursive(node, subtree_root.left)
      end
    else
      if !subtree_root.right
        # if there is nothing to the right, set right to node
        subtree_root.right = node
      else
        # if there is a subtree to the right, insert node into that subtree
        insert_into_subtree_rooted_at_recursive(node, subtree_root.right)
      end
    end
  end

  def insert_into_subtree_rooted_at_iterative(node, subtree_root)
    current = subtree_root
    next_node = nil

    while current
      if node.data < current.data
        next_node = current.left
        if !next_node
          current.left = node
        end
      else
        next_node = current.right
        if !next_node
          current.right = node
        end
      end
      current = next_node
    end
  end

end
