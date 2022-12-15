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
('Maroubrah', 'https://maps.randwick.nsw.gov.au/public/images/facilities/Maroubra-Beach-768x250.jpg', '5', 'busy', 'rocks and rip at south end, scattered rocks at north end. Heavy beach break with agressive impact zone.', 'Road access, multiple parking sport inclduing free parking', 'Sand');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Mollymook Beach', 'https://assets.atdw-online.com.au/images/8eb51be22a935b6933b0f00b4174104f.jpeg?rect=0,192,2048,1152&w=1600&h=900&rot=360', '3', 'Busy', 'Some rocks throughout - nothing really to worry about. The middle of the beach can get a big larger swell with both the south and north ends protected via headlands.', 'Road access throughout, free parking along the whole beach', 'Sand');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Green Island', 'https://www.canberratimes.com.au/images/transform/v1/crop/frm/GJZ5TVpAk84wrTzsQfLQRB/5cd16d74-dfd2-4ec8-8f81-190cc7b054c7.jpg/r0_136_2668_1642_w1200_h678_fmax.jpg', '6', 'Busy', 'On a low tide, the water can get shallow at the break. In bigger conditions, the drop becomes steeper and may prove difficult for complete novices.', 'Walk from Bendalong caravan park or Manyana Beach to the north. No direct road access', 'Reef');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Ship Sterns Bluff', 'https://www.aquasports.tv/wp-content/uploads/2018/05/Shipstern-Bluff.jpg', '9', 'Busy', 'Deep water and a LONG paddle out means a long way for shore if you need help. Big wave location know as JAWS. Jaws has taken down some of the worlds best surfers over the years', '8 Kilometer was through Raoul Bay', 'Rock');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Hawaii, Peahi (Jaws)', 'http://www.espn.com/photo/2016/0125/005_Surf_JAWS.JPG', '9', 'Isolated', 'Rocks, reef, rips, undertoes, Great White sharks, large waves, unusual swell conditions - the place that has it all!.', 'Boat or jet ski usually required.', 'Reef');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('Portugal - Nazaré', 'https://img.redbull.com/images/c_limit,w_1500,h_1000,f_auto,q_auto/redbullcom/2017/03/06/1331847907687_2/nazare-march-first-mega-swell', '10', 'Average', 'Home to the biggest waves in the world. Contains all possible ocean hazards! Be warned', 'Coast off the town of Nazare - lots of easy access to water. When the swell is at its largest, boat or jet ski required to access the break', 'Rock');

INSERT INTO locations(name, image_url, surf_experience, crowd, hazards, access, ocean_bottom)
VALUES
('LOFOTEN - NORWAY', 'https://www.surftotal.com/en/images/0000NORUEGA.jpg', '6', 'Isolated', 'Temperature - Pack your wetsuit.... and your boots... and gloves... and maybe go out and buy a warmer wetsuit and pack that too! The best time of the year to surf Lofotens famous spot is between November and March even though you can find rideable waves all year round', 'Lots of surf spots all around the Loften Islands - All you need is the will to search for hidden and uncrowded gems and many layers of wool over your skin.', 'Rock');


CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  password_digest TEXT,
  admin_stat BOOLEAN
);

-- admin log in
-- INSERT INTO users 2, Mitch, O'Brien, MOB, test, 1;
UPDATE users
SET admin_stat = true
WHERE email = 'MOB';


CREATE TABLE likes(
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  spot_id INTEGER
);

ALTER TABLE likes
ADD CONSTRAINT unique_likes
UNIQUE(user_id, spot_id);