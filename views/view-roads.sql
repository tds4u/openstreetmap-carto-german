DROP VIEW IF EXISTS view_osmde_roads;
CREATE VIEW view_osmde_roads AS
SELECT
osm_id,
tags->'admin_level' as "admin_level",
"boundary" as "boundary",
"highway" as "highway",
tags->'name' as "name",
tags->'name:de' as "name:de",
tags->'int_name' as "int_name",
tags->'name:en' as "name:en",
"railway" as "railway",
tags->'ref' as "ref",
tags->'service' as "service",
tags->'tunnel' as "tunnel",
z_order as z_order,
way as way,
"tags" as "tags"
FROM planet_osm_roads;

GRANT select ON view_osmde_roads TO public;
