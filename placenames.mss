@placenames: #000;
@placenames-light: #777777;

.continent[place = 'continent'] {
  [zoom >= 0][zoom < 3] {
    text-name: "[name]";
    text-size: 9 + @text_correction;
    text-fill: #3d383d;
    text-face-name: @book-fonts;
    text-halo-radius: 1;
    text-wrap-width: 20;
    [zoom >= 4] {
      text-size: 10 + @text_correction;
    }
    [zoom = 6] {
      text-size: 11 + @text_correction;
    }
  }
}

.country[place = 'country'] {
  [zoom >= 2][zoom < 6] {
    text-name: "[name]";
    text-size: 9 + @text_correction;
    text-fill: #3d383d;
    text-face-name: @book-fonts;
    text-halo-radius: 1;
    text-wrap-width: 20;
    [zoom >= 4] {
      text-size: 10 + @text_correction;
    }
    [zoom = 6] {
      text-size: 11 + @text_correction;
    }
  }
}

#placenames-capital {
  [zoom >= 5][zoom < 15] {
    text-name: "[name]";
    text-size: 8 + @text_correction;
    text-fill: @placenames;
    text-face-name: @bold-fonts;
    text-halo-radius: 1;
    text-transform: uppercase;
    [zoom >= 6] {
      text-size: 9 + @text_correction;
    }
    [zoom >= 7] {
      text-size: 10 + @text_correction;
    }
    [zoom >= 8] {
      text-size: 11 + @text_correction;
    }
    [zoom >= 9] {
      text-size: 12 + @text_correction;
    }
    [zoom >= 10] {
      text-size: 14 + @text_correction;
    }
    [zoom >= 14] {
      text-fill: @placenames-light;
    }
  }
}

#placenames-medium {
  [zoom >= 5] {
    [population>=1000000][population<100000000],
    [population>=500000][population<1000000][zoom >= 6 ] {
      text-name: "[name]";
      text-size: 8 + @text_correction;
      text-fill: @placenames;
      text-face-name: @bold-fonts;
      text-halo-radius: 1;
      [zoom >= 7] {
        text-size: 9 + @text_correction;
      }
      [zoom >= 8] {
        text-size: 10 + @text_correction;
      }
      [zoom >= 9] {
        text-size: 11 + @text_correction;
      }
      [zoom >= 10] {
        text-size: 12 + @text_correction;
      }
      [zoom >= 11] {
        text-size: 13 + @text_correction;
      }
      [zoom >= 12] {
        text-face-name: @book-fonts;
        text-size: 14 + @text_correction;
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
      text-size: 9 + @text_correction;
      text-fill: @placenames;
      text-face-name: @bold-fonts;
      text-halo-radius: 1;
      [zoom >= 9] {
        text-size: 10 + @text_correction;
      }
      [zoom >= 10] {
        text-size: 11 + @text_correction;
      }
      [zoom >= 11] {
        text-face-name: @book-fonts;
        text-size: 12 + @text_correction;
      }
      [zoom >= 12] {
        text-size: 13 + @text_correction;
      }
      [zoom >= 13] {
        text-size: 14 + @text_correction;
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
      text-size: 9 + @text_correction;
      text-fill: @placenames;
      text-face-name: @bold-fonts;
      text-halo-radius: 1;
      text-wrap-width: 20;
      [zoom >= 10] {
        text-size: 10 + @text_correction;
      }
      [zoom >= 11] {
        text-face-name: @book-fonts;
        text-size: 11 + @text_correction;
      }
      [zoom >= 12] {
        text-size: 12 + @text_correction;
      }
      [zoom >= 13] {
        text-size: 13 + @text_correction;
      }
      [zoom >= 14] {
        text-size: 14 + @text_correction;
        text-fill: @placenames-light;
      }
    }
  }
  [zoom >= 9] {
    [population>=10000][population<50000],
    [place='town'] {
      text-name: "[name]";
      text-size: 9 + @text_correction;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1;
      text-wrap-width: 20;
      [zoom >= 11] {
        text-size: 10 + @text_correction;
      }
      [zoom >= 12] {
        text-size: 11 + @text_correction;
      }
      [zoom >= 13] {
        text-size: 12 + @text_correction;
      }
      [zoom >= 14] {
        text-size: 13 + @text_correction;
        text-fill: @placenames-light;
      }
      [zoom >= 15] {
        text-size: 14 + @text_correction;
      }
    }
  }
  [zoom >= 10] {
    [population>=5000][population<10000],
    [place='small_town'] {
      text-name: "[name]";
      text-size: 9 + @text_correction;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1;
      text-wrap-width: 20;
      [zoom >= 12] {
        text-size: 11 + @text_correction;
      }
      [zoom >= 13] {
        text-size: 12 + @text_correction;
      }
      [zoom >= 14] {
        text-size: 13 + @text_correction;
        text-fill: @placenames-light;
      }
      [zoom >= 15] {
        text-size: 14 + @text_correction;
      }
    }
  }
  [zoom >= 11] {
    [population>10000][population<5000] {
      text-name: "[name]";
      text-size: 9 + @text_correction;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-wrap-width: 20;
      text-halo-radius: 1;
      [zoom >= 12] {
        text-size: 10 + @text_correction;
      }
      [zoom >= 13] {
        text-size: 11 + @text_correction;
      }
      [zoom >= 14] {
        text-size: 12 + @text_correction;
        text-fill: @placenames-light;
      }
      [zoom >= 15] {
        text-size: 13 + @text_correction;
      }
    }
  }
  [zoom >= 12] {
      text-name: "[name]";
      text-size: 9 + @text_correction;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-wrap-width: 20;
      text-halo-radius: 1;
      [zoom >= 13] {
        text-size: 10 + @text_correction;
      }
      [zoom >= 14] {
        text-size: 11 + @text_correction;
        text-fill: @placenames-light;
      }
      [zoom >= 15] {
        text-size: 12 + @text_correction;
    }
  }
}

.state {
  [place = 'state'][zoom >= 5][zoom < 10] {
    text-name: "[ref]";
    text-size: 9 + @text_correction;
    text-fill: #375841;
    text-face-name: @oblique-fonts;
    text-halo-radius: 1;
    text-wrap-width: 20;
    [zoom >= 6] {
      text-name: "[name]";
      text-fill: #629471;
    }
    [zoom >= 7] {
      text-fill:#538562;
    }
    [zoom >= 8] {
      text-size: 11 + @text_correction;
      text-fill:#629b74;
      text-halo-fill:rgba(255,255,255,0.5);
    }
  }
}

#placenames-small::suburb {
  [place = 'suburb'][zoom >= 12] {
    text-name: "[name]";
    text-size: 10 + @text_correction;
    text-fill: @placenames;
    text-face-name: @book-fonts;
    text-halo-radius: 1;
    [zoom >= 14] {
      text-size: 13 + @text_correction;
      text-fill: @placenames-light;
    }
  }
}

#placenames-small::village {
  [place = 'village'],[place = 'large_village'] {
    [zoom >= 12] {
      text-name: "[name]";
      text-size: 9 + @text_correction;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1;
      [zoom >= 15] {
        text-size: 12 + @text_correction;
        text-fill: @placenames-light;
      }
    }
  }
}

#placenames-small::hamlet {
  [place = 'hamlet'],
  [place = 'locality'],
  [place = 'isolated_dwelling'],
  [place = 'farm'] {
    [zoom >= 14] {
      text-name: "[name]";
      text-size: 8 + @text_correction;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-radius: 1;
      [zoom >= 16] {
        text-size: 10 + @text_correction;
        text-fill: @placenames-light;
      }
    }
  }
}