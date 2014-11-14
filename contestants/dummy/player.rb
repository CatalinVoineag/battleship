class DummyPlayer
  def name
    "The Dummy"
  end

  def new_game
    [
      [1, 1, 5, :across],
      [1, 2, 4, :across],
      [1, 3, 3, :across],
      [1, 4, 3, :across],
      [1, 4, 1, :across],
    ]
  end

  def take_turn(state, ships_remaining)
    # Do your thing
  end
end
