# class needed for playing a game of Truc
class Game
	def initialize
		deck = Deck.new
		j1 = TrucPlayer.new
		j2 = TrucPlayer.new

		@dealer = TrucDealer.new(deck, house, player)
	end

	def play(level)
		@dealer.play_one_round(level)
	end
end
