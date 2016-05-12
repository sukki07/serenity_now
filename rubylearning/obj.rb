sukki = Object.new
def sukki.talk
	puts "I am sukki"
end
 
def sukki.married?
	true
end

def sukki.age
	28
end

def sukki.wife_name
	"Mugdha"
end

def sukki.address
	"1A,Pristine Magnum"
end

def sukki.employed?
	true
end
=begin
loop do
	result = gets.chomp
	break if result.eql?"quit"
	if sukki.respond_to?result
		puts sukki.__send__(result)
	else
		puts "sry"
	end
end
=end

a = "1"
b  = a 
b<<"1"
puts a,b


a = 1
b = a 
b+=1
puts a,b
