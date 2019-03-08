class BobCatPlayer
  @@board = {}

  def name
    'Bobcat'
  end

  def new_game
    my_positions.sample
  end

  def my_positions
    [
      [
        [0, 4, 5, :across],
        [8, 1, 3, :down],
        [8, 7, 3, :down],
        [1, 8, 2, :across],
        [5, 6, 4, :down],
      ],
      [
        [5, 4, 5, :down],
        [4, 2, 4, :across],
        [7, 8, 3, :across],
        [1, 4, 3, :down],
        [7, 7, 2, :across],
      ],
    ]
  end

  def take_turn(state, ships_remaining)
    calculate_board(state, ships_remaining)
    sleep(1)
    hit(state)
  end

  def random_hit
    [rand(10), rand(10)]
  end

  def hit(state)
    h = {}
    @@board.each do |key, value|
      h[key] = value[:score]
    end
    max_score = h.values.max
    good_boards = @@board.select{|k, v| v[:score] == max_score}
    random_key = good_boards.to_a.flatten[0..good_boards.count].first
    shot = [@@board[random_key.to_s][:element], @@board[random_key.to_s][:row]]
    shot
  end

  def calculate_board(state, ships_remaining)
    big_ship = ships_remaining.max
    y = 0
    state.map do |row|
      x = 0
      row.each do |element|
       @@board["#{y.to_s}_#{x.to_s}"] = 
         {
           row: y,
           element: x,
           score: calculate_score(x, y, state, big_ship)
          }
        x += 1
      end
      y += 1
    end
  end

  def calculate_score(x, y, state, big_ship)
    if state[y][x] == :miss || state[y][x] == :hit
      0
    else
      check_left(x , y, state, big_ship) +
      check_right(x, y, state, big_ship) +
      check_up(x, y, state, big_ship) +
      check_down(x, y, state, big_ship) +
      check_imidiate_left(x, y, state, big_ship) +
      check_imidiate_right(x, y, state, big_ship) +
      check_imidiate_up(x, y, state, big_ship) +
      check_imidiate_down(x, y, state, big_ship)
    end
  end

  def check_imidiate_left(x, y, state, big_ship)
    if state[y][x-1] == :hit
      5
    elsif state[y][x-1] == :miss && state[y][0..x].size < big_ship
      - big_ship
    else
      0
    end
  end

  def check_imidiate_right(x, y, state, big_ship)
    if state[y][x+1] == :hit
      5
    elsif state[y][x+1] == :miss && state[y][x..9].size < big_ship
      - big_ship
    else
      0
    end
  end

  def check_imidiate_up(x, y, state, big_ship)
    if state[y-1][x] == :hit
      5
    elsif state[y-1][x] == :miss && state[0..y].size < big_ship
      - big_ship
    else
      0
    end
  end

  def check_imidiate_down(x, y, state, big_ship)
    begin
      if state[y+1][x] == :hit
        5
      elsif state[y+1][x] == :miss && state[y..9].size < big_ship
        - big_ship
      else
        0
      end
    rescue
      0
    end
  end

  def check_left(x, y, state, big_ship)
    score = 0
    size = state[y][0..x].size - 1
    if size > big_ship
      score = big_ship - 1
    else
      score = size
    end
    score
  end

  def check_right(x, y, state, big_ship)
    score = 0
    size = state[y][x..9].size - 1
    if size > big_ship
      score = big_ship - 1
    else
      score = size
    end
    score
  end

  def check_up(x, y, state, big_ship)
    score = 0
    size = state[0..y].size - 1
    if size > big_ship
      score = big_ship - 1
    else
      score = size
    end
    score
  end

  def check_down(x, y, state, big_ship)
    score = 0
    size = state[y..9].size - 1
    if size > big_ship
      score = big_ship - 1
    else
      score = size
    end
    score
  end

end
