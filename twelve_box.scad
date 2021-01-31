$fn=50;
s=10;
g=0.5;

module base(r=0)
{
    difference()
    {
        cube([s-r*2,s*7-r*2,s-r*2],center=true);
     
        translate([0,-s*2,-(s+g)/2])
        cube(s+g+r*2,center=true);
        
        translate([0,s*2,(s+g)/2])
        cube(s+g+r*2,center=true);
    }
}

module A(i=-1,r=0)
{
    minkowski()
    {
        difference()
        {
            base(r);
            
            translate([(s+g)/2*i,0,0])
            cube(s+g+r*2,center=true);
        }
        sphere(r);
    }
}

A(1);
//A(1, 1); // print * 10
//A(-1, 1); // print * 2