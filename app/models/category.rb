class Category < ActiveRecord::Base
 has_many :ideas

 validates :name, presence: true, uniqueness: true
end
