class Role < ApplicationRecord
  belongs_to :person
  belongs_to :movie
  enum kind: { actor: 'actor', director: 'director', producer: 'producer' }
end
