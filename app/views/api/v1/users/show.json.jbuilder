json.user do
  json.(@user, :id, :email, :name, :created_at, :updated_at)
end