# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  board       :text
#  turn        :text
#  turn_number :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Game < ActiveRecord::Base
  def self.get_player(cell)
    return 'b' if cell.downcase == cell
    'w'
  end

  def change_turn
    self.turn = turn == 'b' ? 'w' : 'b'
  end

  def turn_is_black?
    turn == 'b'
  end

  def put(position, direction)
    self.board[position] = turn_is_black? ? direction.downcase : direction.upcase
  end

  def inc_turn
    self.turn_number += 1
  end

  def change_color(position, original)
    if original.downcase == original
      self.board[position] = board[position].downcase
    else
      self.board[position] = board[position].upcase
    end
  end

  def splat_from(position)
    cell = board[position]
    if cell.downcase == 'r'
      x = position % 9
      change_color(position + 1, cell) if x + 1 <= 8
      change_color(position + 2, cell) if x + 2 <= 8
    elsif cell.downcase == 'l'
      x = position % 9
      change_color(position - 1, cell) if x - 1 >= 0
      change_color(position - 2, cell) if x - 2 >= 0
    elsif cell.downcase == 'u'
      y = position / 9
      change_color(position - 9 * 1, cell) if y - 1 >= 0
      change_color(position - 9 * 2, cell) if y - 2 >= 0
    elsif cell.downcase == 'd'
      y = position / 9
      change_color(position + 9 * 1, cell) if y + 1 <= 8
      change_color(position + 9 * 2, cell) if y + 2 <= 8
    end
  end

  def black_cell_count
    b = 0
    board.split('').each do |c|
      next if c == ' '
      if c.downcase == c
        b += 1
      end
    end
    b
  end

  def white_cell_count
    w = 0
    board.split('').each do |c|
      next if c == ' '
      unless c.downcase == c
        w += 1
      end
    end
    w
  end
end
