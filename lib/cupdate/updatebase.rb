#
#
#
require 'find'
require 'erubis'

class UpdateBase
	
	def initialize
		@header = read_template('header.erb')
		@footer = read_template('footer.erb')
	end
	
protected
	
	def adjust_header(filename, title)
		levels = filename.count("/") - 1
		css_link = "./" + ("../" * levels) + "css/style.css"
    @header.result(:title => title, :css_link => css_link)
	end

  def adjust_footer
    @footer.result()
  end

	def create_file_list(directory)
		glob_pattern = "#{directory}/*"
		Dir.glob(glob_pattern)
	end
	
	def read_template(name)
		template = File.read("./template/#{name}")
		Erubis::Eruby.new(template)
	end
	
	def write_output_file(filename,html, title)
		header = adjust_header(filename, title)
    footer = adjust_footer
		full_html = header + html + footer 
		output = File.new(filename, 'w')
		output.write full_html
		output.close
	end
end
