with (import <nixpkgs> {});

stdenv.mkDerivation rec {
  name = "fsa-dataviz-env";
  env = buildEnv {name = name; paths = buildInputs;};
  buildInputs = [
    gnumake
    wget
    unzip
    #(lowPrio gdal) # Since gdal is a dependency of python36Packages.gdal, this prevents collision
    python38Full
    python38Packages.gdal
    python38Packages.flask
    python38Packages.pandas
    python38Packages.geopandas
    nodejs
  ];
}
