require 'rubygems'
require 'rspec'
require_relative '../sort.rb'

describe 'Sort' do
  describe '.selection_sort' do

    context 'when the argument is empty' do
      it "returns an empty array" do
        expect(Sort.selection_sort([])).to eq([])
      end
    end

    context 'when there are negative numbers' do
      it 'sorts properly' do
        expect(Sort.selection_sort([-7,4,5,6,-89])).to eq([-89,-7,4,5,6])
      end
    end

    context 'when there are duplicates' do
      it 'treats them as the same value' do
        expect(Sort.selection_sort([1,6,5,9,5])).to eq([1,5,5,6,9])
      end
    end

    context 'when there is only one value' do
      it 'returns an array with the value' do
        expect(Sort.selection_sort([3])).to eq([3])
      end
    end

    context 'when it is a large unordered array' do
      it 'sorts the array properly' do
        expect(Sort.selection_sort([4,5,9,2,345,12234,65,889,4,1])).to eq [1,2,4,4,5,9,65,345,889,12234]
      end
    end

  end
end
