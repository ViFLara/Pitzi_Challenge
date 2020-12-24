class User < ApplicationRecord
    # Relacionando com a tabela de assinaturas
    has_many :orders
    
    # Validações
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :cpf, presence: true, uniqueness: true, length: { minimum:11, maximum:11 }
end
