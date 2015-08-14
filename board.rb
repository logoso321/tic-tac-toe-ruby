require "matrix"

class Board
	attr_accessor :tiles
	@@block = "| |"
	@@blocks = []
	@@hash = Hash.new(0)
	def initialize
		#Creates an array of blocks to be used in the game
		9.times do 
			@@blocks << @@block
		end
		counter_x = 0
		counter_y = 0
		vector = Vector[counter_x,counter_y]
		for i in @@blocks
			@@hash[vector] = "| |"
			counter_x += 1
			if(counter_x == 3)
				counter_x = 0
				counter_y += 1
			end
			vector = [counter_x,counter_y]
		end
		#print(@@hash)

	end

	public 
	def Board.show
		counter = 0
		if(@@blocks.length == 0)
			temp = 0
			9.times do
				print("| |")
				temp += 1
				if(temp == 3)
					print("\n")
					temp = 0
				end
			end
		end
		for x,y in @@hash
			print(y.to_s)
			counter += 1
			if(counter == 3)
				print("\n")
				counter = 0
			end
		end
	end

	public
	def Board.input
		pos = gets.chomp.to_i
		if(pos <= 2 && pos >= 0)
			return pos
		else
			until pos <= 2 && pos >= 0
				print("Please enter a value between 0 and 2 (0,1,2): ")
				pos = gets.chomp.to_i
			end
			return pos
		end
	end
		
	public
	def play
		@@x_val = 0
		@@y_val = 0
		@@vect = Vector[@@x_val,@@y_val]
		@@counter = 0

		for x,y in @@hash
			print("\n")
			Board.show
			print("\n")
			if(@@counter == 0)
				print("Player 1 please enter your x value(range 0-2): ")
				@@x_val = Board.input
				print("Player 1 please enter your y value(range 0-2): ")
				@@y_val = Board.input
				@@vect = Vector[@@x_val, @@y_val]
				for x,y in @@hash
					#checks if @@vect is equal to the vector stored in the hash
					if @@vect.to_a.eql?(x.to_a)
						@@hash[x] = "|x|"
					end
				end
				@@counter += 1
			elsif(@@counter == 1)
				print("Player 2 please enter your x value(range 0-2): ")
				@@x_val = Board.input
				print("Player 2 please enter your y value(range 0-2): ")
				@@y_val = Board.input
				@@vect = Vector[@@x_val, @@y_val]
				for x,y in @@hash
					#checks if @@vect is equal to the vector stored in the hash
					if @@vect.to_a.eql?(x.to_a)
						@@hash[x] = "|o|"
					end
				end
				@@counter -= 1
			end
		end

		#Displays board at end of the game
		print("\n")
		Board.show
	end
end

x = Board.new
x.play