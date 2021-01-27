id = 14;
fn = 8;
od = (id+2)/cos(180/fn);

module tri(pos) {
    b = 15;
    h = 15;
    w = 2;
    translate(pos)
    linear_extrude(height = w, center = true, convexity = 10, twist = 0)
    polygon(points=[[0,0],[h,0],[0,b]], paths=[[0,1,2]]);
}

module body () {
    union() {
        translate([0,0,-id/2])
        rotate([0,0,180/fn])
        cylinder(h = 38-id/2, d = od, $fn=fn);

        rotate([90,0,0])
        translate([0,-id/2,-id/2-1])
        rotate([0,0,180/fn])
        cylinder(h = 40.5, d = od, $fn=fn);

        rotate([0,90,0])
        translate([id/2,0,0])
        rotate([0,0,180/fn])
        cylinder(h = 37.7-id/2, d = od, $fn=fn);
        
        rotate(a=[90,0,0])
        tri([7,1,0]);
        
        rotate(a=[0,0,270])
        tri([7,7,-id/2]);
        
        rotate(a=[90,00,-90])
        tri([7,1,0]);
    }
}

module hole () {
    b = 2;
    union() {
        translate([0,0,38-13-22.25])
        cylinder(h = 22.25+b, d = id);

        rotate([90,0,0])
        translate([0,-id/2,-id/2-b])
        cylinder(h = 19.3+b, d = id);

        rotate([90,0,0])
        translate([0,-id/2,-id/2+(40.5-20.2)])
        cylinder(h = 20.2+b, d = id);

        rotate([0,90,0])
        translate([id/2,0,-id/2+(37.7-22.2)])
        cylinder(h = 22.2+b, d = id);
        
        rotate([0,-90,0])
        translate([-id/2,0,-id/2+(37.7-22.2)])
        cylinder(h = 22.2+b, d = id);
        
    }
}

module corner() {
    difference() {
        body();
        hole();
    }
}

module center() {
    difference() {
        union() {
            body();
            
            rotate([0,-90,0])
            translate([-id/2,0,0])
            rotate([0,0,180/fn])
            cylinder(h = 37.7-id/2, d = od, $fn=fn);
            
            rotate(a=[90,0,180])
            tri([7,1,0]);
            
            rotate(a=[0,0,180])
            tri([7,7,-id/2]);
        }
        hole();
    }
}

center();