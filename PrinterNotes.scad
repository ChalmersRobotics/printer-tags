// Parametric model of dymo compatible magnetic notes.
// Originally designed for notes to indicate material and nozzle type on 3D-printers but nothing stops them from begin used elsewhere.

/*[ Misc variables ]*/
// Render resolution
resolution = 100;

// Enter the length of the dymo printed note here. [mm]
noteLength = 50;


/*[ Magnet dimensions ]*/
// Enter the diameter of the magnet here. [mm]
magnetDiameter = 5.0;

// Enter the thickness of the magnet here. [mm]
magnetThickness = 2.8;


/*[ Slicer and printer setup ]*/
// Enter your printed layer-height here. [mm]
layerHeight = 0.2; //

// Enter the linewidth of your slicing profile here. [mm]
wallThickness = 0.45;

// (Advanced) Enter your infill/perimeter overlap value here. [%]
overlap = 25;
wallThicknessComp = wallThickness * ((100+overlap)/100);


linear_extrude(height = layerHeight*2) {
    square([noteLength, 12], center = true);
}

translate([0, 0, layerHeight*2]){
    linear_extrude(height = magnetThickness) {
        difference() {
            square([noteLength, 12], center = true); square([noteLength - wallThicknessComp*2, 12 - wallThicknessComp*2], center = true);
        }
    }
}

translate([0, 0, layerHeight + magnetThickness/2]) {
    difference() {
        cylinder(h = magnetThickness , r1 = magnetDiameter + 1, r2 = magnetDiameter/2 + 1, center = true); cylinder(h = magnetThickness*2 , r = magnetDiameter/2, center = true);
    }
}

$fn = resolution;