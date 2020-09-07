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
end