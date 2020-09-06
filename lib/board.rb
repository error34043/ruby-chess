# frozen_string_literal: true

require_relative 'string.rb'

class Board
  attr_reader :WHITE_PIECES, :BLACK_PIECES
  attr_accessor :current_board

  WHITE_PIECES = ['♔', '♕', '♖', '♗', '♘', '♙']
  BLACK_PIECES = ['♚', '♛', '♜', '♝', '♞', '♟︎']

  def initialize
    starting_board
  end

  def display
    puts @current_board.join('')
  end

  private

  def row
    single_row = Array.new(8) { '   ' }
  end

  def complete_board
    [
      [' ☘ '.green, ' 1 ', ' 2 ', ' 3 ', ' 4 ', ' 5 ', ' 6 ', ' 7 ', ' 8 ', "\n"],
      [' 1 ', *row, "\n"],
      [' 2 ', *row, "\n"],
      [' 3 ', *row, "\n"],
      [' 4 ', *row, "\n"],
      [' 5 ', *row, "\n"],
      [' 6 ', *row, "\n"],
      [' 7 ', *row, "\n"],
      [' 8 ', *row, "\n"]
    ]
  end

  def add_starting_pieces(array)
    # add pawns
    1.upto(8) do |i|
      array[2][i] = " #{BLACK_PIECES[5]} ".black
      array[7][i] = " #{WHITE_PIECES[5]} "
    end

    # add rooks
    array[1][1] = " #{BLACK_PIECES[2]} ".black
    array[1][8] = " #{BLACK_PIECES[2]} ".black
    array[8][1] = " #{WHITE_PIECES[2]} "
    array[8][8] = " #{WHITE_PIECES[2]} "

    # add knights
    array[1][2] = " #{BLACK_PIECES[4]} ".black
    array[1][7] = " #{BLACK_PIECES[4]} ".black
    array[8][2] = " #{WHITE_PIECES[4]} "
    array[8][7] = " #{WHITE_PIECES[4]} "

    # add bishops
    array[1][3] = " #{BLACK_PIECES[3]} ".black
    array[1][6] = " #{BLACK_PIECES[3]} ".black
    array[8][3] = " #{WHITE_PIECES[3]} "
    array[8][6] = " #{WHITE_PIECES[3]} "

    # add queens
    array[1][4] = " #{BLACK_PIECES[1]} ".black
    array[8][4] = " #{WHITE_PIECES[1]} "

    # add kings
    array[1][5] = " #{BLACK_PIECES[0]} ".black
    array[8][5] = " #{WHITE_PIECES[0]} "
  end

  def fill_board(array)
    array.each_with_index do |row, row_index|
      next if row_index == 0
      row.each_with_index do |square, column_index|
        next if column_index == 0 || column_index > 8
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
    fill_board(@current_board)
  end
end
