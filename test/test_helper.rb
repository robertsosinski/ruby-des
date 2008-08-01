$:.unshift(File.dirname(__FILE__) + "../lib")

require 'test/unit'
require 'yaml'
require 'ruby-des'

class Test::Unit::TestCase
  @@fixtures = {}
  def self.fixtures(*list)
    list.each do |fixture|
      self.class_eval do
        define_method(fixture) do |item|
          @@fixtures[fixture] ||= File.exists?("#{fixture.to_s}.yml") ? YAML::load_file("#{fixture.to_s}.yml") : YAML::load_file("test/#{fixture.to_s}.yml")
          @@fixtures[fixture][item.to_s]
        end
      end
    end
  end
end
