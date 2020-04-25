module Api
  class MoviesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index
      render json: Movie.all
    end

    def show
      movie = Movie.find(params[:id])
      render json: movie, status: :ok
    end

    def create
      movie = Movie.new(movie_params)
      return movie.errors unless movie.save

      render json: movie, status: :created
    end

    def update
      movie = Movie.new(movie_params)
      return movie.errors unless movie.update(movie_params)

      render json: movie, status: :created
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :release_year, roles_attributes:
                                    %i[kind person_id])
    end
  end
end
