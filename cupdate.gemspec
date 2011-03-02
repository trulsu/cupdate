# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cupdate}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Truls Unstad"]
  s.date = %q{2011-02-25}
  s.default_executable = %q{cupdate}
  s.email = %q{trulsuh@yahoo.com}
  s.executables = ["cupdate"]
  s.extra_rdoc_files = ["README"]
  s.files = ["test/unit.rb", "lib/cupdate", "lib/cupdate/converter.rb", "lib/cupdate/indexer.rb", "lib/cupdate/updatebase.rb", "lib/cupdate.rb", "bin/cupdate", "README"]
  s.homepage = %q{http://yoursite.example.com}
  s.require_paths = ["bin", "lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{Converts all multimarkdown files in source to html in html and creates an index file}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
