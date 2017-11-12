translate([0,0,2]) rotate([180]) EuroPanel("121", 9);

  font = ".SF Compact Display:style=Bold";
  labelFontSize = 6.2;

module EuroPanel(label, hp) {

  sideOffset = 8;
  panelWidth = hp*5.08;

  translate([panelWidth,0,0]) scale([-1,1,1]) Support();
  Support();
  
  
  difference() {
    cube([hp*5.08, 128.5, 2]);
      
    translate([3,118,1])  {
        linear_extrude(height=2, convexity=4) text(label, size=9, font=font);
    }
    translate([7.5,3]) MountingHole();
    translate([panelWidth - 7.5, 128.5 - 3]) MountingHole();

    translate ([sideOffset, 115, 0]) union() {
        translate([0,-92.71,0]) KnobHole();
        translate([0,-76.2,0]) KnobHole();
        translate([0,-58.42,0]) KnobHole();
        translate([0,-41.91,0]) KnobHole();
        translate([0,-24.13,0]) KnobHole();
        translate([0,-7.62,0]) KnobHole();
    }
    translate([10,112.5,1]) {
        label("in",-7.62);
        label("in",-24.13);
        label("cv",-41.91);
        label("cv",-58.42);
        label("Q",-76.2);
        label("F",-92.71);
    }

    translate ([sideOffset+20, 115, 0]) union() {
        translate([0,-92.71,0]) JackHole();
        translate([0,-76.2,0]) JackHole();
        translate([0,-58.42,0]) JackHole();
        translate([0,-41.91,0]) JackHole();
        translate([0,-24.13,0]) JackHole();
        translate([0,-7.62,0]) JackHole();
    }
    translate([44,104,1]) {
        label("12",-76.2);
        label("24",-92.71);
    }

  }
/*
    color("green", .3)
        translate([panelWidth - sideOffset, 14.25,2])
            cube([1,100,50]);
            */
}

module label(text, y){
      translate([0,y])   {
          linear_extrude(height=2, convexity=4) text(text, size=labelFontSize, font=font, halign="right");
      }
}

module KnobHole() { translate([12.5,0,-.5]) cylinder(h=3, d=8, $fn=12); }

module JackHole() { translate([6,0,-.5]) cylinder(h=3, d=6.5, $fn=12); }

module LEDHole() { translate([10,0,-.5]) cylinder(h=3, d=5.3, $fn=12); }

module MIDIHole() { translate([10.5,0,-.5]) cylinder(h=3, d=18.5, $fn=24); }

module Support() {
    translate([0,10,0])
    rotate([-90,0,0])
  linear_extrude(108.5)
    polygon([[0,0], [0,2], [1.5,5], [3,5], [3,0]]);
}


module MountingHole() {
  hull() {
    translate([-2,0,-.5]) cylinder(h=3, r=1.6, $fn=12);
    translate([2,0,-.5]) cylinder(h=3, r=1.6, $fn=12);
  }
}

echo(version=version());
