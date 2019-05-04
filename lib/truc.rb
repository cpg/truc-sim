#
# TrucJack Module
#
# (C) 2019, Carlos Puchol, cpg (at) rocketmail (dot) com
#
# This module contains classes that are specific to the game of truc
# https://es.wikipedia.org/wiki/Truco_(juego_de_naipes)#Truc,_truque_o_truco_de_Valencia
#
# This code is released under the GNU GPLv3 license For details see this:
# http://www.gnu.org/licenses/gpl-3.0.html
#

load 'deck.rb'
load 'player.rb'

# TrucPlayer, a subclass of Player that has the bits needed
# to play Truc

class TrucPlayer < Player
	def count
		sum = [0]
		cl = card_list.map do |c|
			case c
			when '1'
				sum = [add_list(sum, 1), add_list(sum, 11)].flatten
			when '2'..'9'
				sum = add_list(sum, c.to_i)
			else
				sum = add_list(sum, 10)
			end
		end
		sum
	end

	def is_21?
		count.each { |c| return true if c == 21 }
		false
	end

	def is_busted?
		count.each { |c| return false if c < 22 }
		true
	end

	def is_soft_17?
		count.each { |c| return true if c > 16 and c < 22 }
		return false
	end

	def best_count
		best=0
		count.each { |c| best = c if c > best and c < 22 }
		best
	end

private

	def add_list(list, factor)
		list.map {|e| e+factor}
	end

end
