# frozen_string_literal: true

require_relative 'string.rb'

class Board
  attr_reader :WHITE_PIECES, :BLACK_PIECES
  attr_accessor :current_board

  WHITE_PIECES = ['♔', '♕', '♖', '♗', '♘', '♙']
  BLACK_PIECES = ['♚', '♛', '♜', '♝', '♞', '♟︎']

  def initialize
    @current_board = complete_board
  end

  def display
    puts @current_board.join('')
  end

  private

  def row
    single_row = []
    4.times do
      single_row << '   '.bg_light_grey
      single_row << '   '.bg_dark_grey
    end
    single_row
  end

  def alt_row
    single_alt_row = []
    4.times do
      single_alt_row << '   '.bg_dark_grey
      single_alt_row << '   '.bg_light_grey
    end
    single_alt_row
  end

  def complete_board
    [
      [' ☘ '.green, ' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ', ' 7 ', ' 8 ', "\n"],
      [' 1 ', *row, "\n"],
      [' 2 ', *alt_row, "\n"],
      [' 3 ', *row, "\n"],
      [' 4 ', *alt_row, "\n"],
      [' 5 ', *row, "\n"],
      [' 6 ', *alt_row, "\n"],
      [' 7 ', *row, "\n"],
      [' 8 ', *alt_row, "\n"]
    ]
  end
end
