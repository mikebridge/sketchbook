int maxX =750;
int maxY = 750;
size(maxX, maxY);
background(255);
strokeWeight(1.5);
smooth();

int centX = maxX / 2;
int centY = maxY / 2;
stroke(0, 30);
noFill();

float x, y;
int r = int(random(255));
int g = int(random(255));
int b = int(random(255));

int iter = 100;
int alpha = 100;

for (int i=0; i < iter; i++) {

  //  fill(c1);
  
  float lastx = -999;
  float lasty = -999;
  float radiusNoise = random(1);
  float radius = 50;
  //  stroke(random(20), random(50), random(70), 80); 

  int startangle = int(random(360));
  int endangle = 1440 + int(random(1440));
  int anglestep = 2 + int(random(3));
  for (float ang = startangle; ang <= endangle; ang += anglestep) {
    r = (r + 1) % 255;
    g = (g + 1) % 255;
    b = (b + 1) % 255;
    alpha = (alpha + 1) % 40 + 30;
    radiusNoise += 0.50;
    radius += 0.2;
    float thisRadius = radius + (noise(radiusNoise) * 100) - 100;
       
    float rad = radians(ang);
    x = centX + (thisRadius * 2 * cos(rad));
    y = centY + (thisRadius /2 * sin(rad));
    //    int alpha =  int(sqrt(sq(x - centX) + sq(y - centY)));
    //stroke (r, g, 0, alpha );
    stroke (r, r, 255, alpha );
    if (lastx > -999) {
      line(x,y,lastx,lasty);
    }  
    lastx = x;
    lasty = y;
  }
}
fill(255,255,255);
stroke (r, g, b, 1 );

int eyeOffset = 40;
int smileOffset = 100;

ellipse(centX + eyeOffset, centY - 20, 50, 50);
ellipse(centX - eyeOffset, centY - 20, 50, 50);

fill(0,0,0);
ellipse(centX + eyeOffset, centY - 20, 10, 10);
ellipse(centX - eyeOffset, centY - 20, 10, 10);

fill(255,0,0);
stroke (255, 0, 0, 1 );
curve( centX - smileOffset, centY - 20, 
  centX - 30, centY + 30, 
  centX + 30, centY + 30,
  centX + smileOffset, centY - 20) ;

