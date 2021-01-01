class Game_Controller
    
        def start
            puts "Welcome to Tic-tac-toe!"
            menu
            setup_game
        end
            
        def menu
            puts "Please enter the number of the type of game you'd like to start:
            1. Computer Player vs Computer Player
            2. Human Player vs Computer Player
            3. Human Player vs Human Player
            -- or type 'exit' to exit."
        end
    
        def setup_game
            game_choice = gets.strip 
            
            case game_choice
            when "1" #computer vs computer
                Game.new(Players::Computer.new('X'), Players::Computer.new('O'), Board.new).play
            when "2" #human vs computer
                human_v_comp.play
            when "3" #human vs human - default game
                Game.new.play
            when "exit"
                exit_game
            else 
                puts "Entry not recognized. Please enter 1, 2, 3 or exit"
                setup_game
            end

            play_again
        end
    
        def human_v_comp
            puts "Choose the first player - Player 'X' - by entering either 'human' or 'computer'."
            input = gets.strip.downcase 

            case input
            when "human"
                Game.new(Players::Human.new('X'), Players::Computer.new('O'), Board.new)
            when "computer"
                Game.new(Players::Computer.new('X'), Players::Human.new('O'), Board.new)
            when "exit"
                exit_game
            else
                "Input not recognized."
                human_v_comp
            end
        end

        def play_again 
            puts "\nWould you like to play again? y/n"
            input = gets.strip.downcase

            case input 
            when "y"
                start
            when "n"
                exit_game
            else
                "Input not recognized"
                play_again
            end
        end
    
        def exit_game
            puts "Thanks for playing!"
            exit
        end
        
end