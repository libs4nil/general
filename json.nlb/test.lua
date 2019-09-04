json = require "JSON"

a = json:decode("{\"a\":[1,2,3,302,4,6,12345],\n\"b\":\"Hello World\",\"c\":12312}")
print(type(a))

function s(a)
	for k,v in pairs(a) do
		if type(v)=="table" then
			print(type(v),k,"START!")
			s(v)
			print("END!")
		else
			print(type(v),k,v)
		end
	end
end

s(a)
