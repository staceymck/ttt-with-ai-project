module Players 
    class Computer < Player
        attr_reader :board

        def move(board)
            @board = board
            
            if win_or_block
                move_choice = win_or_block.detect {|i| board.cells[i] == " "}
            elsif !board.taken?("5")
                move_choice = 4
            elsif (board.cells[0] == board.cells[8] && board.cells[8] != " ") || (board.cells[2] == board.cells[6] && board.cells[6] != " ") 
                move_choice = random_open_edge
            else
                move_choice = random_open_corner || move_choice = select_open_move
            end

            puts (move_choice + 1).to_s  
            (move_choice + 1).to_s    
        end 

        def opponent_token
            self.token == "X" ? opponent_token = "O" : opponent_token = "X"
        end

        def win_or_block
            Game::WIN_COMBINATIONS.detect do |combo|
                my_tokens = combo.count {|i| board.cells[i] == self.token} 
                opponent_tokens = combo.count {|i| board.cells[i] == opponent_token} 
                open_spaces = combo.count {|i| board.cells[i] == " "}

                my_tokens == 2 && open_spaces == 1 || opponent_tokens == 2 && open_spaces == 1
            end
        end

        def select_open_move
            moves = []
            board.cells.each.with_index do |cell, i|
                moves << i if cell == " "
            end
            moves.sample
        end

        def random_open_edge
            edges = [1, 3, 5, 7]
            edges.select{|i| board.cells[i] == " "}.sample
        end

        def random_open_corner
            corners = [0, 2, 6, 8]
            corners.select{|i| board.cells[i] == " "}.sample
        end

        # ---- Works but allows for wins ---- #
        # def move(board)

        #     if !board.taken?("5") #if center is open, play center first
        #         puts "5"
        #         "5"
        #     else
        #         position = nil
        #         corner_indexes = [0, 2, 6, 8]

        #         win_or_block_combo = Game::WIN_COMBINATIONS.detect do |combo|
        #             my_tokens = combo.count {|i| board.cells[i] == self.token} 
        #             opponent_tokens = combo.count {|i| board.cells[i] == opponent_token} 
        #             empty_spaces = combo.count {|i| board.cells[i] == " "}

        #             my_tokens == 2 && empty_spaces == 1 || opponent_tokens == 2 && empty_spaces == 1
        #         end

        #         if win_or_block_combo
        #             position = win_or_block_combo.detect {|i| board.cells[i] == " "}
        #         else
        #             position = corner_indexes.detect {|i| board.cells[i] == " "}
        #         end

        #         if position == nil
        #             position = board.cells.index(" ")
        #         end
                
        #         puts (position + 1).to_s  
        #         (position + 1).to_s
        #     end
        # end #move method end

        # def opponent_token
        #     self.token == "X" ? opponent_token = "O" : opponent_token = "X"
        # end

    end 
end 