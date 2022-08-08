# No change after this line is required, unless you know what you are doing, or don't. who am I to tell you. 
SPLIT = $(subst -, ,$@)
COMPONENT = $(word 2, $(SPLIT))
FILE = fot.scad
TARGET = fot-insert.zip

all: pyramid_tiles worship_tiles building_tiles_small_2x building_tiles_big building_tiles_big_small mask_bonus_tiles_top others_bottom players resources optional_spacer
	@echo Done!

zip: clean all
	zip $(TARGET) dist/*.stl

pyramid_tiles: box-pyramid_tiles lid-temple_tpyramid_tilesiles
worship_tiles: box-worship_tiles lid-worship_tiles
building_tiles_small_2x: box-building_tiles_small_2x lid-building_tiles_small_2x  
building_tiles_big: box-building_tiles_big lid-building_tiles_big
building_tiles_big_small: box-building_tiles_big_small lid-building_tiles_big_small
mask_bonus_tiles_top: box-mask_bonus_tiles_top lid-mask_bonus_tiles_top
others_bottom: box-others_bottom
players: box-players lid-players
resources: box-resources lid-resources
optional_spacer: box-optional_spacer lid-optional_spacer

dist: 
	mkdir -p dist

lid-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "g_lid_solid=true" -o dist/$(COMPONENT)-lid-solid.stl $(FILE)
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "g_lid_solid=false" -o dist/$(COMPONENT)-lid.stl $(FILE)

box-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=false" -D "g_b_print_box=true" -o dist/$(COMPONENT)-box.stl $(FILE)

clean:
	rm -f dist/*.stl $(TARGET)
