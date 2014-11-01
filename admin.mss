@admin-boundaries1: #1A1A1A;
@admin-boundaries2: #333333;
@admin-boundaries3: #4D4D4D;
@admin-boundaries_other: #8B7E66;

#admin-01234[zoom >= 4] {
  [admin_level = '2'],[admin_level = '3'] {
    line-width: 0.75;
    line-color: @admin-boundaries1;
    [zoom >= 7] {
      line-width: 1.5;
      line-color: @admin-boundaries2;
    }
    [zoom >= 8] {
      line-width: 3;
    }
    [zoom >= 10] {
      line-color: @admin-boundaries3;
      [admin_level = '2'] {
        line-width: 6;
      }
      [admin_level = '3'] {
        line-width: 5;
        line-dasharray: 4,2;
      }
      opacity: 0.4;
    }
  }
  [admin_level = '4'][zoom >= 5] {
    line-width: 0.6;
    line-color: @admin-boundaries3;
    line-dasharray: 4,3;
    line-clip: false;
    [zoom >= 8] {
      line-width: 1;
    }
    [zoom >= 10] {
      line-width: 3;
    }
    opacity: 0.4;
  }
}

#admin-5678[zoom >= 11] {
  [admin_level = '5'] {
    line-width: 3;
    line-color: @admin-boundaries3;
    line-dasharray: 6,3,2,3,2,3;
    line-clip: false;
  }
  [admin_level = '6'] {
    line-width: 2.5;
    line-color: @admin-boundaries3;
    line-dasharray: 6,3,2,3;
    line-clip: false;
  }
  [zoom >= 12] {
    [admin_level = '7'], [admin_level = '8'] {
      line-width: 2;
      line-color: @admin-boundaries3;
      line-dasharray: 5,2;
      line-clip: false;
    }
  }
  opacity: 0.6;
}

#admin-other[zoom >= 13] {
  [admin_level = '9'],
  [admin_level = '10'] {
    line-color: @admin-boundaries_other;
    line-width: 2;
    line-dasharray: 2,3;
    line-clip: false;
  }
  opacity: 0.6;
}

#admin-text[zoom >= 16] {
  text-name: "[name]";
  text-face-name: @book-fonts;
  text-fill: @admin-boundaries1;
  text-placement: line;
  text-halo-radius: 1.0;
  text-placement: line;
  text-dy: -10;
}

#nature-reserve-boundaries {
  [zoom >= 7] {
    ::fill [zoom < 13] {
      opacity: 0.05;
      polygon-fill: green;
    }
    ::line {
      opacity: 0.15;
      line-color: green;
      line-width: 1.5;
//      line-dasharray: 4,2;
      [zoom >= 10] {
        line-width: 3;
//        line-dasharray: 6,2;
        line-join: bevel;
      }
    }
  }
  [way_area > 200000000][zoom >= 8][zoom < 12] {
    text-name: "[name]";
    text-size: 8 + @text_correction;
    text-fill: #9c9;
    text-face-name: @bold-fonts;
    text-halo-radius: 1;
    text-wrap-width: 14;
    text-placement: interior;
    [zoom >= 11] { text-size: 11 + @text_correction; }
  }
}