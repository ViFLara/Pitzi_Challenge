
json.users @users do |user|
    json.(user, :id, :name, :cpf, :email)
  
    json.orders user.orders do |order|
      json.(order, :id, :device_model, :device_IMEI, :year_price, :number_plots)
    end
  end