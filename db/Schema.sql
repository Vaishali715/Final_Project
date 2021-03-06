-- Creating raw table in SQL db

CREATE TABLE raw_mushroom(
	mushroom_id INT
	, class VARCHAR(15)
	, cap_shape VARCHAR(15)
	, cap_surface VARCHAR(15)
	, cap_color VARCHAR(15)
	, bruises VARCHAR(15)
	, odor VARCHAR(15)
	, gill_attachment VARCHAR(15)
	, gill_spacing VARCHAR(15)
	, gill_size VARCHAR(15)
	, gill_color VARCHAR(15)
	, stalk_shape VARCHAR(15)
	, stalk_root VARCHAR(15)
	, stalk_surface_above_ring VARCHAR(15)
	, stalk_surface_below_ring VARCHAR(15)
	, stalk_color_above_ring VARCHAR(15)
	, stalk_color_below_ring VARCHAR(15)
	, veil_type VARCHAR(15)
	, veil_color VARCHAR(15)
	, ring_number VARCHAR(15)
	, ring_type VARCHAR(15)
	, spore_print_color VARCHAR(15)
	, population VARCHAR(15)
	, habitat VARCHAR(15)
	, PRIMARY KEY (mushroom_id)
);

-- Schema for cleaned table; table will be exported to SQL db via Pandas with .to_sql

-- CREATE TABLE clean_mushroom(
-- 	mushroom_id INT
-- 	, class VARCHAR(15)
-- 	, cap_shape VARCHAR(15)
-- 	, cap_surface VARCHAR(15)
-- 	, cap_color VARCHAR(15)
-- 	, bruises VARCHAR(15)
-- 	, odor VARCHAR(15)
-- 	, gill_attachment VARCHAR(15)
-- 	, gill_spacing VARCHAR(15)
-- 	, gill_size VARCHAR(15)
-- 	, gill_color VARCHAR(15)
-- 	, stalk_shape VARCHAR(15)
-- 	, stalk_root VARCHAR(15)
-- 	, stalk_surface_above_ring VARCHAR(15)
-- 	, stalk_surface_below_ring VARCHAR(15)
-- 	, stalk_color_above_ring VARCHAR(15)
-- 	, stalk_color_below_ring VARCHAR(15)
-- 	, veil_type VARCHAR(15)
-- 	, veil_color VARCHAR(15)
-- 	, ring_number VARCHAR(15)
-- 	, ring_type VARCHAR(15)
-- 	, spore_print_color VARCHAR(15)
-- 	, population VARCHAR(15)
-- 	, habitat VARCHAR(15)
-- 	, PRIMARY KEY (mushroom_id)
-- );