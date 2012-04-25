class Letter
	attr_reader :char

	def self.all
		('A'..'Z').map { |c| new(c) }
	end

	def initialize(char)
		@char = char
	end

	def to_param
		@char.downcase
	end
end