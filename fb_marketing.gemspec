Gem::Specification.new do |s|
  s.name = "fb_marketing"
  s.version = File.read("VERSION").delete("\n\r")
  s.authors = ["Jonathan De Jong"]
  s.description = %q{A full-stack Facebook Marketing API wrapper in Ruby.}
  s.summary = %q{A full-stack Facebook Marketing API wrapper in Ruby.}
  s.email = "support@sparknettech.com"
  s.homepage = "https://github.com/jdejong/fb_marketing"
  s.add_dependency('fb_graph2', '~> 0.5.0')
  s.add_development_dependency 'rake'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-its'
end