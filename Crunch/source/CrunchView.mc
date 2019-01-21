using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.System as Sys;

//global
var interval;
var app;
const CHECK_MARK = [[188, 72],[170, 107],[156, 86],[169, 97]];
const X_MARK1 = [[188,73], [170, 93], [152, 113], [170, 103]];
const X_MARK2 = [[152,73], [170, 93], [188, 113], [170, 103]];
var myKey;

class CrunchView extends Ui.View {
	
	var heartRate;
	var exercise;
	var nextExercise;
	var countdown;
	var elapsedTime;
	var sec;
	var min;
	var tinyFont;
	var interval;
	
    function initialize() {
    	sec = 0;
    	min = 0;
    	app = App.getApp();
        interval = app.getProperty("interval");
        myKey = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
        	     "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen",
        	     "nineteen", "twenty", "twenty1", "twenty2", "twenty3", "twenty4", "twenty5", "twenty6",
        	     "twenty7", "twenty8", "twenty9", "thirty", "thirty1", "thirty2", "thirty3", "thirty4",
        	     "thirty5", "thirty6", "thirty7", "thirty8", "thirty9", "forty", "forty1", "forty2"];
        	  
    }

	function onShow() {
		interval = app.getProperty("interval");
	}
    //! Load your resources here
    function onLayout(dc) {
        //setLayout(Rez.Layouts.MainLayout(dc));
        //app.setProperty("interval", 45);
        tinyFont = Ui.loadResource(Rez.Fonts.tinyFont);
        heartRate = "Clock Time";
    	exercise = "First Exercise";
    	nextExercise = "Next Exercise";
        countdown = "Interval: ";
        elapsedTime = "00:00";
        //interval = app.getProperty("interval");
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
     	
        dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_BLACK);
        //draw heart rate
        dc.drawText(20, dc.getHeight()/8, Gfx.FONT_SMALL, heartRate, Gfx.TEXT_JUSTIFY_LEFT);
        
        //draw coutdown
        elapsedTime = Lang.format("$1$", [min.format("%02d")]);
        dc.drawText(dc.getWidth()-35, dc.getHeight()/8, Gfx.FONT_MEDIUM, elapsedTime, Gfx.TEXT_JUSTIFY_RIGHT);
        elapsedTime = Lang.format("$1$", [sec.format("%02d")]);
        dc.drawText(dc.getWidth()-32, dc.getHeight()/8+2, tinyFont, elapsedTime, Gfx.TEXT_JUSTIFY_LEFT);
        
        //draw main exercise
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - dc.getFontHeight(Gfx.FONT_MEDIUM)*1.25, Gfx.FONT_LARGE, exercise, Gfx.TEXT_JUSTIFY_CENTER);
        
        //draw next exercise
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2+dc.getFontDescent(Gfx.FONT_MEDIUM)*1.25, Gfx.FONT_TINY, nextExercise, Gfx.TEXT_JUSTIFY_CENTER);
        
        //draw time elapsed
        dc.drawText(dc.getWidth()/2+10, dc.getHeight()/2+60, Gfx.FONT_XTINY, countdown, Gfx.TEXT_JUSTIFY_RIGHT);
        dc.drawText(dc.getWidth()/2+10, dc.getHeight()/2+60, Gfx.FONT_XTINY, interval, Gfx.TEXT_JUSTIFY_LEFT);
        
    }

}
