class Node
  attr_accessor :children, :name, :column, :depth, :root
  
  def initialize(name)
    @column = 0
    @depth = 0
    @name = name
    @children = []
    @root = true
  end
  
  def add_child(node)
    @children << node
    node.root = false
  end
  
  def print_nodes
    output = "g.addNode(\"#{@name}\", null, #{@column}, #{@depth});"
    @children.each_with_index do |child, index|
      child.depth = self.depth + 1
      child.column = self.column + index
      output += child.print_nodes
      output += "g.addEdge(\"#{@name}\",\"#{child.name}\");"
    end
    output
  end
  
  def width
    @children.collect(&:width).max || @column
  end
end
