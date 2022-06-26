defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Ezequiel", :chute, :soco, :cura)
      computer = Player.build("Robozao", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "return the current game state" do
      player = Player.build("Ezequiel", :chute, :soco, :cura)
      computer = Player.build("Robozao", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Robozao"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Ezequiel"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "return the game state updated" do
      player = Player.build("Ezequiel", :chute, :soco, :cura)
      computer = Player.build("Robozao", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Robozao"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Ezequiel"
        },
        status: :started,
        turn: :player
      }

      assert expected_response == Game.info()

      new_state = %{
        computer: %Player{
          life: 85,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Robozao"
        },
        player: %Player{
          life: 50,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Ezequiel"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert expected_response == Game.info()
    end
  end

  describe "player" do
    test "returns the player data" do
      player = Player.build("Ezequiel", :chute, :soco, :cura)
      computer = Player.build("Robozao", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %Player{
        life: 100,
        moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
        name: "Ezequiel"
      }

      assert expected_response == Game.player()
    end
  end

  describe "turn" do
    test "Returns the current shift" do
      player = Player.build("Ezequiel", :chute, :soco, :cura)
      computer = Player.build("Robozao", :chute, :soco, :cura)

      Game.start(computer, player)

      assert :player == Game.turn()
    end
  end

  describe "fetch_player" do
    test "et" do
      player = Player.build("Ezequiel", :chute, :soco, :cura)
      computer = Player.build("Robozao", :chute, :soco, :cura)

      Game.start(computer, player)

      assert player == Game.fetch_player(:player)
      assert computer == Game.fetch_player(:computer)
    end
  end
end
