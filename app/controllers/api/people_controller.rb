# frozen_string_literal: true

module Api
  class PeopleController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index
      render json: Person.all
    end

    def show
      person = Person.find(params[:id])
      render json: person, status: :ok
    end

    def create
      person = Person.new(params_people)
      return person.errors unless person.save

      render json: person, status: :created
    end

    def update
      person = Person.find(params[:id])
      return person.errors unless person.update(params_people)

      render json: person, status: :ok
    end

    private

    def params_people
      params.require(:people).permit(:first_name, :last_name, :alias,
                                     roles_attributes: %i[kind movie_id])
    end
  end
end
