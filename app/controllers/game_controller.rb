class GameController < ApplicationController
  def index
  end

  def put
    position = params[:position].to_i
    direction = params[:direction]
    game = Game.last
    if game.board[position] != ' '
      @error = '既に置かれているマスです。'
      render 'show_error' and return
    end

    game.put(position, direction[0])
    game.change_turn
    game.inc_turn
    game.save
  end

  def rotate
    position = params[:position].to_i
    direction = params[:direction]
    game = Game.last
    cell = game.board[position]
    if cell == ' '
      @error = '何も置かれていないマスです。'
      render 'show_error' and return
    end
    if Game.get_player(cell) != game.turn
      @error = 'あなたのイカではありません。'
      render 'show_error' and return
    end

    game.put(position, direction[0])
    game.change_turn
    game.inc_turn
    game.save
  end

  def splat
    position = params[:position].to_i
    game = Game.last
    cell = game.board[position]
    if Game.get_player(cell) != game.turn
      @error = 'あなたのイカではありません。'
      render 'show_error' and return
    end

    game.splat_from(position)
    game.change_turn
    game.inc_turn
    game.save
  end

  def new
    Game.create(board: ' ' * 9 * 9, turn: 'b', turn_number: 1)
  end
end
