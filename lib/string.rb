# frozen_string_literal: true

# Add colors to strings
class String
  def use_code(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def black;          use_code(30) end
  def red;            use_code(31) end
  def green;          use_code(32) end
  def yellow;         use_code(33) end
  def blue;           use_code(34) end
  def magenta;        use_code(35) end
  def teal;           use_code(36) end

  def bg_light_grey;  use_code(47) end # background for white squares
  def bg_dark_grey;   use_code(100) end # background for black squares
  def bg_red;         use_code(41) end
  def bg_green;       use_code(42) end
  def bg_yellow;      use_code(43) end
  def bg_blue;        use_code(44) end
  def bg_magenta;     use_code(45) end
  def bg_teal;        use_code(46) end

  def invert;       use_code(7) end

  def no_colors
    self.gsub /\e\[\d+m/, ""
  end
end
