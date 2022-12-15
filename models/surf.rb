def all_locations
  run_sql('SELECT * FROM locations ORDER BY id')
end

def create_locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
  run_sql("INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom) VALUES($1, $2, $3, $4, $5, $6, $7)", [name, image_url, surf_experience, crowd, hazards, access, ocean_bottom])
end

def get_locations(id)
  run_sql('SELECT * FROM locations WHERE id = $1', [id])[0]
end 

def update_location(id, name, image_url, surf_experience, crowd, hazards, access, ocean_bottom, latitude, longitude)
  run_sql("UPDATE locations SET name = $2, image_url = $3, surf_experience = $4, crowd = $5, hazards = $6, access = $7, ocean_bottom = $8, latitude = $9, longitude = $10
    WHERE id = $1", [id, name, image_url, surf_experience, crowd, hazards, access, ocean_bottom, latitude, longitude])
end

def delete_location(id)
  run_sql("DELETE FROM locations WHERE id = $1", [id])
end

def get_spot(id)
  run_sql("SELECT * FROM locations WHERE id = $1", [id])
end

