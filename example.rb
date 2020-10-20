puts "Welcome to tic tac toe, Please enter your name one by one"

while true
    player_1 = gets.chomp 
    player_2 = gets.chomp

#if player_1 == player_2 if the player name is equal, the program should return
    puts "Please enter a distinctive name"

#elsif !player_1.empty? and !player_2.empty? if the player_1 and player_2 is not empty, 
      puts "welcome #{player_1} and #{player_2}, happy gaming"
     #break we break the loop
#else needs  both name
    puts "Name fied couldn't be empty"
#end
end