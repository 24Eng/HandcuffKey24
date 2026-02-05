// Measured dimensions
drawingFile = "KeyHolder_2026-02-05_01.dxf";

// Adjustable dimensions
bodyThickness = 3.65;
shellThickness = 2.0;
lockLength = 15;
lockHeight = 0.5;

// Calculated dimensions
inchesToMillimeters = 1/25.4;
millimetersToInches = 25.4;
hexagonOutToInRatio = 0.866;
hexagonInToOutRatio = 1 / hexagonOutToInRatio;


// Visibility variables
whistleBodyVis = 1;
$fn = 120;
//$vpr = [55, 0, 25];
//$vpd = 100;
//$vpt = [0,0,0];
cutawayView = 3;
alphaValue = 1.0;

if(whistleBodyVis){
    translate([0,0,(bodyThickness)]){
        if(cutawayView == 1 || cutawayView < 1){
            linear_extrude(height = shellThickness){
                color("SteelBlue", alphaValue){
                    import(drawingFile, layer = "TopCover", convexity = 20);
                }
            }
        }
        if(cutawayView == 2 || cutawayView < 1){
            color("CornflowerBlue", alphaValue*1.0){
                linear_extrude(height = shellThickness){
                    import(drawingFile, layer = "KeyCover", convexity = 20);
                }
            }
        }
    }
    if(cutawayView == 3 || cutawayView < 1){
        color("Orchid", alphaValue){
            translate([0,0,0]){
                linear_extrude(height = bodyThickness){
                    import(drawingFile, layer = "body", convexity = 20);
                }
            }
        }
        color("Khaki", alphaValue){
            translate([0,0,-shellThickness/1]){
                linear_extrude(height = shellThickness){
                    import(drawingFile, layer = "BottomCover", convexity = 20);
                }
            }
            // Add a small bump inside to hold the key in place
            translate([3/2 + lockHeight/1,0,0]){
                hull(){
                    translate([0,lockLength/2,0]){
                        sphere(lockHeight);
                    }
                    translate([0,-lockLength/2,0]){
                        sphere(lockHeight);
                    }
                }
            }
        }
    }
}




