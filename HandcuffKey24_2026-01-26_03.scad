// Measured dimensions
outerDiameter = 3.8;
innerDiameter = 2.55;
flagThickness = 1.4;
flagLength = 1.9;
flagDepth = 2.25;

// Adjustable dimensions
stalkLength = 10;
handleWidth = 0;
flagRotation = 0;

// Calculated dimensions
inchesToMillimeters = 1/25.4;
millimetersToInches = 25.4;
hexagonOutToInRatio = 0.866;
hexagonInToOutRatio = 1 / hexagonOutToInRatio;
wallThickness = (outerDiameter/2 - innerDiameter/2);
echo("wallThickness", wallThickness);

// Visibility variables

$fn = 36;
//$vpr = [55, 0, 25 + 360*$t];
//$vpd = 100;
$vpt = [0,0,-4.5];

color("CornflowerBlue", alpha = 0.0){
    rotate([180,0,0]){
        difference(){
            translate([0,0,0]){
                outerShell();
                translate([0,0,stalkLength]){
                    handle();
                }
            }
            translate([0,0,0]){
                keyShaftHollow();
            }
        }
    }
}

module outerShell(){
    cylinder(stalkLength, d = outerDiameter, center=false);
    rotate([0,0,flagRotation]){
        translate([flagLength/2 + wallThickness/2 + innerDiameter/2,0,flagDepth/2 + 0.0001]){
            cube([flagLength + wallThickness, flagThickness, flagDepth], center=true);
        }
    }
}

module keyShaftHollow(){
    cylinder(flagDepth*4, d = innerDiameter, center=true);
}

module handle(){
    rotate([0,90,0]){
        cylinder(outerDiameter, d = handleWidth, center=true);
    }
}