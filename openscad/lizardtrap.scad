
module frustum(base,top,height){
    linear_extrude(height=height,scale=top/base) square([base,base],center=true);
}

module hollow_frustum(base,top,height){
    difference(){
        frustum(base,top,height);
        translate([0,0,-0.1]) frustum(base-0.5,top-0.5,height+0.2);
    }
}

module box(l,s,d,h){
    
    color("#eeeee4") difference(){
        cube([s,s,l],center=true);
        translate([0,0,0.5])cube([s-0.5,s-0.5,l],center=true);
    }
    color("#e28743") translate([0,0,l/2+0.1]) rotate([180,0,0])  hollow_frustum(s,h,d);
}


module bar(l,s,n){
    for (z=[0+0.5:(l/n):l-0.5]){
         translate([0,s/2,z-l/2]) cube([s-0.5,0.7,0.1],center=true);
    }
}


module trap(length,width,inner_width,depth,n_bar){
     difference(){
        box(length,width,depth,inner_width);
        bar(length,width,n_bar);
        translate([width/2,0,-length/3.1]) cube([width*0.5,width*0.5,length*0.3],center=true);
     }
 }
 
 //EDIT TRAP HERE
trap(length=10,width=5,inner_width=2,depth=5,n_bar=50);
      


   