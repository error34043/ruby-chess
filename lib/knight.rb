# frozen_string_literal: true

class Knight < Board
  def possible_moves(position)
    possible_moves_array = []
    possible_moves_array << [position[0] + 1, position[1] + 2]
    possible_moves_array << [position[0] + 1, position[1] - 2]
    possible_moves_array << [position[0] + 2, position[1] + 1]
    possible_moves_array << [position[0] + 2, position[1] - 1]
    possible_moves_array << [position[0] - 2, position[1] + 1]
    possible_moves_array << [position[0] - 2, position[1] - 1]
    possible_moves_array << [position[0] - 1, position[1] + 2]
    possible_moves_array << [position[0] - 1, position[1] - 2]
    @turn_valid_move_list = possible_moves
  end
end