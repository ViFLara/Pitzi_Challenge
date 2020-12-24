
json.array! @orders do |order|
  json.id order.id
  json.device_model order.device_model
  json.device_IMEI order.device_IMEI
  json.year_price order.year_price
  json.number_plots order.number_plots
  json.user do
    json.id order.user.id
    json.name order.user.name
    json.email order.user.email
  end
end