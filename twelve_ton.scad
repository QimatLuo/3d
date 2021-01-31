use <utils.scad>;
$fn=50;
s=10;
g=0.5;

module C(l,r=1)
{
    difference()
    {
        kube([s,s*l,s],r=-r);
        
        translate([0,0,s/2])
        kube([s+g,s+g,s+g],r=r);
    }
}

module key(r=1)
{
    difference() {
        C(3,r);
        
        translate([s/2,0,0])
        kube(s+g,r=r);
    }
}
module center(r=1)
{
    difference()
    {
        kube([s,s*7,s],r=-r);
        
        translate([0,0,s/2-g/2])
        kube([s+g,s*5,s],r=r);
        
        translate([s/2,0,0])
        kube(s+g,r=r);
    }
}

module side(r=0)
{
    translate([s,0,0])
    C(5,r);
    translate([s*2,0,0])
    C(3,r);

    translate([-s,0,0])
    C(5,r);
    translate([-s*2,0,0])
    C(3,r);
}

module full(r=0)
{
    mink(r) center(r);
    rotate([0,90,90])
    mink(r) center(r);
    rotate([90,0,-90])
    mink(r) center(r);
    rotate([0,90,0])
    mink(r) side(r);
    rotate([90,0,0])
    mink(r) side(r);
    rotate([180,0,90])
    mink(r) side(r);
}

full(0);

//mink() key(); // print * 1
//mink() C(3); // print * 5
//mink() C(5);; // print * 6
//center(1); // print * 3