module FbMarketing
	class Struct < FbGraph2::Struct

	end
end

Dir[File.join(__dir__, 'struct/*.rb')].each do |file|
	require file
end