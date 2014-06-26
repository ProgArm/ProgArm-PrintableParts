ringInnerDiameter = 20.5; //19.5;
ringThickness = 1.65;
ringOuterDiameter = ringInnerDiameter + ringThickness * 2;
ringWidth = 8;

cutHeight = 8;
cutterWidth = 10;

innerWallHeight = 0.8;
innerWallWidth = cutterWidth;

difference() {
    cylinder(h=ringWidth, r=ringOuterDiameter / 2, $fn=100); // outer cylinder     
    cylinder(h=ringWidth * 69, r=ringInnerDiameter / 2, $fn=100); // inner cylinder
    
    translate([-cutterWidth/2, 0, 0]) {
        cube([cutterWidth, 100, ringWidth]);
    }

}
translate([-innerWallWidth/2, ringInnerDiameter/2 - 0.7, 0]) { // use maths?
    cube([innerWallWidth, innerWallHeight, ringWidth]);
}
