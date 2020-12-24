class Order < ApplicationRecord
  # Associação com a tabela de usuários
  belongs_to :user

  # Valdações
  validates :device_model, :device_IMEI, :year_price, :number_plots, presence: true
end
