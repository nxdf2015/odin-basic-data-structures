

class Node
attr_accessor :left,:right ,:value


  def initialize(value , left = nil   ,right  = nil   )
    @value = value
    @left = left
    @right = right
  end

  def insert_node(value)
    #puts "#{value} ---- #{@left}   +++++ #{@right}"
    if @value.nil?
          Node.create(value)

    elsif @value > value
        if @left.nil?
          @left = Node.new(value)
        else
        @left.insert_node(value)
       end

    elsif @value < value
        if @right.nil?
          @right = Node.new(value)
        else
            @right.insert_node(value)
        end
    else @value == value
      raise Exception

    end

  end

  def depth_rec(value)
    if @value.nil?
      nil
    elsif @value > value
       @left.nil? ? nil : @left.depth_rec(value)
    elsif @value < value
       @right.nil? ? nil : @right.depth_rec(value)
    else
      self
    end

 end


 def to_s
   @value.to_s
 end

end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def build_tree(value)
    if @root.nil?
      @root = Node.new(value)
    else
      @root.insert_node(value)
   end
 end


  def  breadth_first_search(value)
    queue = []
    queue << @root
    begin
    node = queue.pop
    find = node.value == value
      begin
        queue.unshift  node.left unless node.left.nil?
        queue.unshift  node.right unless node.right.nil?
      end if !find
    end until find || queue.empty?
    find ? node : nil
  end

  def depth_rec(value)
    @root.depth_rec(value)
  end


def depth_first_search(value)
  stack  = []
  find = false
  node = @root
  find = value == node.value
  unless node.nil? || find
    loop do
         stack << node
         loop do
            break  if node.nil? || node.left.nil?
            node = node.left
            stack << node
            find = node.value == value
            break if find
         end
         unless find  ||  stack.empty?
               node = stack.pop
               unless node.nil? || node.right.nil?
                 node = node.right
                 find  = value == node.value
               end
        end
        break if find  || stack.empty? || node.nil?
      end
   end
    find   ? node : nil
 end



end



t = Tree.new
(1..10).to_a.each do |v| t.build_tree(v) end

puts t.depth_rec(11)



def create_tree values
 t = Tree.new
  values.each do |value| t.build_tree(value) end
t
end

def first
  t = create_tree([1,2,3])
  [t.root.value == 1 , t.root.left.nil? , t.root.right.value == 2 ].all? do |item| item end

end

def second
  t = create_tree([ 2,1,3])
  [t.root.value == 2 , t.root.left.value == 1, t.root.right.value == 3,t.root.left.left.nil?,t.root.left.right.nil? ].all? do |item| item end
end


puts  first()
puts second()
