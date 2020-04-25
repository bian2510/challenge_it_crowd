class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :casting, :directors, :producers

  def casting
    object.team_participating_as('actor')
  end

  def directors
    object.team_participating_as('director')
  end

  def producers
    object.team_participating_as('producer')
  end
end
