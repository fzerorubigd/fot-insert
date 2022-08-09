include <bit/boardgame_insert_toolkit_lib.2.scad>;

// determines whether lids are output.
g_b_print_lid = false;

// determines whether boxes are output.
g_b_print_box = true; 

// Focus on one box
g_isolated_print_box = "building_tiles_big_small"; 

// Used to visualize how all of the boxes fit together. 
g_b_visualization = f;          
        
// this is the outer wall thickness. 
//Default = 1.5mm
g_wall_thickness = 1.5;

// The tolerance value is extra space put between planes of the lid and box that fit together.
// Increase the tolerance to loosen the fit and decrease it to tighten it.
//
// Note that the tolerance is applied exclusively to the lid.
// So if the lid is too tight or too loose, change this value ( up for looser fit, down for tighter fit ) and 
// you only need to reprint the lid.
// 
// The exception is the stackable box, where the bottom of the box is the lid of the box below,
// in which case the tolerance also affects that box bottom.
//
g_tolerance = 0.15;

// This adjusts the position of the lid detents downward. 
// The larger the value, the bigger the gap between the lid and the box.
g_tolerance_detents_pos = 0.1;


g_lid_solid = t;
g_print_label = f;

// Guild of merchant explorer data 
// This can be set using make file

z_width = 290;
z_height = 290;

z_border = g_wall_thickness;
z_border_twice = z_border * 2;

sq_tile_height = 57;
sq_tile_width = 42;
sq_tile_depth = 37;

small_tile_width = sq_tile_width+z_border_twice;
big_tile_width = sq_tile_height+z_border_twice;
tile_height = sq_tile_width*3+z_border_twice*2;
tile_depth = sq_tile_depth+z_border_twice;

block_width = 20;

w1 = 22; 
w2 = w1*2;
w3 = w1*3;

res_height = z_border+w3+z_border+w2+z_border+w3+z_border;
res_width = z_border+w1+z_border;
tmpl_width = z_border+w2+z_border;

mask_width = 33; 
mask_height = 42;
die_height = 23.5;

masks_width = 3*mask_width+2*z_border_twice;
masks_height = z_border+mask_height+z_border+die_height+z_border;
masks_depth = tile_depth/2;

player_width = 3*mask_width+2*z_border_twice;
player_height = z_height - tile_height - masks_height;

resource_width = z_width - big_tile_width - small_tile_width;
resource_height = (z_height - res_width - res_width - tmpl_width - tmpl_width)/2 ;
fp_full = 37;

 lid_attr = [ LID_SOLID_B, g_lid_solid];

data =
[
    [   "pyramid_tiles",
        [
            [ BOX_SIZE_XYZ, [small_tile_width, tile_height, tile_depth] ],
            [ BOX_STACKABLE_B, false],
            [ BOX_LID,
               [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Pyramid Tiles"],
                            [ LBL_SIZE,     7],
                            [ ROTATION,     90 ],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ],

            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width, sq_tile_width, sq_tile_depth ],],
                    [POSITION_XY,                           [0,0]],
                    //[CMP_PEDESTAL_BASE_B, t],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width, sq_tile_width, sq_tile_depth ],],
                    [POSITION_XY,                           [0,sq_tile_width+z_border]],
                    //[CMP_PEDESTAL_BASE_B, t],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ],
           [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width, sq_tile_width, sq_tile_depth ],],
                    [POSITION_XY,                           [0,2*(sq_tile_width+z_border)]],
                    //[CMP_PEDESTAL_BASE_B, t],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ], 
        ]
    ],[   "worship_tiles",
        [
            [ BOX_SIZE_XYZ, [big_tile_width, tile_height, tile_depth] ],
            [ BOX_STACKABLE_B, false],
            [ BOX_LID,
                  [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Worship Tiles"],
                            [ LBL_SIZE,     7],
                            [ ROTATION,     90 ],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_height, sq_tile_width, sq_tile_depth ],],
                    [POSITION_XY,                           [0,0]],
                    //[CMP_PEDESTAL_BASE_B, t],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_height, sq_tile_width, sq_tile_depth ],],
                    [POSITION_XY,                           [0,sq_tile_width+z_border]],
                    //[CMP_PEDESTAL_BASE_B, t],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ],
           [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_height, sq_tile_width, sq_tile_depth ],],
                    [POSITION_XY,                           [0,2*(sq_tile_width+z_border)]],
                    //[CMP_PEDESTAL_BASE_B, t],
                    [ CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ], 
        ]
    ],[   "building_tiles_small_2x",
        [
            [ BOX_SIZE_XYZ, [res_width, res_height, tile_depth] ],
            [ BOX_STACKABLE_B, false],
            [ BOX_LID,
                 [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Building Tiles"],
                            [ LBL_SIZE,     7],
                            [ ROTATION,     90 ],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w1, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [0,0]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w1, w2, sq_tile_depth ],],
                    [POSITION_XY,                           [0,w3+z_border]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ],
           [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w1, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [0,w3+w2+z_border_twice]],
                ]
            ], 
        ]
    ],[   "building_tiles_big",
        [
            [ BOX_SIZE_XYZ, [tmpl_width, res_height, tile_depth] ],
            [ BOX_STACKABLE_B, false],
            [ BOX_LID,
                 [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Building Tiles"],
                            [ LBL_SIZE,     7],
                            [ ROTATION,     90 ],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w2, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [0,0]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w2, w2, sq_tile_depth ],],
                    [POSITION_XY,                           [0,w3+z_border]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ],
           [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w2, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [0,w3+w2+z_border_twice]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ], 
        ]
    ],[   "building_tiles_big_small",
        [
            [ BOX_SIZE_XYZ, [tmpl_width, res_height, tile_depth] ],
            [ BOX_STACKABLE_B, false],
            [ BOX_LID,
                                  [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Building Tiles"],
                            [ LBL_SIZE,     7],
                            [ ROTATION,     90 ],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w2, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [0,0]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w1, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [res_width/2,w3+z_border]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f ,t, t] ],
                ]
            ],  
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w1, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [-res_width/2+z_border,w3+z_border]],
                    [ CMP_CUTOUT_BOTTOM_B, true ],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w1, w3, sq_tile_depth ],],
                    [POSITION_XY,                           [res_width+4*z_border_twice-z_border,w3+z_border]],
                    [ CMP_CUTOUT_BOTTOM_B, true ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ w2, w2, sq_tile_depth ],],
                    [POSITION_XY,                           [0,w3+w3+z_border_twice]],
                    [CMP_CUTOUT_SIDES_4B, [ f, f, t, t ] ],
                ]
            ],
        ]
        ],[   "mask_bonus_tiles_top",
        [
            [ BOX_SIZE_XYZ, [masks_width, masks_height, masks_depth] ],
            [ BOX_LID,
                                  [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Masks and Bonus"],
                            [ LBL_SIZE,     7],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ mask_width , mask_height , sq_tile_depth/2 ],],
                    [POSITION_XY,                           [0,0]],
                    [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ], [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ mask_width, mask_height , sq_tile_depth/2 ],],
                    [POSITION_XY,                           [mask_width +z_border,0]],
                    [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ], [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ mask_width , mask_height , sq_tile_depth/2 ],],
                    [POSITION_XY,                           [(mask_width + z_border)*2,0]],
                    [ CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ], [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ masks_width -z_border_twice, die_height , sq_tile_depth/2 ],],
                    [POSITION_XY,                           [0,mask_height+z_border]],
                ]
            ], 
        ]
    ],[   "others_bottom",
        [
            [ BOX_SIZE_XYZ, [masks_width, masks_height, masks_depth] ],
            [ BOX_STACKABLE_B, true],
            [ BOX_NO_LID_B, true],
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ fp_full , fp_full , sq_tile_depth/3 ],],
                    [POSITION_XY,                           [z_border_twice,0]],
                    [CMP_PEDESTAL_BASE_B, t],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B,                   t],
                    //[CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ fp_full , die_height, sq_tile_depth/2],],
                    [POSITION_XY,                           [z_border_twice,fp_full+z_border]],
                    [CMP_PEDESTAL_BASE_B, t],
                    [CMP_SHAPE, ROUND],
                    [CMP_SHAPE_VERTICAL_B,                   t],
                    //[CMP_CUTOUT_SIDES_4B, [ t, f, f, f ] ],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ masks_width-fp_full-6*z_border , masks_height-z_border_twice, sq_tile_depth/2],],
                    [POSITION_XY,                           [fp_full+4*z_border,0]],
                    [ CMP_CUTOUT_BOTTOM_B, true ],
                ]
            ],
    ]],[   "players",
        [
            [ BOX_SIZE_XYZ, [player_width, player_height, tile_depth] ],
            [ BOX_LID,
                                  [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Player Tokens"],
                            [ LBL_SIZE,     7],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ], [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width , sq_tile_width , 10 ],],
                    [POSITION_XY,                           [0,0]],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width-2*z_border_twice , sq_tile_width-2*z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [z_border_twice,z_border_twice]],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width , sq_tile_width , 10 ],],
                    [POSITION_XY,                          [player_width-z_border_twice-sq_tile_width,0] ]],
                ]
            ,[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width-2*z_border_twice , sq_tile_width-2*z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [player_width-sq_tile_width,z_border_twice]],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width , sq_tile_width , 10 ],],
                    [POSITION_XY,                           [0,player_height-z_border_twice-sq_tile_width]],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width-2*z_border_twice , sq_tile_width-2*z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [z_border_twice,player_height-sq_tile_width]],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width , sq_tile_width , 10 ],],
                    [POSITION_XY,                          [player_width-z_border_twice-sq_tile_width,player_height-z_border_twice-sq_tile_width] ]],
                ]
            ,[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width-2*z_border_twice , sq_tile_width-2*z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [player_width-sq_tile_width,player_height-sq_tile_width]],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ player_width-2*sq_tile_width-2*z_border_twice , player_height-z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [CENTER,0]],
                    [ CMP_CUTOUT_BOTTOM_B, true ],
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ sq_tile_width, sq_tile_width , 10 ],],
                    [POSITION_XY,                           [CENTER,CENTER]],
                ]
            ]]],[   "resources",
        [
            [ BOX_SIZE_XYZ, [resource_width, resource_height, tile_depth] ],
            [ BOX_LID,
                                                   [lid_attr,
               [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Resource Cubes"],
                            [ LBL_SIZE,     7],
                            [ ENABLED_B, g_print_label ],
                        ]
            ],]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ (resource_width-2*z_border_twice)/3, resource_height-z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [0,0]],
                    [CMP_SHAPE, FILLET],
                    [CMP_FILLET_RADIUS, 20],
                    [CMP_SHAPE_ROTATED_B, t]
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ (resource_width-2*z_border_twice)/3, resource_height-z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [(resource_width-2*z_border_twice)/3+z_border,0]],
                    [CMP_SHAPE, FILLET],
                    [CMP_FILLET_RADIUS, 20],
                    [CMP_SHAPE_ROTATED_B, t]
                ]
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ (resource_width-2*z_border_twice)/3, resource_height-z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [2*(resource_width-2*z_border_twice)/3+z_border_twice,0]],
                    [CMP_SHAPE, FILLET],
                    [CMP_FILLET_RADIUS, 20],
                    [CMP_SHAPE_ROTATED_B, t]
                ]
            ]]],[   "optional_spacer",
        [
            [ BOX_SIZE_XYZ, [resource_width, resource_height, tile_depth] ],[ BOX_LID,
                 [lid_attr],
            ],[ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ resource_width-z_border_twice, resource_height-z_border_twice , tile_depth ],],
                    [POSITION_XY,                           [0,0]],[ CMP_CUTOUT_BOTTOM_B, true ],
                ]
            ]]]
];


MakeAll();