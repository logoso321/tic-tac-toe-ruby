class Board
	attr_accessor :tiles
	@@block = "| |"
	@@blocks = []
	def initialize
		#Creates an array of blocks to be used in the game
		9.times do 
			@@blocks << @@block
		end
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
		for item in @@blocks
			print("| " + item + " |")
			counter += 1
			if(counter == 3)
				print("\n")
				counter = 0
			end
		end
	end

	public
	def Board.input
		returnVal = gets.chomp
		if(returnVal.casecmp("x") == 0 || returnVal.casecmp("o") == 0)
			return returnVal
		else
			until returnVal.casecmp("x") == 0 || returnVal.casecmp("o") == 0
				print("Please enter 'x' or 'o': ")
				returnVal = gets.chomp
			end
			return returnVal
		end
	end
		
	public
	def play
		@@player = ""
		@@blocks.clear
		9.times do
			print("\n")
			Board.show
			print("\n")
			print("(x or o): ")
			@@player = Board.input
			@@blocks << @@player
		end
	end
end

x = Board.new
x.play