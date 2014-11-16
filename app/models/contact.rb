class Contact < ActiveRecord::Base
  
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("firstname ilike :q or lastname ilike :q ", q: "%#{query}%") 
  end
end