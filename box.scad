x = 112;
y = 112;
z = 25;
t = 1;
d = 5;
e = d*sqrt(3)/2;

box();
triangleWallSquare();
translate([0,(e+t)/2,0])
gap();

module box() {
    difference(){
        cube([x,y,z], true);
        translate([0,0,t/2])
        cube([x-t,y-t,z], true);
    }
}

module gap(){
    translate([0,0,t/4])
    cube([x-t*2-(d/2+d/4)*2,e,z-t/2],true); 
    for (i = [1,-1]) {
        translate([((x-d)/2-t)*-i,0,0])
        rotate(90+90*i)
        triangle();
    }   
}

module triangle() {
    translate([0,0,t/4])
    cylinder(d=d,h=z-t/2,$fn=3,center=true);
}

module triangleWall(){    
    for (i = [0:y/2/(e+t)-1]) {
        for (j = [1,-1]) {
            translate([x/-2+t/2+d/4,(e+t)*i*j,0])
            triangle();
        }
    }
}

module triangleWallSquare(){
    for (i = [0:4]) {
        rotate(90*i)
        triangleWall();
    }
}
