# frozen_string_literal: true

require_relative 'string.rb'

class Board
  attr_reader :WHITE_PIECES, :BLACK_PIECES

  WHITE_PIECES = ['♔', '♕', '♖', '♗', '♘', '♙']
  BLACK_PIECES = ['♚'.black, '♛'.black, '♜'.black, '♝'.black, '♞'.black, '♟︎'.black]
end
