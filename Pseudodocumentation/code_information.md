# String class

Code file: [lib/string.rb](https://github.com/error34043/ruby-chess/blob/master/lib/string.rb)

### 1. #use_code(color_code)

Takes an integer value as an argument and interpolates the integer and self into a string. When output, the string manipulates the terminal using ANSI escape code syntax.

### 2. #\<color\>

Uses #use_code to return a string of the specified color when printed to the terminal.

### 3. #\<background_color\>

Uses #use_code to return a string with the specified background color when printed to the terminal.

# Board class

Code file: [lib/board.rb](https://github.com/error34043/ruby-chess/blob/master/lib/board.rb)

### 1. #initialize

Calls #starting_board.

### 2. #display

Displays the board on the terminal.

### 3. #row

**Private.** Generates a single row with a white square on the left.

### 4. #complete_board

**Private.** Generates the complete board array using #row and #alt_row.

### 5. #add_starting_pieces(array)

**Private.** Adds the chess pieces in their appropriate positions of the argument array for the starting state of the chess board.

### 6. #fill_board(array)

**Private.** Adds appropriate background colors to each square of the chess board given to the method as the array argument.

### 7. #starting_board

**Private.** Generates and stores an empty board to the @current_board instance variable.

### 8. column_letter_to_column(col_letter)

**Private.** Takes a letter coordinate for the column and returns the appropriate column index in the @current_board array.

### 9. valid_move?(move)

**Private.** Checks if the destination square in a move is valid.

### 10. add_move_to_board(start, destination)

When start position and destination position are given as arguments, this method shifts the piece from the start position to the destination position.

### 11. convert_move_to_array_coords(move)

**Private.** Converts the move inputted by the user in corresponding coordinates of the @current_board array.