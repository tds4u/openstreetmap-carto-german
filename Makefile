osm-de.xml: *.mss project.mml
	carto project.mml > $@

project.mml: project.yaml
	python scripts/yaml2mml.py <project.yaml >project.mml
	