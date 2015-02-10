class Product < ActiveRecord::Base
  belongs_to :company
  has_many :reviews

end
