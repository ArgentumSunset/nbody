require "gosu"
require_relative "ssbody"

class Universe < Gosu::Window
	G = 6.67408e-11
	HEIGHT = 1000
	WIDTH = 1000

	attr_accessor :radius

	def initialize
		super WIDTH, HEIGHT
		self.caption = "PLANETS MURDER"
		@background_image = Gosu::Image.new("images/starmap2.jpg",
																				:tileable => true)

		@bodies = []

		data = File.read('simulations/planets.txt')
		lines = data.split("\n")

		@body_number = lines[0]
		@radius = lines[1]
		@const = @radius / 1000

		bodies_data = lines[2...lines.length]
		bodies_data.each{|body| 
		body = body.split(' ')
		@bodies.push(Ssbody.new(body[0].to_i, body[1].to_i, body[2].to_i, body[3].to_i, body[4].to_i, body[5], body[6],self))

	}
	end
	
	def draw
		@background_image.draw(0, 0, 0)
		@bodies.each{|body| body.draw}
	end

	def update

	end
end

universe = Universe.new
universe.show