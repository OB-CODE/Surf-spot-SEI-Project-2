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
('Maroubrah', 'https://maps.randwick.nsw.gov.au/public/images/facilities/Maroubra-Beach-768x250.jpg', '5', 'busy', 'rocks and rip at south end, scattered rocks at north end. Heavy beach break with agressive impact zone.', 'Road access, multiple parking sport inclduing free parking', 'Beack break - sand');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Mollymook Beach', 'https://assets.atdw-online.com.au/images/8eb51be22a935b6933b0f00b4174104f.jpeg?rect=0,192,2048,1152&w=1600&h=900&rot=360', '3', 'busy', 'Some rocks throughout - nothing really to worry about. The middle of the beach can get a big larger swell with both the south and north ends protected via headlands.', 'Road access throughout, free parking along the whole beach', 'Beack break - sand');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Green Island', 'https://www.canberratimes.com.au/images/transform/v1/crop/frm/GJZ5TVpAk84wrTzsQfLQRB/5cd16d74-dfd2-4ec8-8f81-190cc7b054c7.jpg/r0_136_2668_1642_w1200_h678_fmax.jpg', '6', 'busy', 'On a low tide, the water can get shallow at the break. In bigger conditions, the drop becomes steeper and may prove difficult for complete novices.', 'Walk from Bendalong caravan park or Manyana Beach to the north. No direct road access', 'Reef - rock and reef around headland');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Ship Sterns Bluff', 'https://www.aquasports.tv/wp-content/uploads/2018/05/Shipstern-Bluff.jpg', '10', 'isolated', 'Rocks, reef, rips, undertoes, Great White sharks, large waves, unusual swell conditions - the place that has it all!.', '8 Kilometer was through Raoul Bay', 'Reef break');


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  password_digest TEXT,
  admin_stat BOOLEAN
);

