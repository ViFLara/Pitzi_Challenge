
# Gerando dados aleatórios para a base de dados, neste exemplo foi utilizado a gem Faker.
5.times do
    user = User.create({name: Faker::Name.name, email: Faker::Internet.email, cpf: Faker::Number.number(digits: 11)})
    user.orders.create({device_model: Faker::Science.element, device_IMEI: Faker::Alphanumeric.alphanumeric(number: 10), year_price: Faker::Number.decimal(l_digits: 2), number_plots: Faker::Number.number(digits: 2)})
end