require_relative '../spec_helper'

describe Croupier::Game::Runner do
  before :each do
    @game_state = Croupier::Game::State.new
    Croupier::Game::State.stub(:new).and_return(@game_state)

    @runner = Croupier::Game::Runner.new
  end

  describe "#register_player" do
    it "should add the player to the game state" do
      player = double("Player")
      @runner.register_player(player)

      @game_state.players.should == [player]
    end
  end

  describe "#register_spectator" do
    it "should add the spectator to the game state" do
      spectator = double("Spectator")
      @runner.register_spectator(spectator)

      @game_state.spectators.should == [spectator]
    end
  end

  describe "#start_sit_and_go" do
    pending "should run steps until there are more than two players in game" do
      Croupier::Game::Runner::GAME_STEPS.each do |step|
        instance = double("Game step")
        step.should_receive(:new).with(@game_state).and_return(instance)
        instance.should_receive(:run)
      end

      @game_state.should_receive(:next_round!)

      @runner.start_sit_and_go
    end

  end
end