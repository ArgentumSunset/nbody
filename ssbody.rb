class Ssbody

	attr_accessor :radius, :xpos, :ypos, :xvel, :yvel, :mass, :scaled_xpos, :scaled_ypos, :total_force, :name, :xacc, :yacc

	G = 6.67408e-11

	def initialize(xpos,ypos,xvel,yvel,mass,img,name,univ)
		@radius = (univ.radius / 1000).to_f
		@xpos = xpos
		@ypos = ypos
		@scaled_xpos = (xpos / (radius * 2)) + 500
		@scaled_ypos = (ypos / radius) + 500
		@xvel = xvel
		@yvel = yvel
		@mass = mass
		@image = Gosu::Image.new("images/#{img}")
		@name = name 
		@total_force = 0.0
		@xforce = 0.0
		@yforce = 0.0
		@xacc = 0.0
		@yacc = 0.0
		@univ = univ

	end

	def draw
		@image.draw(@scaled_xpos - @image.width / 2.0, @scaled_ypos - @image.height / 2.0, 1)
	end

	def calculate_gravity(body)
		xdist = xpos - body.xpos
		ydist = ypos - body.ypos
		dist = Math.sqrt((xdist**2) + (ydist**2))
		@total_force = ((G * @mass * body.mass) / (dist**2))
		@xforce -= ((@total_force * xdist) / dist)
		@yforce -= ((@total_force * ydist) / dist)
		print @total_force.to_s + " = " + @name + " being pulled on by " + body.name + "\n"
	end

	def calculate_acceleration
		@xacc = @xforce / mass
		@yacc = @yforce / mass
		@xforce = 0
		@yforce = 0
	end

	def calculate_velocity
		@xvel = (xvel + (xacc * 100000))
		@yvel = (yvel + (yacc * 100000))
	end

	def calculate_position
		@xpos += @xvel * 100000
		@ypos += @yvel * 100000
		@scaled_xpos = (@xpos / (radius * 2)) + 500
		@scaled_ypos = (-@ypos / (radius * 2)) + 500
	end
	
end