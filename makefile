data/raw/countries/ne_110m_admin_0_countries.shp:
	mkdir -p data/raw/countries
	wget -P data/raw https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip
	unzip data/raw/ne_110m_admin_0_countries.zip -d data/raw/countries
	rm data/raw/ne_110m_admin_0_countries.zip

data/final/countries.geojson: data/raw/countries/ne_110m_admin_0_countries.shp
	mkdir -p data/final
	python -m scripts.make_countries_geojson
