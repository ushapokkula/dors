
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

  VAR_MAP ||= {}

  def store(name, value)
    VAR_MAP[name] = value
  end

  def fetch(name, raise_exception = nil)
    if raise_exception == true && VAR_MAP.has_key?(name) == false
      raise "No value set for: " + name
    end
    VAR_MAP[name]
  end


  def random_string(length)
    (0...length).map { (65 + rand(26)).chr }.join
  end

  
  def random_username_string(length)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]+%w(- _ ))
    (0...length).map {chars.sample}.join
  end

  def alpha_numeric(length)
    chars = [*('A'..'Z'), *('a'..'z'), *(0..9)]
    (0...length).map {chars.sample}.join
  end

  def random_number(length)
    chars = [*(0..9)]
    (0...length).map {chars.sample}.join
  end


  def random_email_string(length)
    chars = ([*('A'..'Z'), *('a'..'z'), *(0..9)]-%w(""()[];:><)+%w(@`!#$%&'*+-/=?^_`{ } ~ .|))
    (1...length).map { chars.sample }.join
  end

  def find_id_by_label(label)
    find('label', text: /\A#{label}\z/, visible: true)[:for]
  end

  def find_element_by_label(label)
    el = find('label', text: /\A#{label}\z/, visible: true)
    find("##{el[:for]}")
  end
end
