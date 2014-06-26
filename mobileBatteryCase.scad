emptyW=38+2;
emptyH=60;
emptyD=5;

wall=1;
thickWall=wall * 2;
cut=2;

caseW=emptyW + wall * 4;
caseH=emptyH + wall * 2;
caseHExtra=3;
caseD=emptyD + wall * 2;

// extra block for pins
blockH=caseHExtra + wall;
blockW=13.5;
blockD=5;
blockSledgeMultiplier=3;
blockSledge2Multiplier=1.5;

// velcro
holderGap=20;
holderHeight=2 * wall;
holderWall=wall * 1.5;
holderWidth=holderGap + holderWall * 2;

pinLength=6;
pinTurnLength=6;
pinWidth=1;
pinDepth=5;

difference() {
    union() {
	difference() {
	    translate([(emptyH - caseH) / 2, (emptyW - caseW) / 2, (emptyD - caseD) / 2]) { // case
		cube([caseH + caseHExtra, caseW, caseD]); }    
	    union() { // hole for the battery
		translate([0, emptyD / 2, emptyD / 2]) rotate([0, 90]) {
		    cylinder(h=60, r=emptyD / 2, $fn=30); }
		translate([0, emptyW - emptyD / 2, emptyD / 2]) rotate([0, 90]) {
		    cylinder(h=60, r=emptyD / 2, $fn=30); }
		translate([0, emptyD / 2]) {
		    cube([emptyH, emptyW - emptyD, emptyD]); }
	    }

	    // holes for velcro
	    translate([0, -wall, cut - holderHeight / 2]) {
		translate([emptyH / 4 - holderWidth / 2, 0, -250]) cube([holderGap, wall, 500]);
		translate([emptyH / 4 * 3 - holderWidth / 2, 0, -250]) cube([holderGap, wall, 500]);
	    }
	    translate([0, emptyW, cut - holderHeight / 2]) {
		translate([emptyH / 4 - holderWidth / 2, 0, -250]) cube([holderGap, wall, 500]);
		translate([emptyH / 4 * 3 - holderWidth / 2, 0, -250]) cube([holderGap, wall, 500]);
	    }
	    
	    translate([-50, -50, cut]) cube([300, 300, 300]); // cut top
	}

        // block for wires
	translate([emptyH, emptyW]) rotate([0, 0, -90]) {
	    translate([0, 0]) difference() {
		cube([blockW, blockH, blockD]); }}
        
        
/*
	// block for wires
	translate([emptyH, emptyW]) rotate([0, 0, -90]) {
	    translate([-wall * 2, 0]) difference() {
		cube([blockW, blockH, blockD]);
		// space for soldering
		translate([3, 2]) {
		    cube([4, 50, 50]); }
		translate([10, 2]) {
		    cube([4, 50, 50]); }
	    }

	    // sledges // TODO change to MCAD triangles
	    translate([blockW-wall * 2 + blockD / 2 / sqrt(3) *  blockSledgeMultiplier, 0, wall * 2]) rotate([-90, 0]) {
		scale([blockSledgeMultiplier, 1, 1]) cylinder(h=wall + caseHExtra, r=blockD / sqrt(3), $fn=3); }
	    translate([-wall * 2, -blockD / 2 / sqrt(3) *  blockSledge2Multiplier, wall * 2]) rotate([-90, 0, -90]) {
		scale([blockSledge2Multiplier, 1, 1]) cylinder(h=wall * 2, r=blockD / sqrt(3), $fn=3); }
	} */
    }

    // holes for wires
    translate([emptyH, emptyW]) rotate([0, 0, -90]) {
        translate([4.5, 0, 2]) {
            rotate([90, 0, 0]) {
                scale([1, 2, 1]) {
                    cylinder(h=15, r=1, $fn=30, center=true); }}}
	translate([8.5, -3, 2]) {
            rotate([90, 0, 0]) {
                scale([1, 2, 1]) {
                    cylinder(h=15, r=1, $fn=30, center=true); }}}}
    

    /*
    // space for pins
    translate([emptyH, emptyW]) rotate([0, 0, -90]) {
	translate([4, -3, -0.5]) {
	    cube([pinWidth, pinLength, pinDepth]);
	    translate([-pinTurnLength + pinWidth, pinLength - pinWidth, 0]) {
		cube([pinTurnLength, pinWidth, pinDepth]); }
	}
	translate([8, -3, -0.5]) {
	    cube([pinWidth, pinLength, pinDepth]);
	    translate([0, pinLength - pinWidth, 0]) {
		cube([pinTurnLength, pinWidth, pinDepth]); }
	}
    }*/

    // extra holes
    for(i = [ [ 0,  -wall,  -25],
              [0, emptyW, -25],
              [caseH + caseHExtra - 3 * wall, -wall, -25],
              [caseH + caseHExtra - 3 * wall, emptyW, -25] ]) {
	translate(i) {
		     cube([1, 1, 50]); }
    }
}
