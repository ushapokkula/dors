module Misc
  def load_yaml_file(file_name)
    io = File.open(File.dirname(__FILE__) + "/../../config/#{file_name}.yml")
    YAML.load_file(io)
  end
  end
