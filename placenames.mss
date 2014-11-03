@placenames: #000;
@placenames-light: #777777;

.continent {
  [place = 'continent'][zoom >= 0][zoom < 3] {
    text-name: "[name]";
    text-size: 9;
    text-fill: #3d383d;
    text-face-name: @book-fonts;
    text-halo-radius: 1;
    text-wrap-width: 20;
    [zoom >= 4] {
      text-size: 10;
    }
    [zoom = 6] {
      text-size: 11;
    }
  }
}

.country {
  [place = 'country'][zoom >= 2][zoom < 6] {
    text-name: "[name]";
    text-size: 9;
    text-fill: #3d383d;
    text-face-name: @book-fonts;
    text-halo-radius: 1.5;
    text-wrap-width: 50;
    [zoom >= 4] {
      text-size: 10;
    }
    [zoom = 6] {
      text-size: 11;
    }
  }
}

#placenames-capital {
  [zoom >= 5][zoom < 15] {
    text-name: "[name]";
    text-size: 10;
    text-fill: @placenames;
    text-face-name: @bold-fonts;
    text-halo-radius: 1.5;
    text-wrap-width: 25;
    text-min-distance: 10;
    text-transform: uppercase;
    [zoom >= 6] {
      text-size: 12;
      text-wrap-width: 70;
    }
    [zoom >= 11] {
      text-size: 15;
      text-wrap-width: 90;
    }
  }
}

#placenames-medium {
  [zoom >= 5] {
    [population>=1000000][population<100000000],
    [population>=500000][population<1000000][zoom >= 6 ] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @bold-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 25;
      text-min-distance: 10;
      [zoom >= 7] {
        text-size: 10;
      }
      [zoom >= 8] {
        text-size: 11;
      }
      [zoom >= 9] {
        text-size: 12;
        text-wrap-width: 70;
      }
      [zoom >= 10] {
        text-size: 13;
      }
      [zoom >= 11] {
        text-size: 14;
        text-wrap-width: 90;
      }
      [zoom >= 12] {
        text-face-name: @book-fonts;
        text-size: 15;
      }
      [zoom >= 14] {
        text-fill: @placenames-light;
      }
    }
  }
  [zoom >= 7] {
    [population>=100000][population<500000],
    [place='city'],[place='metropolis'] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @bold-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 25;
      text-min-distance: 10;
      [zoom >= 8] {
        text-size: 10;
      }
      [zoom >= 9] {
        text-size: 11;
        text-wrap-width: 70;
      }
      [zoom >= 10] {
        text-size: 12;
      }
      [zoom >= 11] {
        text-face-name: @book-fonts;
        text-size: 13;
        text-wrap-width: 90;
      }
      [zoom >= 12] {
        text-size: 14;
      }
      [zoom >= 13] {
        text-size: 15;
      }
      [zoom >= 14] {
        text-fill: @placenames-light;
      }
    }
  }
  [zoom >= 8] {
    [population>=50000][population<100000],
    [place='large_town'] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @bold-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 50;
      text-min-distance: 10;
      [zoom >= 10] {
        text-size: 10;
      }
      [zoom >= 11] {
        text-face-name: @book-fonts;
        text-size: 11;
        text-wrap-width: 70;
      }
      [zoom >= 12] {
        text-size: 12;
      }
      [zoom >= 13] {
        text-size: 13;
      }
      [zoom >= 14] {
        text-size: 14;
        text-fill: @placenames-light;
        text-wrap-width: 90;
      }
    }
  }
  [zoom >= 9] {
    [population>=10000][population<50000],
    [place='town'] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 50;
      text-min-distance: 10;
      [zoom >= 11] {
        text-size: 10;
      }
      [zoom >= 12] {
        text-size: 11;
        text-wrap-width: 70;
      }
      [zoom >= 13] {
        text-size: 12;
      }
      [zoom >= 14] {
        text-size: 13;
        text-fill: @placenames-light;
        text-wrap-width: 90;
      }
      [zoom >= 15] {
        text-size: 14;
      }
    }
  }
  [zoom >= 10] {
    [population>=5000][population<10000],
    [place='small_town'] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 50;
      text-min-distance: 10;
      [zoom >= 11] {
        text-size: 10;
      }
      [zoom >= 12] {
        text-size: 11;
        text-wrap-width: 70;
      }
      [zoom >= 13] {
        text-size: 12;
      }
      [zoom >= 14] {
        text-size: 13;
        text-fill: @placenames-light;
      }
      [zoom >= 15] {
        text-size: 14;
        text-wrap-width: 90;
      }
    }
  }
  [zoom >= 11] {
    [population>1000][population<5000] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 70;
      text-min-distance: 10;
      [zoom >= 12] {
        text-size: 10;
      }
      [zoom >= 13] {
        text-size: 11;
      }
      [zoom >= 14] {
        text-size: 12;
        text-fill: @placenames-light;
        text-wrap-width: 90;
      }
      [zoom >= 15] {
        text-size: 13;
      }
    }
  }
  [zoom >= 12] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-wrap-width: 20;
      text-halo-radius: 1;
      [zoom >= 13] {
        text-size: 10;
      }
      [zoom >= 14] {
        text-size: 11;
        text-fill: @placenames-light;
      }
      [zoom >= 15] {
        text-size: 12;
    }
  }
}

.state {
  [place = 'state'][zoom >= 4][zoom < 9] {
    text-name: "[ref]";
    text-size: 9;
    text-fill: #375841;
    text-face-name: @oblique-fonts;
    text-halo-radius: 1.5;
    text-wrap-width: 0;
    [zoom >= 5] {
      text-name: "[name]";
      text-wrap-width: 50;
    }
    [zoom >= 7] {
      text-size: 11;
      text-wrap-width: 70;
    }    
  }
}

#placenames-small::suburb {
  [place = 'suburb'][zoom >= 12] {
    text-name: "[name]";
    text-size: 11;
    text-fill: @placenames;
    text-face-name: @book-fonts;
    text-halo-radius: 1.5;
    text-wrap-width: 70;
    text-min-distance: 10;
    [zoom >= 14] {
      text-size: 14;
      text-wrap-width: 90;
      text-fill: @placenames-light;
    }
  }
}

#placenames-small::village {
  [place = 'village'],[place = 'large_village'] {
    [zoom >= 12] {
      text-name: "[name]";
      text-size: 10;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 50;
      text-min-distance: 10;
      [zoom >= 15] {
        text-size: 13;
        text-fill: @placenames-light;
      }
    }
  }
}

#placenames-small::hamlet {
  [place = 'hamlet'],
  [place = 'locality'],
  [place = 'neighbourhood'],
  [place = 'isolated_dwelling'],
  [place = 'farm'] {
    [zoom >= 14] {
      text-name: "[name]";
      text-size: 9;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1.5;
      text-wrap-width: 50;
      text-min-distance: 10;
    }
    [zoom >= 16] {
      text-size: 12;
      text-wrap-width: 70;
      text-fill: @placenames-light;
    }
  }
}