class Dim
	attr_reader :width,:height
	def initialize(width,height)
		@width = width
		@height = height
	end
end
l = gets.chomp.to_i
n = gets.chomp.to_i
dim_array = []
for i in 1..n
	dim_string  = gets.chomp
	w = dim_string.split(" ")[0].to_i
	h = dim_string.split(" ")[1].to_i
	dim = Dim.new(w,h)
	dim_array.push dim 
end
dim_array.each do |dim|
	if dim.width < l or dim.height < l
		puts "UPLOAD ANOTHER"
	elsif dim.width == dim.height
		puts "ACCEPTED"
	elsif
		puts "CROP IT"
	end
end
