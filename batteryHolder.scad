//include <MCAD/boxes.scad>;
include <MCAD/shapes.scad>;
include <MCAD/regular_shapes.scad>;

batteryDiameter=18+1; // 1 for contacts
batteryLength=67;
wall=1.4;

rounded=1.5;

contactHoleRadius=0.5;
contactGap=3.5;

batteryCount=1;
cut=4;

centerCut=40;

velcroWidth=20;
velcroDepth=1.2;

difference() {
    // base
    roundedBox(batteryDiameter * batteryCount + wall * 2, batteryLength + wall * 2, batteryDiameter + wall, rounded, $fn=15);

    // base hole
    translate([0, 0, wall]) {
        roundedBox(batteryDiameter * batteryCount, batteryLength, batteryDiameter, rounded, $fn=15); }

    // contact holes
    translate([-batteryDiameter * (batteryCount - 1) * 0.5, wall, 0]) rotate([90, 0, 0])  {
        for (batteryId = [0 : batteryCount - 1]) {
            translate([batteryId * batteryDiameter, 0, 0]) {
                translate([contactGap/2,0,0]) {
                    cylinder(r=contactHoleRadius, batteryLength + 4 * wall, center=true); }
                translate([-contactGap/2,0,0]) {
                    cylinder(r=contactHoleRadius, batteryLength + 4 * wall, center=true); }
            }
        }
    }

    // empty center
    translate([0, 0, wall]) {
        cube([batteryDiameter * batteryCount + wall * 2, centerCut, batteryDiameter + wall], center=true); }
    
    // top cut
    translate([0, 0, batteryDiameter + wall - cut]) {
        cube([batteryDiameter * batteryCount + wall * 2, batteryLength + wall * 2, batteryDiameter + wall], center=true); }

    // velcro holes
    translate([-(batteryDiameter * batteryCount - velcroDepth) / 2, 0, 0]) {
        cube([velcroDepth, 20, 50], center=true); }
    translate([(batteryDiameter * batteryCount - velcroDepth) / 2, 0, 0]) {
        cube([velcroDepth, 20, 50], center=true); }
}