s = 10;
g = 0.5;

module C(l) {
    difference() {
        cube([s,s*l,s],center=true);
        
        translate([0,0,s/2])
        cube([s+g,s+g,s+g],center=true);
    }
}

module center() {
    difference() {
        cube([s,s*7,s], center=true);
        
        translate([0,0,s/2-g/2])
        cube([s+g,s*5,s], center=true);
        
        translate([s/2,0,0])
        cube(s+g, center=true);
    }
}

module side() {
    translate([s,0,0])
    C(5);
    translate([s*2,0,0])
    C(3);

    translate([-s,0,0])
    C(5);
    translate([-s*2,0,0])
    C(3);
}

module full(){
    center();
    rotate([0,90,90])
    center();
    rotate([90,0,-90])
    center();
    rotate([0,90,0])
    side();
    rotate([90,0,0])
    side();
    rotate([180,0,90])
    side();
}

module key(l) {
    difference() {
        C(3);
        
        translate([s/2,0,0])
        cube(s+g,center=true);
    }
}

full();

//key(); // print * 1
//C(3); // print * 5
//C(5); // print * 6
//center(); // print * 3
