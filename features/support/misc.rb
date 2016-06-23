
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

  def random_string(length)
     (0...length).map { (65 + rand(26)).chr }.join
  end

  def random_username_string(length)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
    (0..length).map {chars.sample}.join
  end

  def alpha_numeric_for_trainer_form(length)
    chars = [*('A'..'Z'), *('a'..'z'), *(0..9)]
    (0..length).map {chars.sample}.join
  end


  def random_email_string(length)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]-%w(""()[];:><)+%w(@`!#$%&'*+-/=?^_`{ } ~ .|))
    (1..length).map { chars.sample }.join
  end


end


