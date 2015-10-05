class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates :email, :presence => {:message => "No debe estar en blanco"}
  validates :name, length: { maximum: 50, too_long: "%{count} caracteres es el máximo permitido" }
  include PermissionsConcern
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :trackable, :validatable
end
