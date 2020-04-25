class Movie < ApplicationRecord
  validates :title, :release_year, presence: true
  has_many :roles
  has_many :people, through: :roles
  accepts_nested_attributes_for :roles

  def team_participating_as(kind)
    people.where(roles: { kind: kind })
  end
end
