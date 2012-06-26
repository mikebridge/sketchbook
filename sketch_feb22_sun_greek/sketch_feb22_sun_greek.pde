int maxX = 1000;
int maxY = 600;
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
  float radius = 10;
  //  stroke(random(20), random(50), random(70), 80); 

  int startangle = int(random(360));
  int endangle = 1440 + int(random(1440));
  int anglestep = 2 + int(random(3));
  for (float ang = startangle; ang <= endangle; ang += anglestep) {
    r = (r + 1) % 200 + 10;
    g = (g + 1) % 200 + 10 ;
    b = (b + 1) % 200 + 10;
    alpha = (alpha + 1) % 70 + 30;
    radiusNoise += 0.00;
    radius += 0.15;
    float thisRadius = radius + (noise(radiusNoise) * 100) - 100;
       
    float rad = radians(ang);
    x = centX + (thisRadius * pow(cos(rad), 3));
    y = centY + (thisRadius * pow(sin(rad), 3));
    //    int alpha =  int(sqrt(sq(x - centX) + sq(y - centY)));
    stroke (r, g, b, alpha );
    
    if (lastx > -999) {
      line(x,y,lastx,lasty);
    }  
    lastx = x;
    lasty = y;
  }
}
