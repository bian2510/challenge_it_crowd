class Person < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_many :roles
  has_many :movies, through: :roles
  accepts_nested_attributes_for :roles
  def movies_as(kind)
    movies.where(roles: { kind: kind })
  end
end
