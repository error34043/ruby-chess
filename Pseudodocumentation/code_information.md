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

### 1. #initialize - TO BE REWORKED

Generates and stores an empty board to the @current_board instance variable.

### 2. #display

Displays the board on the terminal.

### 3. #row

**Private.** Generates a single row with a white square on the left.

### 4. alt_row

**Prinvate.** Generates a single row with a black square on the left.

### 5. complete_board

**Private.** Generates the complete board array using #row and #alt_row.