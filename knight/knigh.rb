class Board

  def initialize(size = 7)
    init_board(size)
  end

  def init_board(size,d =5000)
  @size = size
  @board =   (0..size).map do
      Array.new(size,d)
    end

  end

 def neighboor(node)
  tab =  [1,2,-2,-1].product([1,2,-2,-1]).find_all{|t| t[0].abs != t[1].abs}
  tab.map do |t|
  x,y =   [t[0] + node[0],t[1] + node[1]]

  [x,y] if (0...@size) === x && (0...@size) === y
end.compact
end


 def move_knight(start,goal)
   x,y = start
   @board[x][y] = 0
  paths =  move_knight_rec(start,goal)
   lengths = paths.map do |path|
    path.length
  end

  min_length = lengths.min

  paths =  paths.find_all do |path|
      path.length == min_length
      end
  result(start,goal,paths,min_length)
 end

 def result(start,goal,paths,min_length)
      puts %Q[start #{start} -> goal #{goal}]
      puts %Q[ you made it in #{min_length} moves \n #{paths.length} possible path :\n\t]
      paths.each do |path|
      print   path
      puts
    end
end


 def move_knight_rec(start,goal,path=[start])
     paths = []
     x_start,y_start = start
     for node in neighboor(start) do
       x_node,y_node = node
       if  @board[x_start][y_start] + 1  <   @board[x_node][y_node]

         new_path = path[0..-1]
         new_path << node

         if node[0] == goal[0] && node[1] == goal[1]
            paths << new_path
         else
           @board[x_node][y_node] =  @board[x_start][y_start] + 1
           paths += move_knight_rec(node,goal,new_path)
         end
       end
     end
return paths
end


end


b = Board.new

 b.move_knight([3,3],[4,3])
