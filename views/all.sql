/*

name localization for german mapnik style 

http://wiki.openstreetmap.org/wiki/German_Style

Get the name tag which is the most appropriate one for a german map

This can be used for any language using latin script.

get_localized_placename(name text, local_name text, int_name text, name_en text, loc_in_brackets boolean)
 returns "local_name (name)" if local_name exists and name consists of latin, greek or cyrillic characters
 returns "local_name"        if local_name exists and name does not consist of latin, greek or cyrillic characters
 returns "name"              if "name" consists of latin characters
 returns "name_int"          if "name_int" exists and "name" does not consist of latin characters
 returns "name_en"           if "name_en" exists and "name" does not consist of latin characters 
 returns a transliteration of "name" if "name" does not consist of latin characters
 if "local_name" is part of "name", this function returns only "local_name" 
 
 loc_in_brackets decides, which part of name_loc/name is in brackets


get_localized_streetname(name text, local_name text, int_name text, name_en text, loc_in_brackets boolean)
 same as get_localized_placename, but with some common abbreviations 
 for german street names (Straße->Str.), if name ist longer than 15 characters


get_localized_name_without_brackets(name text, local_name text, int_name text, name_en text)
 same as get_localized_placename, but with no names in brackets
 
get_latin_name(name text, local_name text, int_name text, name_en text)
 returns name, if name is latin
 if not, returns local_name, name_en, name_int, last choice is a transliteration of name
 
 
 
usage examples:

select get_localized_placename('Москва́','Moskau',NULL,'Moscow',true) as name;
       ---> "Москва́ (Moskau)"
select get_localized_placename('Москва́','Moskau',NULL,'Moscow',false) as name;
       -->  "Moskau (Москва́́́́́́́́́́)"
select get_localized_placename('القاهرة','Kairo','Cairo','Cairo',false) als name;
       --> "Kairo"
select get_localized_placename('Brixen Bressanone','Brixen',NULL,NULL,false) as name;
       --> "Brixen"
select get_localized_streetname('Doktor-No-Straße',NULL,NULL,NULL,false) as name;
       --> "Doktor-No-Straße"
select get_localized_streetname('Dr. No Street','Professor-Doktor-No-Straße',NULL,NULL,false) as name;
       --> "Prof.-Dr.-No-Str. (Dr. No Street)"
select get_localized_name_without_brackets('Dr. No Street','Doktor-No-Straße',NULL,NULL) as name;
       --> "Doktor-No-Straße"       

(c) 2014 Sven Geggus <svn-osm@geggus.net>, Max Berger <max@dianacht.de> public domain
*/


/* helper function "is_latin" checks if string consists of latin characters only */
CREATE or REPLACE FUNCTION is_latin(text) RETURNS BOOLEAN AS $$
  DECLARE
    i integer;
  BEGIN
    FOR i IN 1..char_length($1) LOOP
      IF (ascii(substr($1, i, 1)) > 591) THEN
        RETURN false;
      END IF;
    END LOOP;
    RETURN true;
  END;
$$ LANGUAGE 'plpgsql';


/* helper function "is_latinorgreek" checks if string consists of latin, greek or cyrillic characters only */
CREATE or REPLACE FUNCTION is_latinorgreek(text) RETURNS BOOLEAN AS $$
  DECLARE
    i integer;
  BEGIN
    FOR i IN 1..char_length($1) LOOP
      IF (ascii(substr($1, i, 1)) > 1327) THEN
        RETURN false;
      END IF;
    END LOOP;
    RETURN true;
  END;
$$ LANGUAGE 'plpgsql';


/* helper function "street_abbreviation" replaces some common parts of german street names */
/* with their abbr, if length(name) is over 16                                      */
CREATE or REPLACE FUNCTION street_abbreviation(text) RETURNS TEXT AS $$
 DECLARE
  abbrev text;
 BEGIN
  abbrev=$1;
  IF (length(abbrev)<16) THEN
   return abbrev;
  END IF;
  IF (position('traße' in abbrev)>0) THEN
   abbrev=regexp_replace(abbrev,'Straße\M','Str.');
   abbrev=regexp_replace(abbrev,'straße\M','str.');
  END IF;
  IF (position('asse' in abbrev)>0) THEN
   abbrev=regexp_replace(abbrev,'Strasse\M','Str.');
   abbrev=regexp_replace(abbrev,'strasse\M','str.');
   abbrev=regexp_replace(abbrev,'Gasse\M','G.');
   abbrev=regexp_replace(abbrev,'gasse\M','g.');
  END IF;
  IF (position('latz' in abbrev)>0) THEN
   abbrev=regexp_replace(abbrev,'Platz\M','Pl.');
   abbrev=regexp_replace(abbrev,'platz\M','pl.');
  END IF;
  IF (position('Professor' in abbrev)>0) THEN
   abbrev=replace(abbrev,'Professor ','Prof. ');
   abbrev=replace(abbrev,'Professor-','Prof.-');
  END IF;
  IF (position('Doktor' in abbrev)>0) THEN
   abbrev=replace(abbrev,'Doktor ','Dr. ');
   abbrev=replace(abbrev,'Doktor-','Dr.-');
  END IF;
  IF (position('Bürgermeister' in abbrev)>0) THEN
   abbrev=replace(abbrev,'Bürgermeister ','Bgm. ');
   abbrev=replace(abbrev,'Bürgermeister-','Bgm.-');
  END IF;
  IF (position('Sankt' in abbrev)>0) THEN
   abbrev=replace(abbrev,'Sankt ','St. ');
   abbrev=replace(abbrev,'Sankt-','St.-');
  END IF;
  return abbrev;
 END;
$$ LANGUAGE 'plpgsql';



CREATE or REPLACE FUNCTION get_localized_placename(name text, local_name text, int_name text, name_en text, loc_in_brackets boolean) RETURNS TEXT AS $$
  BEGIN
    IF (local_name is NULL) THEN
      IF (int_name is NULL) THEN
	IF (name_en is NULL) THEN
          if (name is NULL) THEN
            return NULL;
          END IF;
          if (name = '') THEN
            return '';
          END IF;
	  /* if transliteration is available add here with a latin1 check */
          IF is_latin(name) THEN
            return name;
          ELSE
            return transliterate(name); 
          END IF;
	  return name;
	ELSE
	  IF (name_en != name) THEN
	    IF is_latin(name) THEN
	      return name;
	    ELSE
	      return name_en;
	    END IF;
          ELSE
            return name;
          END IF; 
	END IF;        
      ELSE
	IF (int_name != name) THEN
	  IF is_latin(name) THEN
	    return name;
	  ELSE
	   return int_name;
          END IF;
	ELSE
	  return name;
	END IF;
      END IF;
    ELSE
      IF (name is NULL) THEN
       return local_name;
      ELSE
        IF ( position(local_name in name)>0 or position('(' in name)>0 or position('(' in local_name)>0 ) THEN    
         IF ( loc_in_brackets ) THEN
          return name;                                                       
         ELSE
          return local_name;
         END IF;
        ELSE
         IF ( loc_in_brackets ) THEN
          IF ( is_latinorgreek(name)=false ) THEN
           return local_name;
          ELSE
           return name||' ('||local_name||')';
          END IF;
         ELSE
          IF ( is_latinorgreek(name)=false ) THEN
           return local_name;
          ELSE
           return local_name||' ('||name||')';
          END IF;
         END IF;
        END IF;
      END IF;
    END IF;
  END;
$$ LANGUAGE 'plpgsql';



CREATE or REPLACE FUNCTION get_localized_streetname(name text, local_name text, int_name text, name_en text, loc_in_brackets boolean) RETURNS TEXT AS $$
  BEGIN
    IF (local_name is NULL) THEN
      IF (int_name is NULL) THEN
	IF (name_en is NULL) THEN
          if (name is NULL) THEN
            return NULL;
          END IF;
          if (name = '') THEN
            return '';
          END IF;
	  /* if transliteration is available add here with a latin1 check */
          IF is_latin(name) THEN
            return street_abbreviation(name);
          ELSE
            return transliterate(name); 
          END IF;
	  return name;
	ELSE
	  IF (name_en != name) THEN
	    IF is_latin(name) THEN
	      return street_abbreviation(name);
	    ELSE
	      return name_en;
	    END IF;
          ELSE
            return name;
          END IF; 
	END IF;        
      ELSE
	IF (int_name != name) THEN
	  IF is_latin(name) THEN
	    return street_abbreviation(name);
	  ELSE
	   return int_name;
          END IF;
	ELSE
	  return street_abbreviation(name);
	END IF;
      END IF;
    ELSE
      IF (name is NULL) THEN
       return street_abbreviation(local_name);
      ELSE
        IF ( position(local_name in name)>0 or position('(' in name)>0 or position('(' in local_name)>0 ) THEN    
         IF ( loc_in_brackets ) THEN
          return street_abbreviation(name);
         ELSE
          return street_abbreviation(local_name);
         END IF;
        ELSE
         IF ( loc_in_brackets ) THEN
          IF ( is_latinorgreek(name)=false ) THEN
           return street_abbreviation(local_name);
          ELSE
           return street_abbreviation(name||' ('||local_name||')');
          END IF;
         ELSE
          IF ( is_latinorgreek(name)=false ) THEN
           return street_abbreviation(local_name);
          ELSE
           return street_abbreviation(local_name||' ('||name||')');
          END IF;
         END IF;
        END IF;
      END IF;
    END IF;
  END;
$$ LANGUAGE 'plpgsql';


CREATE or REPLACE FUNCTION get_localized_name_without_brackets(name text, local_name text, int_name text, name_en text) RETURNS TEXT AS $$
  BEGIN
    IF (local_name is NULL) THEN
      IF (int_name is NULL) THEN
	IF (name_en is NULL) THEN
          if (name is NULL) THEN
            return NULL;
          END IF;
          if (name = '') THEN
            return '';
          END IF;
	  /* if transliteration is available add here with a latin1 check */
          IF is_latin(name) THEN
            return name;
          ELSE
            return transliterate(name);
          END IF;
	  return name;
	ELSE
	  IF (name_en != name) THEN
	    IF is_latin(name) THEN
	      return name;
	    ELSE
	      return name_en;
	    END IF;
          ELSE
            return name;
          END IF; 
	END IF;        
      ELSE
	IF (int_name != name) THEN
	  IF is_latin(name) THEN
	    return name;
	  ELSE
	   return int_name;
          END IF;
	ELSE
	  return name;
	END IF;
      END IF;
    ELSE
      return local_name;
    END IF;
  END;
$$ LANGUAGE 'plpgsql';

CREATE or REPLACE FUNCTION get_localized_name(name text, local_name text, int_name text, name_en text) RETURNS TEXT AS $$
  BEGIN
    IF (local_name is NULL) THEN
      IF (int_name is NULL) THEN
	IF (name_en is NULL) THEN
          if (name is NULL) THEN
            return NULL;
          END IF;
          if (name = '') THEN
            return '';
          END IF;
	  /* if transliteration is available add here with a latin1 check */
          IF is_latin(name) THEN
            return name;
          ELSE
            return transliterate(name);
          END IF;
	  return name;
	ELSE
	  IF (name_en != name) THEN
	    IF is_latin(name) THEN
	      return name;
	    ELSE
	      return name_en;
	    END IF;
          ELSE
            return name;
          END IF; 
	END IF;        
      ELSE
	IF (int_name != name) THEN
	  IF is_latin(name) THEN
	    return name;
	  ELSE
	   return int_name;
          END IF;
	ELSE
	  return name;
	END IF;
      END IF;
    ELSE
      return local_name;
    END IF;
  END;
$$ LANGUAGE 'plpgsql';


CREATE or REPLACE FUNCTION get_latin_name(name text, local_name text, int_name text, name_en text) RETURNS TEXT AS $$
 BEGIN
  IF (name is not NULL) and (name !='') and (is_latin(name)) THEN
   return name;
  ELSE
   IF (local_name is NULL) THEN
    IF (int_name is NULL) THEN
     IF (name_en is NULL) THEN
      IF (name is not NULL) and (name !='') THEN
       return transliterate(name); 
      ELSE
       return NULL;
      END IF;
     ELSE
      return name_en;
     END IF;
    ELSE
     return int_name;
    END IF;
   ELSE
    return local_name;
   END IF;
  END IF;
 END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION convert_to_integer(v_input text)
RETURNS INTEGER AS $$
DECLARE v_int_value INTEGER DEFAULT NULL;
BEGIN
	BEGIN
		v_int_value := regexp_replace(v_input, '[^0-9]', '', 'g')::INTEGER;
	EXCEPTION WHEN OTHERS THEN
		RAISE NOTICE 'Invalid integer value: "%".  Returning NULL.', v_input;
		RETURN NULL;
	END;
	RETURN v_int_value;
END;
$$ LANGUAGE plpgsql;
DROP VIEW IF EXISTS view_osmde_line;
CREATE VIEW view_osmde_line AS
SELECT
osm_id,
"access" as "access",
"addr:housename" as "addr:housename",
"addr:housenumber" as "addr:housenumber",
"addr:interpolation" as "addr:interpolation",
"admin_level" as "admin_level",
"aerialway" as "aerialway",
"aeroway" as "aeroway",
"amenity" as "amenity",
"barrier" as "barrier",
"bicycle" as "bicycle",
"boundary" as "boundary",
"brand" as "brand",
"bridge" as "bridge",
"building" as "building",
tags->'capital' as "capital",
"construction" as "construction",
"covered" as "covered",
"culvert" as "culvert",
"cutting" as "cutting",
"denomination" as "denomination",
"disused" as "disused",
"embankment" as "embankment",
"foot" as "foot",
"generator:source" as "generator:source",
"harbour" as "harbour",
"highway" as "highway",
"historic" as "historic",
"horse" as "horse",
"intermittent" as "intermittent",
"junction" as "junction",
"landuse" as "landuse",
"layer" as "layer",
"leisure" as "leisure",
"lock" as "lock",
"man_made" as "man_made",
"military" as "military",
"motorcar" as "motorcar",
tags->'motorroad' as "motorroad",
"name" as "name",
tags->'name:de' as "name:de",
tags->'int_name' as "int_name",  
tags->'name:en' as "name:en",
"natural" as "natural",
"oneway" as "oneway",
"operator" as "operator",
"place" as "place",
tags->'poi' as "poi",
convert_to_integer("population") as "population",
"power" as "power",
"power_source" as "power_source",
tags->'proposed' as "proposed",
"railway" as "railway",
"ref" as "ref",
"religion" as "religion",
"route" as "route",
"service" as "service",
"shop" as "shop",
"sport" as "sport",
"surface" as "surface",
"toll" as "toll",
"tourism" as "tourism",
"tower:type" as "tower:type",
"tracktype" as "tracktype",
"tunnel" as "tunnel",
"water" as "water",
"waterway" as "waterway",
"wetland" as "wetland",
"width" as "width",
"wood" as "wood",
way as "way",
way_area as way_area,
z_order as z_order,
tags as "tags"
FROM planet_osm_line;

GRANT select ON view_osmde_line to public;
DROP VIEW IF EXISTS view_osmde_point;
CREATE VIEW view_osmde_point AS
SELECT
osm_id,
"access" as "access",
"addr:housename" as "addr:housename",
"addr:housenumber" as "addr:housenumber",
"addr:interpolation" as "addr:interpolation",
"admin_level" as "admin_level",
"aerialway" as "aerialway",
"aeroway" as "aeroway",
"amenity" as "amenity",
"barrier" as "barrier",
"bicycle" as "bicycle",
"boundary" as "boundary",
"brand" as "brand",
"bridge" as "bridge",
"building" as "building",
"capital" as "capital",
"construction" as "construction",
"covered" as "covered",
"culvert" as "culvert",
"cutting" as "cutting",
"denomination" as "denomination",
"disused" as "disused",
"ele" as "ele",
"embankment" as "embankment",
"foot" as "foot",
"generator:source" as "generator:source",
"harbour" as "harbour",
"highway" as "highway",
"historic" as "historic",
"horse" as "horse",
"intermittent" as "intermittent",
"junction" as "junction",
"landuse" as "landuse",
"layer" as "layer",
"leisure" as "leisure",
"lock" as "lock",
"man_made" as "man_made",
"military" as "military",
"motorcar" as "motorcar",
"name" as "name",
tags->'name:de' as "name:de",
tags->'int_name' as "int_name",  
tags->'name:en' as "name:en",
"natural" as "natural",
"oneway" as "oneway",
"operator" as "operator",
"place" as "place",
"poi" as "poi",
convert_to_integer("population") as "population",
"power" as "power",
"power_source" as "power_source",
tags->'proposed' as "proposed",
"railway" as "railway",
"ref" as "ref",
"religion" as "religion",
"route" as "route",
tags->'ruins' as "ruins",
"service" as "service",
"shop" as "shop",
"sport" as "sport",
"surface" as "surface",
"toll" as "toll",
"tourism" as "tourism",
"tower:type" as "tower:type",
tags->'tracktype' as "tracktype",
"tunnel" as "tunnel",
"water" as "water",
"waterway" as "waterway",
"wetland" as "wetland",
"width" as "width",
"wood" as "wood",
way as "way",
z_order as z_order,
tags as "tags"
FROM planet_osm_point;

GRANT select ON view_osmde_point TO public;
DROP VIEW IF EXISTS view_osmde_polygon;
CREATE VIEW view_osmde_polygon AS
SELECT
osm_id,
"access" as "access",
"addr:housename" as "addr:housename",
"addr:housenumber" as "addr:housenumber",
"addr:interpolation" as "addr:interpolation",
"admin_level" as "admin_level",
"aerialway" as "aerialway",
"aeroway" as "aeroway",
"amenity" as "amenity",
"barrier" as "barrier",
"bicycle" as "bicycle",
"boundary" as "boundary",
"brand" as "brand",
"bridge" as "bridge",
"building" as "building",
tags->'capital' as "capital",
"construction" as "construction",
"covered" as "covered",
"culvert" as "culvert",
"cutting" as "cutting",
"denomination" as "denomination",
"disused" as "disused",
"embankment" as "embankment",
"foot" as "foot",
"generator:source" as "generator:source",
"harbour" as "harbour",
"highway" as "highway",
"historic" as "historic",
"horse" as "horse",
"intermittent" as "intermittent",
"junction" as "junction",
"landuse" as "landuse",
"layer" as "layer",
"leisure" as "leisure",
"lock" as "lock",
"man_made" as "man_made",
"military" as "military",
"motorcar" as "motorcar",
"name" as "name",
tags->'name:de' as "name:de",
tags->'int_name' as "int_name",  
tags->'name:en' as "name:en",
"natural" as "natural",
"oneway" as "oneway",
"operator" as "operator",
"place" as "place",
tags->'poi' as "poi",
convert_to_integer("population") as "population",
"power" as "power",
"power_source" as "power_source",
tags->'proposed' as "proposed",
"railway" as "railway",
"ref" as "ref",
"religion" as "religion",
"route" as "route",
tags->'ruins' as "ruins",
"service" as "service",
"shop" as "shop",
"sport" as "sport",
"surface" as "surface",
"toll" as "toll",
"tourism" as "tourism",
"tower:type" as "tower:type",
"tracktype" as "tracktype",
"tunnel" as "tunnel",
"water" as "water",
"waterway" as "waterway",
"wetland" as "wetland",
"width" as "width",
"wood" as "wood",
tags->'leaf_type' as "leaf_type",
way as "way",
way_area as way_area,
z_order as z_order,
tags as "tags"
FROM planet_osm_polygon;

GRANT select ON view_osmde_polygon TO public;
DROP VIEW IF EXISTS view_osmde_roads;
CREATE VIEW view_osmde_roads AS
SELECT
osm_id,
"admin_level" as "admin_level",
"boundary" as "boundary",
"highway" as "highway",
"name" as "name",
tags->'name:de' as "name:de",
tags->'int_name' as "int_name",
tags->'name:en' as "name:en",
"railway" as "railway",
"ref" as "ref",
"service" as "service",
"tunnel" as "tunnel",
z_order as z_order,
way as way,
"tags" as "tags"
FROM planet_osm_roads;

GRANT select ON view_osmde_roads TO public;