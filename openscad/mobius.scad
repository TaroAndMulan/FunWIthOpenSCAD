
module moebius(r = 1, w = 1, t = 1) {
    // CHANGE STEP HERE FOR MORE MODIFICATION
    step = 10;
    for(u = [0 : step : 360]) {
        // for each u calculate 2 endpoints [x1,y1,z2] and [x2,y2,z2]
        x1 = r * (1-(1/2)*cos(u/2))*cos(u);
        x2 = r * (1+(1/2)*cos(u/2))*cos(u);
        y1 = r * (1-(1/2)*cos(u/2))*sin(u);
        y2 = r * (1+(1/2)*cos(u/2))*sin(u);
        z1 = -w * sin(u/2)/2;
        z2 = w * sin(u/2)/2;
        // connect 2 endpoints using hulls 
        hull(){
            //translate([x1,y1,z1]) sphere(r=t,$fn=100);
           //ranslate([x2,y2,z2]) sphere(r=t,$fn=100);
            translate([x1,y1,z1]) linear_extrude(height=t,twist=100) square([t,t]);
            translate([x2,y2,z2]) linear_extrude(height=t,twist=100) square([t,t]);
        }
    }
}


//EDIT MOEBIUS HERE

moebius(r=30,w=30,t=5);
//moebius(r=30,w=45,t=5);
