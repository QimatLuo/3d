h=57;
t=6;
s=14;
g=0.5;

module inside(a=0) {
    cube([s+a,s+a,h+a], center=true);
}
module outside() {
    difference() {
        translate([-(s-t)/2,-(s-t)/2,0])
        cube([s+(s-t),s+(s-t),h], center=true);
        scale([2,2,1])
        translate([s/4+g/4,s/4+g/4,0])
        inside(g);
    }
}

module cuts() {
    cube([s+g,s+g,s+g], center=true);
}

module cutt(xs) {
    cube([xs[0]+g,xs[1]+g,xs[2]+g], center=true);
}

module inside1() {
    difference() {
        inside();
        translate([t,0,-h/2+s/2+s])
        cuts();
        translate([t,-t,-h/2+s/2+s*2])
        cuts();
    }
}

module inside2() {
    difference() {
        inside();
        translate([t,0,-h/2+s/2+s])
        cuts();
        translate([0,-t,h/2-(s-t)/2-(s-t)+g])
        cutt([s,s,s-t]);
    }
}

module inside3() {
    difference() {
        inside();
        translate([t,0,h/2-(s+s-t)/2-t*2])
        cube([s+g,s+g,s+(s-t)+g], center=true);
    }
}

module outside1() {
    difference() {
        outside();
        translate([-(s-t),t,-h/2+s/2+s])
        cuts();
        translate([t,-(s-t),-h/2+(s-t)/2+s*3-(s-t)])
        cutt([s,s,s-t]);
    }
}

module outside2() {
    difference() {
        outside();
        translate([t,-(s-t),h/2-(s-t)/2-s-(s-t)+g])
        cutt([s,s,s-t]);
    }
}

module outside3() {
    difference() {
        outside();
        translate([-(s-t),t,-h/2+(s+s-t)/2+(s-t)+g])
        cutt([s,s,s+s-t]);
        translate([t,-(s-t),h/2-(s-t)/2-t*2])
        cutt([s,s,s-t]);
    }
}

module part1() {
    rotate([0,0,90])
    inside1();
    outside1();
}

module part2() {
    rotate([180, 0,0])
    inside2();
    outside2();
}

module part3() {
    inside3();
    outside3();
}

part1();
rotate([0,0,180])
rotate([-90,0,0])
translate([-t-g,1+g,g])
part2();
rotate([0,90,0])
rotate([0,0,180])
translate([-t-g*3,-t,t-g*2])
part3();
