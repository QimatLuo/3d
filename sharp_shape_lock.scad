s=15;
g=1;


difference() {
    cube([s,s*4.5,s],center=true);

    translate([0,0,s/2])
    cube(s+g,center=true);
    
    translate([s/2,s+g,0])
    cube(s+g,center=true);
    
    translate([s/2,-s-g,0])
    cube(s+g,center=true);
}