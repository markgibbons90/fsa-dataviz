import os
import geopandas as gp


def make_countries_geojson():
    """Turns data/raw/ne_110m_admin_0_countries.shp into geojson file."""
    current_dir = os.path.abspath(os.path.dirname(__file__))
    shp_path = os.path.join(current_dir, "..", "data/raw/countries/ne_110m_admin_0_countries.shp")

    df = gp.read_file(shp_path)
    # Keep only the useful columns
    df = df[[
        "CONTINENT",
        "ECONOMY",
        "FORMAL_EN",
        "NAME",
        "NAME_EN",
        "REGION_UN",
        "geometry",
    ]]

    print(len(df))
    print(df.iloc[0])

    out_path = os.path.join(current_dir, "..", "data/final/countries.geojson")
    df.to_file(out_path, driver="GeoJSON")

if __name__ == "__main__":
    make_countries_geojson()
