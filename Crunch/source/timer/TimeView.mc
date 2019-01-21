using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Timer as Timer;
using Toybox.Math as Math;
using Toybox.Lang as Lang;

//global ******************* global
var timer1;
var timer2;
var clockTimer;
var count2;
var exercise;
var nextExercise;
var lastExercise;
var chosenExercise;
var interval;
var sec;
var min;
var elapsedTime;


//***************************
//new class
class TimeView extends Ui.View {
	
	var tinyFont;
	var bigFont;
	var threeFont;
	var twoFont;
	var oneFont;
	var sysClock;
	var sysHour;
	var sysMin;
	
    function initialize() {
    	lastExercise = null;
        timer1 = new Timer.Timer();
        timer2 = new Timer.Timer();
        clockTimer = new Timer.Timer();
        tinyFont = Ui.loadResource(Rez.Fonts.tinyFont);
    	bigFont = Ui.loadResource(Rez.Fonts.bigFont);
    	threeFont = Ui.loadResource(Rez.Fonts.threeFont);
    	twoFont = Ui.loadResource(Rez.Fonts.twoFont);
    	oneFont = Ui.loadResource(Rez.Fonts.oneFont);
    }
    
    function onShow() {
    	//get size of new array
    	var count=0;
    	for(var i = 0; i < myKey.size(); i++) {
    		if(app.getProperty(myKey[i])) {
    			count++;
    		}
    	}
    	//set new array size
    	chosenExercise = new [count];
    	count = 0;
    	for(var i = 0; i < myKey.size(); i++) {
    		if(app.getProperty(myKey[i])) {
    			chosenExercise[count] = EXERCISE[i];
    			count++;
    		}
    	}
    	
    	//Sys.println("Exercise: "+EXERCISE.size());
    	//Sys.println("My Key: "+myKey.size());
    	
    	sec = 0;
    	min = 0;
    	interval = app.getProperty("interval");
    	count2 = interval;
    	exercise = getRandomEx();
    	nextExercise = getRandomEx();
    	startClockTimer();
    }
    
    function onLayout(dc)
    {
    	
    	
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
     	
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        
        sysClock = Sys.getClockTime();
        sysHour = sysClock.hour;
        if(!(Sys.getDeviceSettings().is24Hour)) {
        	sysHour = sysHour % 12;
        	if( sysHour == 0) {
        		sysHour = 12;
        	}
        	sysHour = sysHour.toString()+":";
        	dc.drawText(35, dc.getHeight()/8, Gfx.FONT_SMALL, sysHour, Gfx.TEXT_JUSTIFY_RIGHT);
        }
        else {
        	dc.drawText(35, dc.getHeight()/8, Gfx.FONT_SMALL, sysHour.toString(), Gfx.TEXT_JUSTIFY_RIGHT);
        }
        
        
        //draw heart rate
        dc.drawText(35, dc.getHeight()/8, Gfx.FONT_SMALL, Lang.format("$1$", [sysClock.min.format("%02d")]), Gfx.TEXT_JUSTIFY_LEFT);
        
        //draw elapsedtime
        elapsedTime = Lang.format("$1$", [min.format("%02d")]);
        dc.drawText(dc.getWidth()-35, dc.getHeight()/8, Gfx.FONT_MEDIUM, elapsedTime, Gfx.TEXT_JUSTIFY_RIGHT);
        elapsedTime = Lang.format("$1$", [sec.format("%02d")]);
        dc.drawText(dc.getWidth()-32, dc.getHeight()/8+2, tinyFont, elapsedTime, Gfx.TEXT_JUSTIFY_LEFT);
        
        //draw main exercise
        if(dc.getTextWidthInPixels(exercise, Gfx.FONT_LARGE) > dc.getWidth()) {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - dc.getFontHeight(Gfx.FONT_MEDIUM)*1.25, Gfx.FONT_MEDIUM, exercise, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - dc.getFontHeight(Gfx.FONT_MEDIUM)*1.25, Gfx.FONT_LARGE, exercise, Gfx.TEXT_JUSTIFY_CENTER);
        }
        //draw next exercise
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2+dc.getFontDescent(Gfx.FONT_MEDIUM)*1.25, Gfx.FONT_TINY, nextExercise, Gfx.TEXT_JUSTIFY_CENTER);
        
        //draw time countdown
        //dc.drawText(dc.getWidth()/2, dc.getHeight()/2+60, Gfx.FONT_XTINY, countdown, Gfx.TEXT_JUSTIFY_CENTER);
        
        //draw interval
        if(count2 > 3) {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2+40, bigFont, count2, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
        	dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
	        if(count2 == 3) {
	        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2+30, threeFont, count2, Gfx.TEXT_JUSTIFY_CENTER);
	        }
	        else if(count2 == 2) {
	        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2+30, twoFont, count2, Gfx.TEXT_JUSTIFY_CENTER);
	        }
	        else if(count2 <= 1) {
	        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2+30, oneFont, count2, Gfx.TEXT_JUSTIFY_CENTER);
	        }
        }
       
    }
   
}

function startTimer() {
	timer1.start( method(:callback1), 1000, true );
   	timer2.start( method(:callback2), 1000, true );
}

function startClockTimer() {
	clockTimer.start(method(:callTime), 1000, true);
}
    
function getRandomEx() {
	var size = chosenExercise.size()-1;
	var ind = Math.rand()%size;
	var next = chosenExercise[ind];
	//Sys.println(next);
	while(next == nextExercise || next == exercise) {
		ind = Math.rand()%size;
    	next = chosenExercise[ind];
  	} 
  	return next;
}

function callTime() {  
	requestUpdate();
}
	    
function callback1() {
    sec += 1;
    if(sec % 60 == 0) {
    	min+=1;
    	sec = 0;
    	if(min % 60 == 0) {
    		sec = 0;
    		min = 0;
    	}
    }
    requestUpdate();
}
	
function callback2(){
    count2 -= 1;
    if(count2 == 0) {
    	count2 = interval;
    	exercise = nextExercise;
    	nextExercise = getRandomEx();
    }
    requestUpdate();
}

function resetValues() {
	timer1.stop();
	timer2.stop();
	clockTimer.stop();
	count2 = interval;
	sec = 0;
	min = 0;
	requestUpdate();
}
