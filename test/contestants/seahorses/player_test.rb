require 'minitest/autorun'

module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end # Spec eigenclass
  end
end

require_relative '../../../contestants/seahorses/player'

describe SeahorsePlayer do
end

describe RandStrategy do
  describe '#fire' do
    let(:turn)      { 1 }
    let(:state)     { [[]] }
    let(:remaining) { [] }
    let(:fire)      { RandStrategy.new(turn, state, remaining).fire }

    context 'one potential' do
      let(:state) {
        [
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :unknown, :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit, :hit, :hit, :hit,     :hit, :hit, :hit, :hit]
        ]
      }

      it 'returns the potential' do
        fire.must_equal([5, 5])
      end
    end

    context 'few potentials' do
      let(:state) {
        [
          [:hit, :hit, :hit,     :hit,     :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :unknown, :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :hit,     :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :hit,     :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :hit,     :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :hit,     :hit, :unknown, :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :hit,     :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :hit,     :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :unknown, :hit,     :hit, :hit,     :hit, :hit, :hit, :hit],
          [:hit, :hit, :hit,     :hit,     :hit, :hit,     :hit, :hit, :hit, :hit]
        ]
      }

      it 'returns a random shot from the potentials' do
        [[1, 3], [8, 2], [5, 5]].must_include(fire)
      end
    end
  end
end

describe HeatStrategy do
  describe '#fire' do
    let(:turn)      { 1 }
    let(:state)     { [[]] }
    let(:remaining) { [] }
    let(:fire)      { HeatStrategy.new(turn, state, remaining).fire }

    context 'one potential' do
      let(:state) {
        [
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :unknown, :hit,  :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss, :miss, :miss, :miss,    :miss, :miss, :miss, :miss]
        ]
      }

      it 'returns the potential' do
        fire.must_equal([4, 5])
      end
    end

    context 'few potentials' do
      let(:state) {
        [
          [:miss, :miss, :miss,    :miss,    :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :unknown, :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :unknown, :hit,     :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :unknown, :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :miss,    :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :miss,    :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :miss,    :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :miss,    :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :miss,    :miss, :miss, :miss, :miss, :miss, :miss],
          [:miss, :miss, :miss,    :miss,    :miss, :miss, :miss, :miss, :miss, :miss]
        ]
      }

      it 'returns a random shot from the potentials' do
        [[1, 3], [2, 2], [3, 3]].must_include(fire)
      end
    end
  end
end
