#
# Player Module
#
# (C) 2019, Carlos Puchol, cpg (at) rocketmail (dot) com
# 
# This code is released under the GNU GPLv3 license For details see this: http://www.gnu.org/licenses/gpl-3.0.html
#

class Player

	@cards = []

	def initialize
		@cards = []
	end

	def cards
		@cards.join ", "
	end

	def add_card(cards)
		@cards += cards
	end

	def card_list
		@cards
	end
end
