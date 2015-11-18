class Ssbody

	attr_accessor :forces, :xpos, :ypos, :xvel, :yvel, :mass, :scaled_xpos, :scaled_ypos, :total_force, :name

	G = 6.67408e-11

	def initialize(xpos,ypos,xvel,yvel,mass,img,name,univ)
		@xpos = xpos
		@ypos = ypos
		@scaled_xpos = (xpos / (univ.const * 2)) + 500
		@scaled_ypos = (ypos / univ.const) + 500
		@xvel = xvel / univ.const
		@yvel = yvel / univ.const
		@mass = mass / univ.const
		@image = Gosu::Image.new("images/#{img}")
		@name = name 
		@total_force = 0
	end

	def draw
		@image.draw(@scaled_xpos - @image.width / 2.0, @scaled_ypos - @image.height / 2.0, 1)
	end

	def move

	end

	def calculate_gravity(body)
		xdist = xpos - body.xpos
		ydist = ypos - body.ypos
		dist = Math.sqrt(xdist**2 + ydist**2)
		@total_force += (G * mass * body.mass) / dist**2
	end
	
end