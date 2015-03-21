use <../parts.scad>

module leg(hip, knee, ankle, explode) {
    SG90_single_horn();
    translate([0, 0, explode]) SG90_horn_screw();
    translate([0, 0, -explode]) rotate(hip - 90) {
        rotate(-90) SG90();
        translate([12.75, -12 - explode, -23.75]) rotate([90, 180, 90]) {
            SG90();
            translate([0, 0, explode]) rotate(knee) {
                SG90_single_horn();
                translate([0, 0, explode]) SG90_horn_screw();
                translate([17.6, 0, 0]) {
                    translate([0, 0, 6 - explode]) rotate([0, 180, 0])
                        SG90_double_horn();
                    translate([-6, 0, 5 - explode * 2]) rotate([0, 180, 0])
                        SG90_horn_screw();
                    translate([-12, 0, 5 - explode * 2]) rotate([0, 180, 0])
                        SG90_horn_screw();
                    translate([6, 0, 5 - explode * 2]) rotate([0, 180, 0])
                        SG90_horn_screw();
                    translate([12, 0, 5 - explode * 2]) rotate([0, 180, 0])
                        SG90_horn_screw();
                }
                translate([35.2, 0, 0]) rotate([0, 0, 180]) {
                    SG90_single_horn();
                    translate([0, 0, explode]) SG90_horn_screw();
                    translate([0, 0, -explode]) rotate(ankle) {
                        SG90();
                        translate([-3.1 - explode, -20, -15])
                            rotate([-90, 0, 90]) {
                                SG90_double_horn();
                        }
                    }
                }
            }
        }
    }
}

module body() {
    color("Chocolate") translate([0, 0, 0]) difference() {
        translate([-19.15, -19.15, -0.8]) cube([38.3 + 2.54, 38.3, 1.6]);
        translate([16.5, 16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-16.5, 16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([16.5, -16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-16.5, -16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([11.42, 11.43, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-11.42, 11.43, 0]) cylinder(r=1.2, h=2, center=true);
        translate([11.42, -11.43, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-11.42, -11.43, 0]) cylinder(r=1.2, h=2, center=true);
    }
}

module robot(explode) {
    translate([20.75, 20.75, -2.1 - explode]) rotate(-135) {
        leg(-20, 5, -12, explode);
    }
    translate([-20.75, -20.75, -2.1 - explode]) rotate(45) {
        leg(20, 5, -12, explode);
    }
    translate([20.75, -20.75, -2.1 - explode]) rotate(135) mirror([0, 1, 0]) {
        leg(0, -40, 10, explode);
    }
    translate([-20.75, 20.75, -2.1 - explode]) rotate(-45) mirror([0, 1, 0]) {
        leg(0, 5, 30, explode);
    }
    body();
    translate([16.5, 16.5, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
    translate([-16.5, 16.5, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
    translate([16.5, -16.5, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
    translate([-16.5, -16.5, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
    translate([11.2, 11.2, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
    translate([-11.2, 11.2, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
    translate([11.2, -11.2, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
    translate([-11.2, -11.2, 2.5]) rotate([0, 180, 0]) SG90_horn_screw();
}

translate([0, 0, 61]) robot(0);
translate([15, -15, 0]) color("DodgerBlue", 0.25) difference() {
    cube([120, 120, 0.1], center=true);
    rotate(-45) translate([100, 0, 0]) cube([200, 200, 0.2], center=true);
}