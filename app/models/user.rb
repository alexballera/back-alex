class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates :email, :password, :presence => {:message => "No debe estar en blanco"}
  validates :name, length: { maximum: 50, too_long: "%{count} caracteres es el máximo permitido" }
  validates :password, length: { minimum: 8, too_short: "%{count} caracteres es el mínimo permitido" }
  include PermissionsConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
