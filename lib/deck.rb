#
# Deck Module
#
# (C) 2019, Carlos Puchol, cpg (at) rocketmail (dot) com
#
# This module contains classes that model cards and decks
# There are two decks pre-configured (default to the usual used in poker)
#
# This code is released under the GNU GPLv3 license For details see this: http://www.gnu.org/licenses/gpl-3.0.html
#

class Deck

	SPANISH_SUIT = ['1', '2', '3', '4', '5', '6', '7', 'S', 'C', 'R']
	SUITS = ['O', 'C', 'E', 'B']

	def initialize(suit = SPANISH_SUIT)
		@cards = SPANISH_SUIT.product(SUITS).map{|p| p.join}
		shuffle
	end

	def deal(how_many = 1)
		cl = []
		1.upto(how_many) do
			cl += [ @cards.pop ]
		end
		cl.compact
	end

	def size
		@cards.length
	end

	private

	def shuffle
		@cards = @cards.sort_by {rand}
	end

end
