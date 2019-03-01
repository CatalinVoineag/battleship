class StupidPlayer
  attr_accessor :count
  @@count = -1

  def name
    "Stupid Player"
  end

  def new_game
    [
      [0, 0, 5, :across],
      [0, 1, 4, :across],
      [0, 2, 3, :across],
      [0, 3, 3, :across],
      [0, 4, 2, :across]
    ]
  end

  def take_turn(state, ships_remaining)
      [0,4]
  end

  def hit_loop
    [
      [0,4],
      [1,4],
      [2,4],
      [3,4],
      [4,4],
      [1, 8],
      [2, 8],
      [5, 6],
      [5, 7],
      [5, 8],
      [5, 9],
      [8, 1],
      [8, 2],
      [8, 3],
      [8, 7],
      [8, 8],
      [8, 9],
    ]
  end

end
