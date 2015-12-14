class Trainers


  def initialize
    Subclasses.pages.each do |page|
      self.class.send(:define_method, page.to_s.underscore)  do
        page.new
      end
    end
  end


end