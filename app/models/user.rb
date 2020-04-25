# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Fix error undefined method `devise'
  extend Devise::Models
  devise :database_authenticatable, :registerable
  include DeviseTokenAuth::Concerns::User
end
