require 'pry'

class LinkedList
  attr_accessor :head, :tail

  def initialize(node=nil)
    @head = node
    @tail = node
  end

  def push(node)
    if !head
      self.head = node
      self.tail = node
      node.next = nil
    else
      node.next = head
      self.head = node
    end
    true
  end

  def pop
    elem = head
    if !elem
      raise "You can't pop an empty LinkedList"
    else
      remove_head
    end
    elem
  end

  def remove_head
    if !head.next
      self.tail = nil
      self.head = nil
    else
      self.head = head.next
    end
  end

  def remove(node)
    elem = head
    if !elem
      raise "You can't remove a node from an empty LinkedList"
    else
      if node == head
        remove_head
      else
        removed = false

        while elem && !removed
          previous = elem
          elem = elem.next
          if elem == node
            if elem == tail
              self.tail = previous
            end
            previous.next = elem.next
            removed = true
          end
        end
      end
      elem ? elem : "Node not found!"
    end
  end

end

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end
end
