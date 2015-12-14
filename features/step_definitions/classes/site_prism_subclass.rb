class Subclasses
  def self.add_class klass
    @pages ||= []
    @pages << klass
    @pages
  end

  def self.pages
    @pages
  end
end