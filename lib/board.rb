# frozen_string_literal: true

require_relative 'string.rb'

class Board
  attr_reader :WHITE_PIECES, :BLACK_PIECES
  attr_accessor :current_board

  WHITE_PIECES = ['♔', '♕', '♖', '♗', '♘', '♙']
  BLACK_PIECES = ['♚', '♛', '♜', '♝', '♞', '♟︎']
  @turn_valid_move_list = []

  def initialize
    starting_board
  end

  def display
  current_board_copy = @current_board
  fill_board(current_board_copy)
  puts current_board_copy.join('')
  end

  def valid_move?(move)
    return false unless move.length == 2
    col_letter = move[0].upcase
    row = move[1].to_i
    return false unless ('A'..'H').include? col_letter
    return false unless (1..8).include? row
    column = column_letter_to_column(col_letter)
    if @current_board[row][column] == '   '
      true
    # Add a condition that returns true if its part of the valid move list to account for when a piece is can take an opponent piece off the board
    else
      false
    end
  end

  private

  def row
    single_row = Array.new(8) { '   ' }
  end

  def complete_board
    board_array = [
      ["\t\t\t", ' ☘ '.green, ' A ', ' B ', ' C ', ' D ', ' E ', ' F ', ' G ', ' H ', "\n"]
    ]
    1.upto(8) do |index|
      board_array.push(["\t\t\t", " #{index} ", *row, "\n"])
    end
    board_array
  end

  def add_starting_pieces(array)
    # add pawns
    2.upto(9) do |i|
      array[2][i] = " #{BLACK_PIECES[5]} ".black
      array[7][i] = " #{WHITE_PIECES[5]} "
    end

    # add rooks
    array[1][2] = " #{BLACK_PIECES[2]} ".black
    array[1][9] = " #{BLACK_PIECES[2]} ".black
    array[8][2] = " #{WHITE_PIECES[2]} "
    array[8][9] = " #{WHITE_PIECES[2]} "

    # add knights
    array[1][3] = " #{BLACK_PIECES[4]} ".black
    array[1][8] = " #{BLACK_PIECES[4]} ".black
    array[8][3] = " #{WHITE_PIECES[4]} "
    array[8][8] = " #{WHITE_PIECES[4]} "

    # add bishops
    array[1][4] = " #{BLACK_PIECES[3]} ".black
    array[1][7] = " #{BLACK_PIECES[3]} ".black
    array[8][4] = " #{WHITE_PIECES[3]} "
    array[8][7] = " #{WHITE_PIECES[3]} "

    # add queens
    array[1][5] = " #{BLACK_PIECES[1]} ".black
    array[8][5] = " #{WHITE_PIECES[1]} "

    # add kings
    array[1][6] = " #{BLACK_PIECES[0]} ".black
    array[8][6] = " #{WHITE_PIECES[0]} "
  end

  def fill_board(array)
    array.each_with_index do |row, row_index|
      next if row_index == 0
      row.each_with_index do |square, column_index|
        next if column_index == 0 || column_index == 1 || column_index > 9
        array[row_index][column_index] = if row_index.odd?
                                            if column_index.odd?
                                              square.bg_light_grey
                                            else
                                              square.bg_dark_grey
                                            end
                                          else
                                            if column_index.odd?
                                              square.bg_dark_grey
                                            else
                                              square.bg_light_grey
                                            end
                                          end
      end
    end
  end

  def starting_board
    @current_board = complete_board
    add_starting_pieces(@current_board)
  end

  def column_letter_to_column(col_letter)
    case col_letter
    when 'A'
      column = 2
    when 'B'
      column = 3
    when 'C'
      column = 4
    when 'D'
      column = 5
    when 'E'
      column = 6
    when 'F'
      column = 7
    when 'G'
      column = 8
    when 'H'
      column = 9
    end
    column
  end
end
