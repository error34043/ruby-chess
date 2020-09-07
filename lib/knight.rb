# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'string.rb'
require_relative 'shared_methods.rb'

class Knight
  attr_accessor :turn_valid_move_list

  include SharedMethods

  def initialize
    @turn_valid_move_list = []
  end

  def possible_moves(current_position)
    position_array = convert_move_to_array_coords(current_position)
    possible_moves_array = []
    possible_moves_array << [position_array[0] + 1, position_array[1] + 2]
    possible_moves_array << [position_array[0] + 1, position_array[1] - 2]
    possible_moves_array << [position_array[0] + 2, position_array[1] + 1]
    possible_moves_array << [position_array[0] + 2, position_array[1] - 1]
    possible_moves_array << [position_array[0] - 2, position_array[1] + 1]
    possible_moves_array << [position_array[0] - 2, position_array[1] - 1]
    possible_moves_array << [position_array[0] - 1, position_array[1] + 2]
    possible_moves_array << [position_array[0] - 1, position_array[1] - 2]
    possible_moves_array.select! { |move| possible_destination?(move) }
    @turn_valid_move_list = possible_moves_array
  end

  private

  def possible_destination?(destination)
    if (1..8).include? destination[0]
      if (2..9).include? destination[1]
        true
      else
        false
      end
    else
      false
    end
  end
end
