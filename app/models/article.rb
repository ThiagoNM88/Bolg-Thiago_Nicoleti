class Article < ActiveRecord::Base
 # Definição dos atributos do modelo
 # attr_accessor :title, :description

 # Validações dos atributos
 belongs_to :user
 validates :title, presence: true, length: { minimum: 3, maximum: 50 }
 validates :description, presence: true, length: { minimum: 01, maximum: 300 }
 validates :user_id, presence: true
 end