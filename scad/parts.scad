module wkLiPo238() {
    rotate(90) {
        color("Slate") hull() {
            translate([0, 6.5, 0]) rotate([0, 90, 0]) cylinder(r=3.4, h=32);
            translate([0, -6.5, 0]) rotate([0, 90, 0]) cylinder(r=3.4, h=32);
        }
        color("Red") translate([1, 8.5, -1]) rotate([0, -90, 0]) cylinder(r1=0.75, r2=0, h=20);
        color("Black") translate([1, 8.5, 1]) rotate([0, -90, 0]) cylinder(r1=0.75, r2=0, h=20);
    }
}

module capacitor() {
    difference() {
        color("DodgerBlue") {
            translate([0, 0, 3]) cylinder(r=3, h=7, $fn=20);
            translate([0, 0, 1]) cylinder(r=3, h=1, $fn=20);
            translate([0, 0, 2]) cylinder(r=2.7, h=1, $fn=20);
        }
        color("Silver") {
            translate([0, 0, 9.7]) cylinder(r=1.8, h=1, $fn=20);
            translate([0, 0, 0.3]) cylinder(r=2.5, h=1, $fn=20);
        }
    }
    color("DarkGray") {
        translate([1, 1, -1]) cylinder(r=0.3, h=2.5, $fn=4);
        translate([-1, -1, -1]) cylinder(r=0.3, h=2.5, $fn=4);
    }
}

module HK15318() {
    translate([-4, -12, -20]) {
        color("Snow") {
            difference() {
                cube([8, 16, 14.4]);
                translate([-1, 0, 13]) rotate([20, 0, 0]) cube([10, 8, 4]);
            }
            translate([0, 0, 10]) {
                difference() {
                    intersection() {
                        translate([0.1, -3.5, 0]) cube([7.8, 23, 0.5]);
                        union() {
                            translate([4, 2.5, 0]) cylinder(r=6, h=0.25);
                            translate([4, 13.5, 0]) cylinder(r=6, h=0.25);
                        }
                    }
                    translate([4, -1.5, -0.5]) cylinder(r=0.75, h=1);
                    translate([4, 17.5, -0.5]) cylinder(r=0.75, h=1);
                }
            }
            translate([4, 12, 14.4]) cylinder(r=4, h=2.6);
            translate([4, 8, 14.4]) cylinder(r=2.2, h=3);
        }
        color("MintCream") translate([4, 12, 17]) difference() {
            cylinder(r=1.5, h=3);
            cylinder(r=0.5, h=4);
        }
    }
}

module HK15318_single_horn() {
    translate([0, 0, -2]) color("Snow") {
        difference() {
            union() {
                cylinder(r=2.7, h=3.3);
                hull() {
                    translate([0, 0, 2.4]) cylinder(r=1.5, h=0.9, $fn=8);
                    translate([0, 11 , 2.4]) cylinder(r=1.5, h=0.9, $fn=8);
                }
            }
            translate([0, 0, 3.1]) cylinder(r=1.5, h=0.3, $fn=6);
            translate([0, 0, -0.1]) cylinder(r=0.5, h=3.3, $fn=6);
            translate([0, 0, -0.1]) cylinder(r=1.5, h=2.1, $fn=6);
            translate([0, 11 , 2.2]) cylinder(r=0.35, h=1.2);
            translate([0, 9 , 2.2]) cylinder(r=0.35, h=1.2);
            translate([0, 7 , 2.2]) cylinder(r=0.35, h=1.2);
        }
    }
}

module HK15318_double_horn() {
    translate([0, 0, -2]) color("Snow") {
        difference() {
            union() {
                cylinder(r=2.7, h=3.3);
                hull() {
                    translate([0, -9, 2.4]) cylinder(r=1.5, h=0.9, $fn=8);
                    translate([0, 9 , 2.4]) cylinder(r=1.5, h=0.9, $fn=8);
                }
            }
            translate([0, 0, 3.1]) cylinder(r=1.5, h=0.3, $fn=6);
            translate([0, 0, -0.1]) cylinder(r=0.5, h=3.3, $fn=6);
            translate([0, 0, -0.1]) cylinder(r=1.5, h=2.1, $fn=6);
            translate([0, 9 , 2.2]) cylinder(r=0.35, h=1.2);
            translate([0, 7 , 2.2]) cylinder(r=0.35, h=1.2);
            translate([0, -9 , 2.2]) cylinder(r=0.35, h=1.2);
            translate([0, -7 , 2.2]) cylinder(r=0.35, h=1.2);
        }
    }
}

module arduino_pro_mini() {
    difference() {
        union() {
            color("SeaGreen") cube([17.8, 33.0, 1.0]);
            color("Gold") {
                for (y = [0:11]) {
                    translate([1.27, 1.27 + 2.54 * y, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                    translate([17.8 - 1.27, 1.27 + 2.54 * y, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                }
                for (x = [0:5]) {
                    translate([2.54 + 2.54 * x, 33.0 - 1.27, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                }
                for (y=[3, 4, 7, 8]) {
                    translate([17.8 - 2.54 - 1.27, 2.54 * y, 0.5]) {
                        cylinder(r=1, h=1.2, center=true, $fn=8);
                    }
                }
            }
            color("DimGray") {
                translate([8.9, 9.1, 0.5]) rotate(45) cube([7, 7, 1]);
                translate([8.2, 22, 1]) cube([1.6, 3.8, 1]);
            }
            color("Orange") {
                translate([12, 23, 1]) cube([2, 4, 1]);
                translate([17.8 - 14, 23, 1]) cube([2, 4, 1]);
            }
            translate([8.9, 3.5, 0.5]) {
                rotate(22.5) color("Silver") cylinder(r=3, h=0.75, $fn=8);
                rotate(22.5) color("LightGray") cylinder(r=2.5, h=1, $fn=8);
                color("Gold") cylinder(r=1.2, h=1.5, $fn=8);
            }
        }
        color("Gold") {
            for (y = [0:11]) {
                translate([1.27, 1.27 + 2.54 * y, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
                translate([17.8 - 1.27, 1.27 + 2.54 * y, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
            }
            for (x = [0:5]) {
                translate([2.54 + 2.54 * x, 33.0 - 1.27, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
            }
            for (y=[3, 4, 7, 8]) {
                translate([17.8 - 2.54 - 1.27, 2.54 * y, 0.5]) {
                    cylinder(r=0.4, h=1.4, center=true, $fn=8);
                }
            }
        }
    }
}
