# frozen_string_literal: true

require './lib/board.rb'

describe Board do
  subject(:board) { described_class.new }

  describe '#valid_move?' do
    context 'when move refers to an empty square' do
      it 'returns true' do
        expect(board.valid_move?('A3')).to be true
      end
    end

    context 'when column is entered in lowercase but move is valid' do
      it 'returns true' do
        expect(board.valid_move?('a3')).to be true
      end
    end

    context 'when move refers to a non-existent column' do
      it 'returns false' do
        expect(board.valid_move?('j6')).to be false
      end
    end

    context 'when move is more than 2 characters in length' do
      it 'returns false' do
        expect(board.valid_move?('a23')).to be false
      end
    end

    context 'when move refers to non-existent row' do
      it 'returns false' do
        expect(board.valid_move?('a0')).to be false
      end
    end

    context 'when move refers to filled square' do
      it 'returns false' do
        expect(board.valid_move?('A2')).to be false
      end
    end
  end

  describe '#add_move_to_board' do
    context 'when start position and destination position are given as arguments' do
      before do
        board.add_move_to_board('a2', 'a4')
      end

      it 'shifts the piece from start position to destination position' do
        board_array = board.instance_variable_get(:@current_board)
        expect(board_array[4][2]).to eql("\e[30m ♟︎ \e[0m")
      end
    end
  end
end