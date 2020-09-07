# frozen_string_literal: true

module SharedMethods
  def convert_move_to_array_coords(move)
    move_array = []
    move_array << move[1].to_i
    move_array << column_letter_to_column(move[0].upcase)
    move_array
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