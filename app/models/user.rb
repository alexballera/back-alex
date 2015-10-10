class User < ActiveRecord::Base
  include PermissionsConcern
  has_many :articles, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates :email, :presence => {:message => "No debe estar en blanco"},
                  format: { with: /\A[^@]+@[^@]+\z/,
                  message: "Introduzca una dirección de correo electrónica válida" }
  validates :name, length: { maximum: 50, too_long: "%{count} caracteres es el máximo permitido" }
    # Include default devise modules. Others available are:
  # :lockable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :timeoutable, :recoverable, :rememberable, :trackable, :validatable

  scope :latest, ->{ order(created_at: :desc) }
end
