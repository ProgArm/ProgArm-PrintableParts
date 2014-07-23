ringInnerDiameter = 20.5;
//ringOuterDiameter = 0;
ringThickness = 3; //1.65;
ringWidth = 8;

cutHeight = 8;
cutterWidth = 10;

// TODO refactoring

innerWallHeight = 0.8;
innerWallWidth = cutterWidth;
for (i = [ringInnerDiameter-1.5:1:ringInnerDiameter+1.5]) {
	translate([i*15 - 300,i%3*30,0])
	difference() {
		cylinder(h=ringWidth, r=(i + ringThickness * 2) / 2, $fn=100); // outer cylinder     
		cylinder(h=ringWidth * 69, r=i / 2, $fn=100); // inner cylinder

		translate([-cutterWidth/2, 0, 0]) {
			//cube([cutterWidth, 100, ringWidth]);
		}
	}
}
//translate([-innerWallWidth/2, ringInnerDiameter/2 - 0.7, 0]) { // use maths?
//    cube([innerWallWidth, innerWallHeight, ringWidth]);
//}
