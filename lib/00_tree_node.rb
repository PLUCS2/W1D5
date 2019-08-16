require "byebug"

class PolyTreeNode

  attr_reader :parent , :children, :value

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end 

  def parent=(node)
    if self.parent != nil
      parent.children.reject!{|ele| ele == self}
    end 
    @parent = node   
    if !self.parent.nil? && !node.children.include?(self)
      node.children << self
    end 
  end 

  def add_child(child_node)
    child_node.parent=(self)
  end 

  def remove_child(child_node)
    if self.children.include?(child_node)    
      child_node.parent=(nil)
    else 
      raise "Error - Node is not a child" 
    end 
  end 

  def dfs(target_value)
    # puts self.value 
    # puts self.children[0].value
    return self if self.value == target_value
    if self.children.length >= 1 
      (0...self.children.length).each do |i|
        sub_tree = self.children
        ans = sub_tree[i].dfs(target_value)
        return ans unless ans.nil?
      end
    end 
    nil
  end 

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      ele = queue.shift 
      if ele.value == target_value
        return ele 
      else 
        queue.push(*ele.children)
      end 
    end  
  end 



end 