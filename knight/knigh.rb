class Board

  def initialize(size = 7)
    init_board(7)
  end

  def init_board(size,d =5000)
  @board =   (0..size).map do
      Array.new(7,d)
    end

  end



 def neighboor(node)
  tab =  [1,2,-2,-1].product([1,2,-2,-1]).find_all{|t| t[0].abs != t[1].abs}
  tab.map do |t|
  x,y =   [t[0] + node[0],t[1] + node[1]]

  [x,y] if (0...7) === x && (0...7) === y
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
  puts %Q[ you made it in #{min_length} moves :]
  paths.each do |path|
  begin
    puts
    puts %Q[ \t #{path.to_s}]
    puts
  end  if path.length == min_length
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

 b.move_knight([3,3],[6,4])