d=5;
s=1.5;
h=50;
$fn=100;

module axis() {
    difference() {
        cylinder(h=h,d=d,center=true);

        translate([0,0,h/2])
        cylinder(h=h/2-d,r=s,center=true);
        
        translate([0,0,-h/2])
        cylinder(h=h/2-d,r=s,center=true);
    }

    intersection() {
        cube([h/2,s,h/2],center=true);
        rotate([0,45,0])
        cube([h/2,s,h/2],center=true);
    }
}

axis();
rotate([90,90,0])
axis();
rotate([90,0,90])
axis();