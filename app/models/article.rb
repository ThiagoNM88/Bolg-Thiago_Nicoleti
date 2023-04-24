class Article < ActiveRecord::Base
 # Definição dos atributos do modelo
 # attr_accessor :title, :description

 # Validações dos atributos
 validates :title, presence: true
 validates :description, presence: true
end