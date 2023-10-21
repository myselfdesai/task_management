class User < ApplicationRecord
  has_many :tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Add the new columns to the permitted parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:location, :latitude, :longitude])
    devise_parameter_sanitizer.permit(:account_update, keys: [:location, :latitude, :longitude])
  end 
  
end
