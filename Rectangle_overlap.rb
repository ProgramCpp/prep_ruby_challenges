
class Coord
	attr_accessor :X
	attr_accessor :Y
end

class Rectangle
	attr_accessor :A
	attr_accessor :B
	def initialize(rec)
		@A = Coord.new
		@B = Coord.new
		@A.X = rec[0][0]
		@A.Y = rec[0][1]
		@B.X = rec[1][0]
		@B.Y = rec[1][1]
	end
end

def order_coord_of_rectangles(rec)
#   ------------- B 	  --------------- A   	A---------------- 	B --------------- 
#   |		|	  |		|	|		|	  |		|	
#   |correct	|	  |		|	|		|	  |		|
# A ------------	B ---------------	----------------- B	  --------------- A
	if rec.B.X < rec.A.X
		temp = Coord.new
		temp = rec.A
		rec.A = rec.B
		rec.B = temp
	end

	if rec.A.Y > rec.B.Y
		diff = rec.A.Y - rec.B.Y
		rec.A.Y -= diff
		rec.B.Y += diff
	end

	return rec
end

# order the rectangles as per assumptions
def order_rectangles(rec1, rec2)
	r1 = Rectangle.new(rec1)
	r2 = Rectangle.new(rec2)
	r1 = order_coord_of_rectangles(r1)
	r2 = order_coord_of_rectangles(r2)

	if r2.A.X < r1.A.X
		temp = r1
		r1 = r2
		r2 = temp
	end

	ret = [r1, r2]
	return ret
end

def overlap?(rec1, rec2)
	rects = order_rectangles(rec1, rec2)
	r1 = rects[0]
	r2 = rects[1]
#   -------------
#   |		|
#   |		|
#   -------------
#   	-----------------
#   	|		|
#   	|		|
#   	-----------------
#------------------------------------
#   -------------
#   |		|
#   |	--------|--------
#   |	|	|	|	
#   ----|--------	|
#   	|		|
#   	-----------------
#------------------------------------
#   ---------------------
#   |	 |	|	|
#   |	 |	|	|
#   ---------------------
#------------------------------------
#   ---------
#   |	----|----
#   |	|   |	|	
#   |	----|----
#   ---------
#------------------------------------
#	    -------------
#  	----|----	|
#  	|   |	|	|
#  	----|----	|
#	    -------------
#------------------------------------
#       ---------
#	|	|
#   ----|----	|
#   |	|   |	|
#   |	----|----
#   |	    |
#   ---------
#------------------------------------
#	---------
#   	|	|
#   	|	|
#   	---------
#   ----------
#   |	     |
#   |	     |
#   ----------

	if r2.A.X < r1.B.X
		if r1.A.Y > r2.B.Y
			return false
		elsif r2.A.Y > r1.B.Y
			return false
		else
			return true
		end	
	else
		return false	
	end
end


#test assumptions: first rectangle along x-axis first and first co-ordinate along axes first for each rectangle, both co-ordinates on diagonally opposite corners
#test: overlap is true
#puts overlap?( [ [0,0],[3,3] ], [ [1,1],[4,5] ] )
#test: overlap is false
#puts overlap?( [ [0,0],[1,4] ], [ [1,1],[3,2] ] )
