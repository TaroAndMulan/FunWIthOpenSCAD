 
 // create a piece pointing in [x,y,z] direction
 module piece(x,y,z,thickness,width,length){
     
     // math for rotation 
    b = acos(z); 
    c = atan2(y,x);    
     
     // inner body
    color("Goldenrod",0.9) rotate([0, b, c])
        linear_extrude(height=length)
        square([thickness,width],$fn=100,center=true);
     
     // outer body
    color("yellow",0.9) rotate([0, b, c])
        cylinder(h=length*0.5,r=(thickness+width)/2,center=true,$fn=20);

     // red fur
    color("red") rotate([0, b, c])
        translate([0,0,length])
        linear_extrude(height=length,twist=180,slices=100)
        square([thickness,width],$fn=100,center=true);
}

function unit(v) = v/norm(v); 

module dragon(a,b,c){
    for (t=[0:5:360]){
            // parametric equation 
            r = [sin(t)+2*sin(2*t),cos(t)-2*cos(2*t),-1*sin(3*t)];
            // direction vector normalized (dx/dt i + dy/dt j + dz/dt k)
            v = unit([cos(t)+4*cos(2*t),-sin(t)+4*sin(2*t),-3*cos(3*t)]);

            translate([r[0],r[1],r[2]]) piece(v[0],v[1],v[2],a,b,c);
    }
}


// EDIT DRAGON HERE
dragon(a=1,b=0.1,c=2);

//This one also good
//dragon(a=0.5,b=0.1,c=1.5);


//dragon(a=1,b=1,c=1);
//dragon(a=1,b=2,c=3);
//dragon(a=1,b=0.8,c=0.5);
//dragon(a=1,b=0.5,c=0.8);

