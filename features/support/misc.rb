
module Misc
  def load_yaml_file(file_name)
    io = File.open(File.dirname(__FILE__) + "/../../config/#{file_name}.yml")
    YAML.load_file(io)
  end

  def wait_until(&block)
    WaitUtil.wait_for_condition("waiting for condition", :timeout_sec => Capybara.default_max_wait_time, :delay_sec => 0.5) do
      block.call
    end
  end
  end
