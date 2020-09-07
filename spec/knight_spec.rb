# frozen_string_literal: true

require './lib/board.rb'
require './lib/knight.rb'

describe Knight do
  subject(:knight) { described_class.new('b1', 'a3') }

  describe '#possible_moves' do
    context 'when a square is entered' do
      it 'returns an array containing all possible knight moves from there' do
        expect(knight.possible_moves('b1')).to eql([[2, 5], [3, 4], [3, 2]])
      end

      it 'returns an array containing all possible knight moves from there' do
        expect(knight.possible_moves('g1')).to eql([[2, 6], [3, 9], [3, 7]])
      end
    end
  end

  describe '#valid_knight_move' do
    context 'when the move is possible for the knight' do
      it 'returns true' do
        expect(knight.valid_knight_move?('a3')).to be true
      end
    end

    context 'when the move is not possible for the knight' do
      it 'returns false' do
        expect(knight.valid_knight_move?('a7')).to be false
      end
    end
  end
end