puts "Welcome to tic tac toe, Please enter your name one by one"
while true
        player_1 = gets.chomp
        player_2 = gets.chomp
    if player_1 == player_2
        puts "Please enter a distinctive name"
    elsif !player_1.empty? and !player_2.empty?
          puts "welcome #{player_1} and #{player_2}, happy gaming"
         break
    else
        puts "Name fied couldn't be empty"
    end
end

board = [1,2,3,4,5,6,7,8,9]

board_1 = []

board_tokens = []

board_2 = []

def game_board(board_tokens)
    puts " #{board_tokens[0]} | #{board_tokens[1]} | #{board_tokens[2]} "
    puts "-----------"
    puts " #{board_tokens[3]} | #{board_tokens[4]} | #{board_tokens[5]} "
    puts "-----------"
    puts " #{board_tokens[6]} | #{board_tokens[7]} | #{board_tokens[8]} "
end

breakpoint = board.length



until breakpoint == 0 do
    puts "#{player_1} turn, please choose between #{board}"
   
    game_board(board_tokens)
       
    while true  
        choice_1 = gets.chomp.to_i
        if  board.include?(choice_1)
            board_1 << choice_1
            board_1.each {|token| board_tokens[token-1] = "X"} 
            board.delete(choice_1)
            breakpoint -= 1
            break
        else
            puts "please choose between #{board}"
        end   
    end

    if breakpoint == 0
        puts "the game ended in a draw"
        break
    end
    game_board(board_tokens)

    if board_1 == [1,2,3] or board_1 == [4,5,6] or board_1 == [7,8,9] or board_1 == [3,5,7] or board_1 ==[1,5,9] or board_1 == [3,2,1] or board_1 == [6,5,4] or board_1 == [9,8,7]
        board_1.each {|token| board_tokens[token-1] = "X"} 
        puts "#{player_1} win"
        break
    end
    puts "#{player_2} turn please choose between #{board}"
    
    while true
        choice_2 = gets.chomp.to_i
        if  board.include?(choice_2)
            board_2 << choice_2
            board_2.each {|token| board_tokens[token-1] = "O"}
            board.delete(choice_2)
            breakpoint -= 1
            break
        else
            puts "please choose between #{board}"
        end
    end

    game_board(board_tokens)
    
    if board_2 == [1,2,3] or board_2 == [4,5,6] or board_2 == [7,8,9] or board_2 == [3,5,7] or board_2 ==[1,5,9] or board_2 == [3,2,1] or board_2 == [6,5,4] or board_2 == [9,8,7]
        puts "#{player_2} win"
        break
    end
end



  
