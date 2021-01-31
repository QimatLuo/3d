use <utils.scad>;
$fn=50;
s=10;
g=0.5;

module base(r=0)
{
    difference()
    {
        kube([s,s*7,s],r=-r);
     
        translate([0,-s*2,-(s+g)/2])
        kube(s+g,r=r);
        
        translate([0,s*2,(s+g)/2])
        kube(s+g,r=r);
    }
}

module A(r=1,i=1)
{
    difference()
    {
        base(r);
        
        translate([(s+g)/2*i,0,0])
        kube(s+g,r=r);
    }
}

module B(r=1)
{
    A(r,i=-1);
}

A(0);

//mink() A(); // print * 10
//mink() B(); // print * 2