
module frustum(base,top,height){
    linear_extrude(height=height,scale=top/base) square([base,base],center=true);
}


module grip(length,thickness){
    union(){
        translate([0,0,length/2-0.1]) frustum(thickness*1.5,thickness,length*0.5);
        cube([thickness,thickness,length],center=true);
        mirror([0,0,-1]) translate([0,0,length/2-0.1]) frustum(thickness*1.5,thickness,length*0.5);
    }
    
}
module laser(w,h,t){
    translate([0,0,-t/2]) linear_extrude(height=t) polygon([[-w/2,0],[-w*3,-w],[0,h],[w*3,-w],[w/2,0]]);
}


module zsaber(grip_length,grip_width,laser_length,laser_thickness){
    union(){
        color("white") grip(grip_length,grip_width);
        color(c=[0,0.8,0],alpha=0.5) translate([0,0,grip_length*0.7]) rotate([90,0,0]) laser(grip_width,laser_length,laser_thickness);
    }    
}

// EDIT YOUR SABER HERE
zsaber(grip_length=20,grip_width=6,laser_length=50,laser_thickness=2);