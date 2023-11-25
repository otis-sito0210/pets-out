if @trip.persisted?
  json.form render(partial: "trips/form", formats: :html, locals: {trip: Trip.new})
  json.inserted_item render(partial: "trips/order", formats: :html, locals: {trip: @trip})
else
  json.form render(partial: "trips/form", formats: :html, locals: {trip: @trip})
end
