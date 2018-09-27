# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ftp_reader_parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'ftp_reader_parser'
  spec.version       = FtpReaderParser::VERSION
  spec.authors       = ['Victor Manuel Hirochi Riveros Mancilla']
  spec.email         = ['victor.riveros@aol.com']

  spec.summary       = 'A ruby client to read ftp csv file'
  # spec.description   = ''
  spec.homepage      = 'https://github.com/hirosmans/ftp_reader_parser'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'pry', '0.11.3'
  spec.add_dependency 'pry-byebug', '3.6.0'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
