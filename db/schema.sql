CREATE DATABASE surf_spots_db;
\c surf_spots_db;

CREATE TABLE locations(
  id SERIAL PRIMARY KEY,
  name TEXT,
  image_url TEXT,
  surf_experience INT,
  crowd TEXT,
  hazards TEXT,
  access TEXT,
  ocean_bottom TEXT
);

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Maroubrah', 'https://maps.randwick.nsw.gov.au/public/images/facilities/Maroubra-Beach-768x250.jpg', 'intermediate', 'busy', 'rocks and rip at south end, scattered rocks at north end. Heavy beach break with agressive impact zone.', 'Road access, multiple parking sport inclduing free parking', 'Beack break - sand');
