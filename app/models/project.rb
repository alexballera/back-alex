class Project < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :category
  validates :title, :presence => {:message => "No debe estar en blanco"}
  validates :title, length: { maximum: 50, too_long: "%{count} caracteres es el máximo permitido" }
end
