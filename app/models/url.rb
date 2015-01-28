class Url < ActiveRecord::Base

before_save :generate_short

  def generate_short
    self.short_url = ('a'..'z').to_a.shuffle.first(5).join
  end

  def increment_click_count

     self.click_count += 1
     self.save
  end

end

