use <parts.scad>

base = 39/2;


module leg(hip, knee, ankle) {
    HK15318_single_horn();
    rotate(hip) {
        rotate(90) HK15318();
        translate([16, -8, -16]) rotate([90, 180, 90]) {
            HK15318();
            rotate(knee - 90) {
                HK15318_single_horn();
                translate([0, 18, -1]) rotate(180) {
                    HK15318_single_horn();
                    rotate(ankle) {
                        HK15318();
                        translate([7, -13.5, -9.7]) rotate([0, 180, 90]) HK15318_double_horn();
                    }
                }
            }
        }
    }
}

module body() {
    color("Orange") translate([0, 0, 0.6]) difference() {
        cube([38.3, 38.2, 1.2], center=true);
        translate([16.5, 16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-16.5, 16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([16.5, -16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-16.5, -16.5, 0]) cylinder(r=1.2, h=2, center=true);
        translate([11.42, 11.43, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-11.42, 11.43, 0]) cylinder(r=1.2, h=2, center=true);
        translate([11.42, -11.43, 0]) cylinder(r=1.2, h=2, center=true);
        translate([-11.42, -11.43, 0]) cylinder(r=1.2, h=2, center=true);
    }
    translate([1.27 * 13, -2.54 * 3.5, 1.5]) rotate([0, 0, 90])
        arduino_pro_mini();
    translate([-13.5, 13.5, 1]) capacitor();
    color("WhiteSmoke") {
        translate([2.54 * 5.5, 2.54 * 4, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * 2.5, 2.54 * 4, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * 1, 2.54 * 4, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * -0.5, 2.54 * 4, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * -2, 2.54 * 4, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * -3.5, 2.54 * 4, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * -3, 2.54 * -7, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * -1.5, 2.54 * -7, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * 0, 2.54 * -7, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * 1.5, 2.54 * -7, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * 3, 2.54 * -7, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
        translate([2.54 * 4.5, 2.54 * -7, 1]) cube([2.54, 2.54 * 2, 2.54 * 2]);
    }
    translate([2.54 * -6, 2.54 * -7, 10]) {
        color("Silver") cube([2.54, 2.54 * 2, 2.54 * 3]);
        color("DarkRed") {
            translate([0, 2.54, 0.1]) cylinder(r=1.8, h=2.54 * 2);
            translate([0, 2.54, 2.54 * 2]) sphere(r=1.8);
        }
        color("Silver") {
            translate([1.27, 1.27, -10])  cylinder(r=0.3, h=12);
            translate([1.27, 1.27 * 2, -10])  cylinder(r=0.3, h=12);
            translate([1.27, 1.27 * 3, -10])  cylinder(r=0.3, h=12);
        }
    }
    rotate(90) translate([0, -16, -3.8]) wkLiPo238();
    translate([-2.54, 2.54 * 6, -2.54 * 2]) {
        color("Silver") cube([2.54 * 3, 2.54 * 2, 2.54 * 2]);
        color("SteelBlue") translate([2.54, 2.54 * 2, 1.27]) cube([2.54 * 1, 2.54 * 1, 2.54 * 1]);
    }
}

module robot() {
    translate([0, 0, 40]) {
        translate([base, -base, -1.5]) rotate(45) leg(0, 0, 45);
        mirror([0, 1]) translate([base, -base, -1.5]) rotate(45) leg(0, 0, 45);
        mirror([1, 0]) translate([base, -base, -1.5]) rotate(45) leg(0, 0, 45);
        mirror([1, 0]) mirror([0, 1]) translate([base, -base, -1.5]) rotate(45) leg(0, 0, 45);
        body();
    }
}

robot();