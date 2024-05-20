 
 // create a block pointing in [x,y,z] direction
 module block(x,y,z,t,w){
    b = acos(z); // inclination angle
    c = atan2(y,x);     // azimuthal angle
    rotate([0, b, c])
        linear_extrude(height=0.1)
        square([t,w],$fn=100,center=true);
}

function unit(v) = v/norm(v); 

module medusa(s,w,h){
    for (t=[0:0.5:360]){
            // parametric equation 
            r = [sin(t)+2*sin(2*t),cos(t)-2*cos(2*t),-1*sin(3*t)];
            // direction vector normalize (dx/dt i + dy/dt j + dz/dt k)
            v = unit([cos(t)+4*cos(2*t),-sin(t)+4*sin(2*t),-3*cos(3*t)]);

            color("Goldenrod",0.9) scale([s,s,s]) translate([r[0],r[1],r[2]]) block(v[0],v[1],v[2],w,h);
    }
}


medusa(5,0.8,1.0);