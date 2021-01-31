$fn=50;
s=14.5;
g=0.5;

module A(r=0)
{
    difference()
    {
        cube([s-r*2,s*4.5-r*2,s-r*2],center=true);

        translate([0,0,s/2])
        cube(s+g+r*2,center=true);
        
        translate([s/2,s+g,0])
        cube(s+g+r*2,center=true);
        
        translate([s/2,-s-g,0])
        cube(s+g+r*2,center=true);
    }
}

minkowski()
{
    r=1;
    A(r);
    sphere(r);
}

// print * 12