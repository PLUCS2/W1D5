require_relative "00_tree_node"
require "byebug"
class KnightPathFinder
 
  
  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]
    @tree = self.build_move_tree(@root_node)
  end

  def self.valid_moves(pos)
    valid_moves = [[2,1], [1,2], [2,-1], [-1,2], [-1, -2], [-2,-1], [1,-2], [-2,1]]
    ans = valid_moves.map {|moves| [moves[0] + pos[0], moves[1] + pos[1]]}
    ans.select {|moves| moves[0].between?(0,7) && moves[-1].between?(0,7)}
  end 
  def tree
    @tree[0].length 
  end 

  def new_move_positions(pos)
    # debugger 
    ans = KnightPathFinder.valid_moves(pos)
    return ans if ans == []
    ans.reject! {|moves| @considered_positions.include?(moves)}
    @considered_positions += ans
    # debugger 
    ans
  end 

  def build_move_tree(p_node)
    parent_val = p_node.value
      pos = self.new_move_positions(parent_val) 
      return pos if pos.empty?
      nodes = pos.map {|move| PolyTreeNode.new(move)}
      parented = nodes.map {|node| node.parent=(p_node)}
      nodes.each {|ele| build_move_tree(ele)}
  end  

  # def build_move_tree(target)
    # debugger
  #   queue = parentify((self.new_move_positions(@root_node.value)), @root_node)
  #   ele = queue.shift
  #   until ele.value == target
  #     pos_pos = self.new_move_positions(ele.value)
  #     queue += parentify(pos_pos, ele)
  #     ele = queue.shift 
  #   end  
  #     ans = []
  #     ans << ele.value 
  #     until ele.value == @root_node.value
  #       ans << ele.parent.value 
  #       ele = ele.parent 
  #     end 
  #     return ans 
  # end

  # def nodify(arr)
  #   arr.map {|move| PolyTreeNode.new(move)}
  # end 
  # def parentify(arr, parent_node)
    # debugger
  #   arr = self.nodify(arr)
  #   arr.map {|nodes| nodes.parent=(parent_node)}
  # end 
    

end 

# if ele == target
#         return [ele] 
#       else 
#         queue.push(*ele.children)
#       end 
#     end 
#   end 
