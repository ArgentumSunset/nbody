require "gosu"
require_relative "ssbody"

class Universe < Gosu::Window
	G = 6.67408e-11
	HEIGHT = 1000
	WIDTH = 1000

	attr_accessor :radius, :const

	def initialize
		super WIDTH, HEIGHT
		self.caption = "PLANETS MURDER"
		@background_image = Gosu::Image.new("images/starmap2.jpg",
																				:tileable => true)

		@bodies = []

		data = File.read('simulations/planets.txt')
		lines = data.split("\n")

		@body_number = lines[0].to_i
		@radius = lines[1].to_f

		bodies_data = lines[2...lines.length]
		bodies_data.each{|body| 
		body = body.split(' ')
		@bodies.push(Ssbody.new(body[0].to_f, body[1].to_f, body[2].to_f, body[3].to_f, body[4].to_f, body[5], body[6], self))

	}
	end
	
	def draw
		@background_image.draw(0, 0, 0)
		@bodies.each{|body| body.draw}
	end

	def update
		@bodies.each{|body| 
			for i in 0...@bodies.length 
				if @bodies[i].name != body.name
					body.calculate_gravity(@bodies[i])
				end
				body.calculate_acceleration
				body.calculate_velocity
				body.calculate_position
			end
		}
	end

	def print_forces
		@bodies.each{|body|
			puts "\n" + body.name + "\nPosition: (" + body.scaled_xpos.to_s + "," + body.scaled_ypos.to_s + "\nForce: " + body.total_force.to_s  + "\nAcceleration: " + body.xacc.to_s + "\nVelocity: " + body.xvel.to_s
		}
end

	private

end

universe = Universe.new
universe.show
universe.print_forces