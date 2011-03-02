#
#
require 'cupdate\converter'
require 'cupdate\indexer'

class Cupdate
	def convert
		converter = Converter.new
		converter.convert_all
	
		indexer = Indexer.new
		indexer.index_all
	end
end
