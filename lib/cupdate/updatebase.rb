# Base class for converter class.
#
#
require 'find'
require 'erubis'

class UpdateBase
	
	def initialize
		@template = read_template('template.erb')
	end
	
protected

  # Creates the full html document.
  # Uses the filename path to determine css link path,
  # and then fills in the ERB template.
	def html_from_template(filename, title, html)
		levels = filename.count("/") - 1
		css_link = "./" + ("../" * levels) + "css/style.css"
    @template.result(:title => title, :css_link => css_link, :content => html)
	end

	def create_file_list(directory)
		glob_pattern = "#{directory}/*"
		Dir.glob(glob_pattern)
	end
	
	def read_template(name)
    if File.exist? name
		  template = File.read("#{name}")
    else
      template = DefaultTemplate.DEFAULT_TEMPLATE
    end
		Erubis::Eruby.new(template)
	end
	
	def write_output_file(filename, html, title)
		full_html = html_from_template(filename, title, html) 
		output = File.new(filename, 'w')
		output.write full_html
		output.close
	end
end
