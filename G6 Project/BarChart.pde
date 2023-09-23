//SF AND ADR

class BarChart
{
  Flights currFlight;
  TreeMap<String,Integer> count=new TreeMap<String,Integer>();
  int[] statesCount=new int[53];
  String[] placeNames=new String[50];
  ArrayList<String> data;

  BarChart(ArrayList<String> data)
  {
    this.data = data;
  }

  void countTState()
  {

    for (int i = 0; i < data.size(); i++)
    {
      String destSt = data.get(i);
      switch (destSt)
      {
      case "AK" :
        statesCount[0]++;
        break;
      case "AL" :
        statesCount[1]++;
        break;
      case "AR" :
        statesCount[2]++;
        break;
      case "AZ" :
        statesCount[3]++;
        break;
      case "CA" :
        statesCount[4]++;
        break;
      case "CO" :
        statesCount[5]++;
        break;
      case "CT" :
        statesCount[6]++;
        break;
      case "DE" :
        statesCount[7]++;
        break;
      case "FL" :
        statesCount[8]++;
        break;
      case "GA" :
        statesCount[9]++;
        break;
      case "HI" :
        statesCount[10]++;
        break;
      case "IA" :
        statesCount[11]++;
        break;
      case "ID" :
        statesCount[12]++;
        break;
      case "IL" :
        statesCount[13]++;
        break;
      case "IN" :
        statesCount[14]++;
        break;
      case "KS" :
        statesCount[15]++;
        break;
      case "KY" :
        statesCount[16]++;
        break;
      case "LA" :
        statesCount[17]++;
        break;
      case "MA" :
        statesCount[18]++;
        break;
      case "MD" :
        statesCount[19]++;
        break;
      case "ME" :
        statesCount[20]++;
        break;
      case "MI" :
        statesCount[21]++;
        break;
      case "MN" :
        statesCount[22]++;
        break;
      case "MO" :
        statesCount[23]++;
        break;
      case "MS" :
        statesCount[24]++;
        break;
      case "MT" :
        statesCount[25]++;
        break;
      case "NC" :
        statesCount[26]++;
        break;
      case "ND" :
        statesCount[27]++;
        break;
      case "NE" :
        statesCount[28]++;
        break;
      case "NH" :
        statesCount[29]++;
        break;
      case "NJ" :
        statesCount[30]++;
        break;
      case "NM" :
        statesCount[31]++;
        break;
      case "NV" :
        statesCount[32]++;
        break;
      case "NY" :
        statesCount[33]++;
        break;
      case "OH" :
        statesCount[34]++;
        break;
      case "OK" :
        statesCount[35]++;
        break;
      case "OR" :
        statesCount[36]++;
        break;
      case "PA" :
        statesCount[37]++;
        break;
      case "PR":
        statesCount[38]++;
        break;
      case "RI" :
        statesCount[39]++;
        break;
      case "SC" :
        statesCount[40]++;
        break;
      case "SD" :
        statesCount[41]++;
        break;
      case "TN" :
        statesCount[42]++;
        break;
      case "TT":
        statesCount[43]++;
        break;
      case "TX" :
        statesCount[44]++;
        break;
      case "UT" :
        statesCount[45]++;
        break;
      case "VA" :
        statesCount[46]++;
        break;
      case "VI" :
        statesCount[47]++;
        break;
      case "VT":
        statesCount[48]++;
        break;
      case "WA" :
        statesCount[49]++;
        break;
      case "WI" :
        statesCount[50]++;
        break;
      case "WV" :
        statesCount[51]++;
        break;
      case "WY" :
        statesCount[52]++;
        break;

      default:
        break;
      }
    }
  }  

  void drawBarChart()
  {
    int currentBar=-2;
    int maxHeight = max(statesCount)/3;
    for (int i = 0; i < statesCount.length; i++)
    {
      int barHeight=200*statesCount[i]/maxHeight;
      int x=60+i*25;
      int y=850-barHeight;
      int barWidth=25;
      fill(255);
      //SF
      if (mouseX >= x && mouseX <= x + barWidth && mouseY >= y && mouseY <= height-barWidth) 
      {
        currentBar = i;
        textFont(italicFont);
        text(airportName.get(i)+":"+statesCount[i], 980, 250);
        fill(255);
      }
      else
      {
      fill(colsPC[i% colsPC.length]);
      }
      rect(x, y, barWidth, barHeight); 
    }
    if (currentBar==-2) 
    {
      currentBar=-2;
    }
  }
  
  void draw()
  {
    fill(headColor);
    stroke(0);
    strokeWeight(2);
    rect(950,190,200,70,30);
    fill(255);
    textFont(italicFont);
    text("State:", 980, 220);
    line(60, 180, 60, 850); // y axis
    line(60, 850, 1340, 850); // x axis
    fill(0);
    
    fill(0);
    drawBarChart();
  }
}
