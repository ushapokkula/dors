class SitePrism::Page
  def self.inherited subclass
    Subclasses.add_class subclass
  end
end