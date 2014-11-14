class SeahorsePlayer
  def name
    "Seahorses"
  end

  # x, y, :length, :orientation (:across, :down)
  def new_game
    [
      [4, 9, 5, :across],
      [2, 6, 4, :down],
      [1, 1, 3, :across],
      [2, 2, 3, :down],
      [6, 3, 2, :across],
    ]
  end

  def take_turn(state, ships_remaining)
    new_shot = shot
    loop do
      if state[new_shot[1]][new_shot[0]] == :unknown
        fail StopIteration
      end
      new_shot = shot
    end
    new_shot
  end

  def shot
    [take_x, take_y]
  end

  def take_x
    rand(0..9)
  end

  def take_y
    rand(0..9)
  end
end
