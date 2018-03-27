require_relative './player'
require_relative './player_contracts'


class AIOpponent < Player
    include PlayerContracts

    attr_reader :difficulty 

    def initialize(name, win_condition, diff) 
        # invariant 
        pre_init(win_condition)

        @difficulty = diff
        super(name, win_condition)

        post_init
        invariant         
    end

    def choose_column(board, players, player_num)
        invariant 
        pre_make_move

        # shuffle players array so that current player is first 
        players = shuffle_players_list(players, player_num)

        # returns a column 
        column = minimax(board, @difficulty, players)[1]

        post_make_move
        invariant         

        column
    end

    private 

    def minimax(board, depth, players, player_num=nil)
        if depth == 0
            return [0, board.available_columns.sample] 
        end 

        if player_num.nil? or players.size-1 == player_num
            player_num = 0  
        else
            player_num += 1
        end

        thread_list = []
        available_moves = Array.new(board.available_columns.size, -100)
        board.available_columns.each { |i|
            thread_list << Thread.new do 
                boardclone = Marshal.load( Marshal.dump(board) )
                boardclone.add_piece(i, players[player_num].tokens[0])
                available_moves[i] = valueof(boardclone, players.map(&:player_win_condition)) + minimax(boardclone, depth-1, players, player_num)[0]
            end
        }
        thread_list.each{|thread| thread.join}

        # randomize if multiple max's 
        best_columns = available_moves.each_index.select{|i| available_moves[i] == available_moves.max}    
        [available_moves.max, best_columns.sample]
    end

    def shuffle_players_list(players, num)
        if num == 0
            return players
        else 
            return players[num..players.size] + players[0..num-1]
        end
    end

    def valueof(board, players_win_conditions)
        calculated_value = 0 
        combinations = board.get_all_combinations_of_length(players_win_conditions[0].size)

        players_win_conditions.each_with_index { |cond, i| 
            if i == 0
                m = 1
            else 
                m = -1
            end 

            if combinations.include? cond
                # if other player will win, mark it higher 
                if cond == @player_win_condition 
                    calculated_value += 1*m
                else 
                    calculated_value += 2*m
                end                     
            elsif combinations.include? ([nil] + cond[1..cond.size])
                calculated_value += 0.5*m
            elsif combinations.include? (cond[0..cond.size-1] + [nil])
                calculated_value += 0.5*m
            # elsif combinations.include? ([0, 0] + cond[2..cond.size])
                # calculated_value += 0.3*m
            # elsif combinations.include? (cond[0..cond.size-2] + [0, 0])
                # calculated_value += 0.3*m
            else 
                calculated_value += 0
            end 
        }

        calculated_value
    end
end 