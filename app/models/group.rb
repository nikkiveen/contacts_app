class Group < ActiveRecord::Base
  has_many :grouped_contacts
  has_many :products, through: :grouped_contacts
end
