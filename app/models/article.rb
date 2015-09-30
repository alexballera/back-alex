class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :category, dependent: :destroy
  validates :title, :urlgit, :urlweb, :urlimg, :presence => {:message => "No debe estar en blanco"}
  validates :title, length: { maximum: 50, too_long: "%{count} caracteres es el máximo permitido" }
  validates :urlgit, :urlweb, :urlimg, length: { maximum: 100, too_long: "%{count} caracteres es el máximo permitido" }

  has_attached_file :image, styles: { large: "640X640>", medium: "300x300>", thumb: "100x100>", mini: "40x40>"}, :default_url => "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
