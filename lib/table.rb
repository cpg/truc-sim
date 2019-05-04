# Table - has the deck(s), keeps count

class Table

	def initialize(deck, house)
		@deck = deck
		@house = house
	end

	# play one round from the player
	def play_one_player(player = @player)
		player.add_card(@deck.deal(2))
  		print "Here are your cards: #{player.cards} (count: #{player.count.join ' or '})\n"
		busted = false
		got_21 =player.is_21?
		move='h'
		until (got_21 or busted or move == 's')
			print "Enter your move (h(hit)/s(stand)): "
			move = STDIN.readline.chomp
			if move == 'h'
				player.add_card(@deck.deal)
				print "Here are your cards: #{player.cards} (count: #{player.count.join ' or '})\n"
				busted = player.is_busted?
				got_21 = player.is_21?
			end
      		end
		#      if busted
		#	 print "******* Busted! The house wins!\n"
		#      elsif got_21
		#	 print "******* Congrats! You have 21!\n"
		#      else
		#	print "******* Your best count is #{player.best_count}\n"
		#      end
	end

	# play one round from the house player
	def play_house
		@house.add_card(@deck.deal(2))
		busted = false
		stand = @house.is_soft_17?
		until (busted or stand)
			@house.add_card(@deck.deal)
			busted = @house.is_busted?
			stand = @house.is_soft_17?
		end
		# #print "These are the house cards: #{@house.cards} (count:
		# #{@house.count.join ' or '})\n"
	end

	# play one player with a given stratefy
	def play_strategy(bar=13, player=@player)
		player.add_card(@deck.deal(2))
		busted = false
		stand = player.best_count >= bar
		until (busted or stand)
			player.add_card(@deck.deal)
			busted = player.is_busted?
			stand = player.best_count >= bar
		end
		# print "These are the house cards: #{player.cards} (count:
		# #{player.count.join ' or '})\n"
	end

	# print the winner
	def print_who_wins
		player_count = @player.best_count
		house_count = @house.best_count
		if house_count == 0
			print "You win! The house went over 21!\n"
		elsif player_count > house_count
			print "You win! Your count is #{player_count} (vs. #{house_count} for the house).\n"
		elsif   player_count == house_count
			print "Push, both counts are the same: #{player_count}\n"
		else
			print "The house wins with #{house_count} vs. #{player_count} for the player.\n"
		end
	end

	# determine the winner
	def determine_who_wins
		player_count = @player.best_count
		house_count = @house.best_count
		if house_count == 0
			'p'
		elsif player_count > house_count
			'p'
		elsif   player_count == house_count
			'd'
		else
			'h'
		end
	end

	# play one round with the given strategy
	def play_one_round(level=13)
		# print "\n \n============ New Truc Round! ================\n"
		play_strategy(level)
		if @player.is_busted?
			#print "Sorry, you went over 21. You lose, the house wins.\n"
			'h'
		else
			play_house
			determine_who_wins
		end
	end

end
