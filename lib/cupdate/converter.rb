require 'cupdate\updatebase'

class Converter < UpdateBase
	def initialize
		super()
	end
	
	def convert_all
		parse_directory("./source")
	end
	
private
	def create_target_directory(directory)
		target_dir = directory.gsub('source','html')
		if not File.exists? target_dir
			Dir.mkdir target_dir
		end
	end
	
	def parse_directory(dir)
		create_target_directory dir
		files = create_file_list(dir)
		files.each do |file|
		  	if File.directory? file
				parse_directory file
			else
				parse_file(file)
			end
		end
	end
	
	def parse_file(file)
		return if not file.include? '.txt'
		filename = file.gsub('source','html')
		filename = filename.gsub('.txt','.html')
		html     = `multimarkdown #{file}`
		input    = File.new(file, 'r')
		title    = input.readline
		title    = title[2..-1]
		write_output_file(filename, html, title)
	end	
end
