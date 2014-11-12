// --- Parks, woods, other green things ---

@forest: #8dc56c;
@grass: #cfeca8; // also meadow, common, garden, village_green, conservation
@golf_course: #b5e3b5;
@park: #b6fdb6; // also recreation_ground
@wood: #aed1a0;
@vineyard: #abdf96;
@grassland: #c6e4b4;

// --- sports ---

@stadium: #3c9; // also sports_centre
@track: #74dcba;
@pitch: #8ad3af;

// --- "base" landuses ---

@residential: #e9e9e9;      // Lch(89,0,0)
@residential-line: #B9B9B9; // Lch(75,0,0)
@retail: #f1dada;
@retail-line: red;
@commercial: #efc8c8;
@commercial-line: #D1B2B0;
@industrial: #dfd1d6;
@industrial-line: #C6B3C3;
@railway: @industrial;
@railway-line: @industrial-line;
@farmland: #f2e9d7;
@farmland-line: #C8B69E;

@farmyard: #ead8bd;
@farmyard-line: #D1B48C;    // Lch(75,25,80)

// --- Other ----

@aerodrome: #ccc;
@allotments: #ead8bd;
@apron: #e9d1ff;
@attraction: #f2caea;
@barracks: #ffb5b5;
@campsite: #ccff99; // also caravan_site, picnic_site
@cemetery: #aacbaf; // also grave_yard
@construction: #9d9d6c;
@danger_area: pink;
@desert: #f2efc0;
@field: #660;
@garages: #996;
@heath: #d6d99f;
@parking: #f7efb7;
@playground: #ccfff1;
@power: #bbb;
@prison: #555;
@rest_area: #efc8c8; // also services
@sand: #ffdf88;
@school: #f0f0d8; // also university, college, hospital, kindergarten
@scrub: #b5e3b5;
@theme_park: #734a08;
@quarry: #c5c3c3;
@military: #f55;
@zoo: #a4f3a1;
@beach: #fff1ba;

#landcover {
 [feature = 'leisure_swimming_pool'][zoom >= 14] {
    polygon-fill: @water-color;
    line-color: saturate(darken(@water-color, 40%), 30%);
    line-width: 0.5;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'leisure_playground'][zoom >= 13] {
    polygon-fill: @playground;
    line-color: saturate(darken(@playground, 60%), 30%);
    line-width: 0.3;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'tourism_camp_site'],
  [feature = 'tourism_caravan_site'],
  [feature = 'tourism_picnic_site'] {
    [zoom >= 10] {
      polygon-fill: @campsite;
      line-color: saturate(darken(@campsite, 60%), 30%);
      line-width: 0.3;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'tourism_attraction'][zoom >= 10] {
    polygon-fill: @attraction;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_quarry'][zoom >= 10] {
    polygon-pattern-file: url('symbols/quarry2.png');
    line-width: 0.5;
    line-color: grey;
    [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
    [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
  }

  [feature = 'landuse_vineyard'] {
    [zoom >= 10][zoom < 13] {
      polygon-fill: @vineyard;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
    [zoom >= 13] {
      polygon-pattern-file: url('symbols/vineyard.png');
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
    }
  }

  [feature = 'landuse_orchard'][zoom >= 10] {
    polygon-pattern-file: url('symbols/orchard.png');
    polygon-pattern-alignment: global;
    [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
    [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
  }

  [feature = 'landuse_cemetery'],
  [feature = 'landuse_grave_yard'],
  [feature = 'amenity_grave_yard'] {
    [zoom >= 10][zoom < 14] {
      polygon-fill: @cemetery;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
    [zoom >= 14] {
      [religion = 'jewish'] { polygon-pattern-file: url('symbols/cemetery_jewish.18.png'); }
      [religion = 'christian'] { polygon-pattern-file: url('symbols/grave_yard.png'); }
      [religion = 'INT-generic'] { polygon-pattern-file: url('symbols/grave_yard_generic.png'); }
      [religion = 'jewish'],
      [religion = 'christian'],
      [religion = 'INT-generic'] {
        [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
        [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
      }
    }
  }

  [feature = 'landuse_residential'][zoom >= 10] {
    polygon-fill: @residential;
    [zoom >= 16] {
      line-width: .5;
      line-color: @residential-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_garages'][zoom >= 13] {
    polygon-fill: @garages;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'military_barracks'][zoom >= 10] {
    polygon-fill: @barracks;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_field'] {
    [zoom >= 10] {
      polygon-fill: @field;
      [zoom >= 14] {
        line-width: 0.3;
        line-opacity: 0.4;
        line-color: saturate(darken(@field, 40%), 20%);
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'military_danger_area'] {
    [zoom >= 9][zoom < 11] {
      polygon-fill: @danger_area;
      polygon-opacity: 0.3;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
    [zoom >= 11] {
      polygon-pattern-file: url('symbols/danger.png');
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
    }
  }

  [feature = 'landuse_meadow'],
  [feature = 'landuse_grass'] {
    [zoom >= 10] {
      polygon-fill: @grass;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'leisure_park'],
  [feature = 'leisure_recreation_ground'] {
    [zoom >= 10] {
      polygon-fill: @park;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'tourism_zoo'][zoom >= 10] {
    polygon-pattern-file: url('symbols/zoo.png');
    [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
    [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
  }

  [feature = 'leisure_common'][zoom >= 10] {
    polygon-fill: @grass;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'leisure_garden'][zoom >= 10] {
    polygon-fill: @grass;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'leisure_golf_course'][zoom >= 10] {
    polygon-fill: @golf_course;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_allotments'] {
    [zoom >= 10][zoom < 14] {
      polygon-fill: @allotments;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
    [zoom >= 14] {
      polygon-pattern-file: url('symbols/allotments.png');
      polygon-pattern-alignment: global;
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
    }
  }

  [feature = 'landuse_forest'],
  [feature = 'landuse_wood'],
  [feature = 'natural_wood'] {
    [zoom >= 8] {
      polygon-fill: @forest;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
	[zoom >= 14] {
      [wood = 'deciduous'] {
        polygon-pattern-file: url('symbols/wood_deciduous.png');
      }
      [wood = 'mixed'] {
        polygon-pattern-file: url('symbols/wood_mixed.png');
      }
      [wood = 'coniferous'] {
        polygon-pattern-file: url('symbols/wood_coniferous.png');
      }
      [wood != 'coniferous'][wood != 'mixed'][wood != 'deciduous'] {
        polygon-fill: @forest;
        polygon-gamma: 0;
      }
    }
  }

  [feature = 'landuse_farmyard'][zoom >= 10] {
    polygon-fill: @farmyard;
      [zoom >= 16] {
        line-width: 0.5;
        line-color: @farmyard-line;
        [name != ''] {
          line-width: 0.7;
        }
      }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_farm'],
  [feature = 'landuse_farmland'] {
    [zoom >= 10] {
      polygon-fill: @farmland;
      [zoom >= 16] {
        line-width: .5;
        line-color: @farmland-line;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'landuse_recreation_ground'],
  [feature = 'landuse_conservation'] {
    [zoom >= 10] {
      polygon-fill: @grass;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'landuse_village_green'][zoom >= 10] {
    polygon-fill: @grass;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_retail'][zoom >= 10] {
    polygon-fill: @retail;
    [zoom >= 16] {
      line-width: 0.5;
      line-color: @retail-line;
      [name != ''] {
        line-width: 0.7;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'landuse_industrial'][zoom >= 10],
  [feature = 'landuse_railway'][zoom >= 10] {
    polygon-fill: @industrial;
    [zoom >= 16] {
      line-width: .5;
      line-color: @industrial-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_railway'][zoom >= 10] {
    polygon-fill: @railway;
    [zoom >= 16][name != ''] {
      line-width: 0.7;
      line-color: @railway-line;
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'power_station'][zoom >= 10],
  [feature = 'power_generator'][zoom >= 10],
  [feature = 'power_sub_station'][zoom >= 13],
  [feature = 'power_substation'][zoom >= 13] {
      polygon-fill: @power;
      [zoom >= 12] {
        line-width: 0.4;
        line-color: darken(@power, 40%);
      }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_commercial'][zoom >= 10] {
    polygon-fill: @commercial;
    [zoom >= 16] {
      line-width: 0.5;
      line-color: @commercial-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'landuse_brownfield'],
  [feature = 'landuse_landfill'],
  [feature = 'landuse_construction'] {
    [zoom >= 10] {
      polygon-fill: @construction;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'natural_wood'] {
    [zoom >= 8] {
      polygon-fill: @wood;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'natural_desert'][zoom >= 10] {
    polygon-fill: @desert;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'natural_sand'][zoom >= 10] {
    polygon-fill: @sand;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'natural_heath'][zoom >= 10] {
    polygon-fill: @heath;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'natural_grassland'][zoom >= 10] {
    polygon-fill: @grassland;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'natural_scrub'] {
    [zoom >= 10][zoom < 14] {
      polygon-fill: @scrub;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
    [zoom >= 14] {
      polygon-pattern-file: url('symbols/scrub.png');
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
    }
  }

  [feature = 'amenity_university'],
  [feature = 'amenity_college'],
  [feature = 'amenity_school'],
  [feature = 'amenity_hospital'],
  [feature = 'amenity_kindergarten'] {
    [zoom >= 10] {
      polygon-fill: @school;
      [zoom >= 12] {
        line-width: 0.3;
        line-color: brown;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'amenity_parking'][zoom >= 10] {
    polygon-fill: @parking;
    [zoom >= 15] {
      line-width: 0.3;
      line-color: saturate(darken(@parking, 40%), 20%);
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'amenity_prison'][zoom >= 14] {
    polygon-pattern-file: url('symbols/amenity_prison.png');
    line-width: 0.3;
    line-color: @prison;
  }

  [feature = 'aeroway_apron'][zoom >= 10] {
    polygon-fill: @apron;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'aeroway_aerodrome'][zoom >= 10] {
    polygon-fill: @aerodrome;
    line-width: 0.2;
    line-color: saturate(darken(@aerodrome, 40%), 20%);
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.6;  }
  }

  [feature = 'natural_beach'][zoom >= 10] {
    polygon-pattern-file: url('symbols/beach.png');
    polygon-pattern-alignment: global;
    [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
    [way_pixels >= 64] { polygon-pattern-gamma: 0.6;  }
  }

  [feature = 'highway_services'],
  [feature = 'highway_rest_area'] {
    [zoom >= 10] {
      polygon-fill: @rest_area;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6;  }
    }
  }

  [feature = 'leisure_sports_centre'],
  [feature = 'leisure_stadium'] {
    [zoom >= 12] {
      polygon-fill: @stadium;
    }
  }

  [feature = 'leisure_track'][zoom >= 12] {
    polygon-fill: @track;
      line-width: 0.5;
      line-color: #888;
    
  }

  [feature = 'leisure_pitch'][zoom >= 12] {
    polygon-fill: @pitch;
      line-width: 0.5;
      line-color: #888;
    
  }
}

/* man_made=cutline */
#landcover-line {
  [zoom >= 14] {
    line-width: 3;
    line-join: round;
    line-cap: square;
    line-color: @land-color;
    [zoom >= 16] {
      line-width: 6;
    }
  }
}
/* entspr. osm.xml.de angepasst: */

#landuse-overlay {
  [landuse = 'military'][zoom >= 10]::landuse {
    polygon-pattern-file: url('symbols/military_red_hatch.png');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-width: 3;
    line-opacity: 0.329;
  }
  [leisure = 'nature_reserve'][zoom >= 10]::landuse {
    polygon-pattern-file: url('symbols/nature_reserve6a.png');
    line-color: #6c3; 
    //  Begrenzung NR-Polygon könnte auch durch admin-boundary #nature-reserve-boundaries gesteuert werden
    line-width: 0.5;
    [zoom >= 14] {
      polygon-pattern-file: url('symbols/nature_reserve6a.png');
      line-width: 1;
    }
  }
}

/* entspr. osm.xml.de angepasst: */
#cliffs {
  [natural = 'cliff'][zoom >= 13] {
    line-pattern-file: url('symbols/cliff.png');
    [zoom >= 15] {
      line-pattern-file: url('symbols/cliff2.png');
    }
  }
  [man_made = 'embankment'][zoom >= 15]::man_made {
    line-pattern-file: url('symbols/cliff.png');
  }
}

/* entspr. osm.xml.de angepasst: */
#area-barriers {
  [zoom >= 16] {
	[barrier != 'hedge'][barrier != 'line'] {
    line-color: #444;
    line-width: 0.4;
	}
    [barrier = 'hedge'],
    [natural = 'hedge'] {
      polygon-fill: #aed1a0;
    }
  }
}
/* eingefuegt*/
#line-barriers {
  [zoom < 15] {
    line-color:cyan;
    line-opacity:0.0;
  }
  [zoom >= 15] {
    line-color: grey;
    line-width: 3;
    line-opacity:0.1;
  }
}

/* entspr. osm.xml.de angepasst: */
.barriers {
  [zoom >= 16][barrier != 'hedge'][barrier != 'embankment'][barrier != 'line'] {
    line-width: 0.4;
    line-color: #444;
  }
  [barrier = 'embankment'][zoom >= 14] {
    line-width: 0.4;
    line-color: #444;
  }
  [barrier = 'hedge'],
  [natural = 'hedge'][zoom >= 16] {
    line-width: 3;
    line-color: #aed1a0;
  }
}
/* im dt. Stil nicht berücksichtigt: */
#tree-row {
  [natural = 'tree_row'][zoom >= 16] {
    line-pattern-file: url('symbols/tree_row.png');
    [zoom >= 17] {
      line-pattern-file: url('symbols/tree_row2.png');
    }
  }
}

#theme-park {
  [tourism = 'theme_park'][zoom >= 13] {
    line-color: @theme_park;
    line-width: 1.5;
    line-dasharray: 9,3;
    line-opacity: 0.6;
    [zoom >= 15] {
      line-width: 2.5;
    }
  }
}
