x = 25;
y = 25;
z = 0.5;
d = x/2;

difference(){
    cube([x,y,z],true);

    translate([0,y/2,0])
    rotate(90)
    cylinder(d=d+2,h=z,center=true,$fn=3);
}
translate([x/2,0,0])
rotate(180)
cylinder(d=d,h=z,center=true,$fn=3);