# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'string.rb'
require_relative 'shared_methods.rb'

class Knight
  attr_accessor :turn_valid_move_list, :valid

  include SharedMethods

  def initialize(origin, destination, array, pieces)
    @turn_valid_move_list = possible_moves(origin)
    @valid = valid_knight_move?(origin, destination, array, pieces)
    if @valid
      move_the_knight(origin, destination, array)
    end
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
    possible_moves_array
  end

  def valid_knight_move?(origin, destination, array, pieces)
    origin_array = convert_move_to_array_coords(origin)
    destination_array = convert_move_to_array_coords(destination)
    pieces_ords = []
    pieces.each { |ele| pieces_ords << ele.ord }
    destination_square = array[destination_array[0]][destination_array[1]]
    token_index = destination_square.length / 2
    if @turn_valid_move_list.include? destination_array
      if pieces_ords.include? destination_square[token_index].ord
        true
      else
        false
      end
    else
      false
    end
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

  def move_the_knight(origin, destination, array)
    origin_array = convert_move_to_array_coords(origin)
    @current_piece = array[origin_array[0]][origin_array[1]]
    array[origin_array[0]][origin_array[1]] = '   '
    destination_array = convert_move_to_array_coords(destination)
    array[destination_array[0]][destination_array[1]] = @current_piece if array[destination_array[0], destination_array[1]] != '   '
  end
end

### Here's how a very very rough version of a couple turns would look for a knight
=begin
test = Board.new
test.display
puts ''
test.add_move_to_board('a2', 'a6')
test.display
puts ''
knight = Knight.new('b8', 'a6', test.current_board, Board::BLACK_PIECES)
test.display
p knight.valid
puts ''
test = Board.new
test.add_move_to_board('a7', 'a6')
test.display
puts ''
knight = Knight.new('b8', 'a6', test.current_board, Board::BLACK_PIECES)
test.display
p knight.valid
=end
