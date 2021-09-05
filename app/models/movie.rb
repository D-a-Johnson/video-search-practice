class Movie < ApplicationRecord
  belongs_to :category

  def self.search(search) ##search function that also ignores case
    if search
      joins(:category).where("lower(title) LIKE ? OR lower(categories.name) LIKE ?", "%#{search}%", "%#{search}%").order('id DESC') #joins tables for search
    else
      order('id DESC')
    end
  end
end
