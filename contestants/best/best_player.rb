require 'byebug'
class BestPlayer

  def name
    'Best Player'
  end

  def new_game
    [
      [0, 4, 5, :across],
      [8, 1, 3, :down],
      [8, 7, 3, :down],
      [1, 8, 2, :across],
      [5, 6, 4, :down],
    ]
  end

  def take_turn(state, ships_remaining)
    hit_row = hit_boat(state)
    
    if hit_row.nil?
      random_hit
    else
      x = state.index(hit_row)
      y = hit_row.index(:hit)
      
      if hit_row.index(y + 1) == :unknown
        [x, y + 1]
      elsif hit_row.index(y - 1) == :unknown
        [x, y - 1]
      else
        [1, 2]
      end
    end
  end

  def random_hit
    [rand(10), rand(10)]
  end

  def hit_boat(state)
    state.detect{ |row| row.include?(:hit) }
  end

end
