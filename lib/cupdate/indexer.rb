#
#
require 'find'
require 'cupdate\updatebase'

class Indexer < UpdateBase
	def initialize
		@result = Array.new
		super()
	end
	
	def index_all
		@result << "<ul>"
		parse_directory("./html")
		@result << "</ul>"
		write_output_file("./index.html", @result.join("\n"), "Notes Index")
	end
	
	def print_result
		puts @header
		@result.each do |line|
			puts "    #{line}"
		end
		puts @footer
	end
	
private
	def parse_directory(dir)
		files = create_file_list(dir)
		files.each do |file|
		  	if File.directory? file
		  		handle_file(file)
		  		@result << "<ul>"
		  		parse_directory(file)
		  		@result << "</ul>"
			else
				handle_file(file)
			end
		end
	end
	
	def get_title(file)
		res = "--- ERROR ---"
		pattern = /(?<name>[^\/]+)$/
		if(pattern =~ file)
			res = $~[:name].split('.')[0]
		end
		res
	end
	
	def handle_file(path)
		title = get_title(path)
		if File.directory? path
			@result << "<li>#{title}</li>"
		else
			@result << "<li><a href=\"#{path}\">#{title}</a></li>"
		end
	end
end

# Run this as a script
if $0 == __FILE__
	converter = Converter.new
	converter.convert_all
	
	indexer = Indexer.new
	indexer.index_all
end
