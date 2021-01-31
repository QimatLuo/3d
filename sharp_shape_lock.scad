use <utils.scad>;
$fn=50;
s=14.5;
g=0.5;

module A(r=1)
{
    difference()
    {
        kube([s,s*4.5,s],r=-r);

        translate([0,0,s/2])
        kube(s+g,r=r);
        
        translate([s/2,s+g,0])
        kube(s+g,r=r);
        
        translate([s/2,-s-g,0])
        kube(s+g,r=r);
    }
}

A(0);

//mink() A(); // print * 12