class Ssbody

	def initialize(xpos,ypos,xvel,yvel,mass,img,name,univ)
		@xpos = xpos / univ.const
		@ypos = ypos / univ.const
		@xvel = xvel / univ.const
		@yvel = yvel / univ.const
		@mass = mass / univ.const
		@image = Gosu::Image.new("images/#{img}")
		@name = name
	end

	def draw
		# @image.draw(@rando - @image.width / 2.0, @rando - @image.height / 2.0, 1)
	end
	
end