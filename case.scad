$fn = 20;
x = 85;
y = 65;
z = 25;
t = 2;

lcd_x = ceil(71.53);
lcd_y = ceil(24.22);
led_x = 5+0.75;
btn_x = ceil(6.38);
usb_y = 11.;
usb_z = 8.5;

main();
/*
color("red")
translate([0,0,z-t*2])
top();

color("blue")
translate([-t,0,t])
wall();

color("blue")
translate([x,-t/6,t])
power();
*/


module top() {
    difference() {
        b = 0.2;
        cube([x-b,y,t-b*2]);
        
        translate([7,10,0])
        cube([lcd_x,lcd_y,t]);
        
        translate([12,50,0])
        cylinder(h=t, d=btn_x);
        
        translate([35,50,0])
        cylinder(h=t, d=led_x);
        
        translate([76,50,0])
        cylinder(h=t, d=led_x);
    }
    w = ceil(2.78);
    translate([7+lcd_x,10,0-w])
    cube([t,lcd_y,w]);
}

module main() {
    b = 0.2;
    difference() {

        box();
        
        translate([-x/2,0,z-t*2-b])
        cube([x*2,y,t+b]);
        
        translate([-t,0,t])
        cube([t+b,y,z]);
        
        translate([x-b,0,t])
        cube([t+b,y,z]);
    }
    /*
    translate([x-b,t*2,z-t])
    cube([t+b,t,t]);
    translate([x-b,y-t*3,z-t])
    cube([t+b,t,t]);
    translate([-t,t*2,z-t])
    cube([t+b,t,t]);
    translate([-t,y-t*3,z-t])
    cube([t+b,t,t]);
    */
}

module box() {
    difference() {
        b = 0.2;
        translate([-t*2,-t,0])
        cube([x+t*4,y+t*2,z]);
        
        translate([-x/2,t/2,t])
        cube([x*2,y-t,z]);
    }
    
    translate([0,0,z-t])
    difference() {
        translate([-t*2,0,0])
        cube([x+t*4,y,t]);
        
        translate([-t*2,(y-(y-t*6))/2,0])
        cube([x*2,y-t*6,t]);
    }
}

module wall() {
    cube([t-0.2,y-0.2,z-t]);
}

module power() {
    difference() {
        wall();
        
        translate([0,y/2-usb_y/2,t*2])
        cube([t,usb_y,usb_z]);
    }
}