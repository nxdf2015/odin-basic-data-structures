

# find path between two position 
# algorithm use breadth first search 

def knight_moves(position_start,position_end)
     

    move = [-2,-1,1,2,].product([-2,-1,1,2]).select do |x,y| x.abs != y.abs end
    
        board = (0..7).map do 
            [Array.new(8,nil)]
        end
    
        queue= []
        queue.push(position_start)
        notFind = true
        
    
        while !queue.empty? &&  notFind            
            position = queue.shift
            move.
            collect do |x,y| 
                [position[0] + x , position[1] + y]
            end.
            find_all do |x,y| 
                (0..7) === x && (0..7) === y 
            end.
             each do |x,y|
                if board[x][y].nil?                     
                    board[x][y] = position                      
                    notFind = !(x == position_end[0] && y == position_end[1])
                    queue.push([x,y])
                end            
            end           
        end
    
        path = []
        position = position_end
        path  << position_end
        while position != position_start             
            position = board[position[0]][position[1]]
            path.unshift(position)
        end
        
        path
    end
    
            
         
    p knight_moves([0,0],[4,4])
    

   
