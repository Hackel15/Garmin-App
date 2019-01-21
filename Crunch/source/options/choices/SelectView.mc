using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.System as Sys;

//global **********
var selectTop;
var selectMid;
var selectBot;
var selectIndex;
var selectedExercise;
var selectSIZE; //cannot be below 3
var errorDetected;

var EXERCISE = ["Ab Crunches", "Bicycle Crunches", "Butterfly Crunch", "Crossed Leg Crunch", "Crunch", 
                "Dead Bugs", "Decline Reverse Crunch", "Double Crunch", "Dumbbell Side Bend", "Flutter Kicks",
                "Frog Crunch", "Frog Sit Ups", "Front Arm Roll Outs", "Hanging knee raise", "Hanging leg lifts",
                "Heel Touch", "Inch Worm Push Up", "Incline Crunch", "Jack Knife Crunch", "Kick Downs",
                "Kneeling Crunch", "Lateral Leg Lifts", "Leg Raises", "Med Ball Chest Pass", "Med Ball Knee-ins",
                "Med Ball Overhead", "Med Ball Side Throw", "Mountain Climbers", "Oblique Crunch",
                "One-Leg Plank", "Penguins", "Plank", "Plank to Pushup", "Plank Leg Raises", "Plank to Side Plank",
                "Reverse Crunch", "Russian Twists", "Scissors", "Side Plank", "Sit Ups", "Superman's", "V-Crunch", "V-ins"];
    

//handle index boundry
function handleSelectInd(currentIndex) {
	selectIndex = currentIndex;
	
	//Sys.println(app.getProperty(myKey[selectIndex]));
	if(selectIndex == EXERCISE.size()-1) 
	{
		setSelTop(EXERCISE[selectIndex-1]);
		setSelMid(EXERCISE[selectIndex]);
		setSelBot("");
	}
	else if(selectIndex == 0)
	{
		setSelTop("");
		setSelMid(EXERCISE[selectIndex]);
		setSelBot(EXERCISE[selectIndex+1]);
	}
	else
	{
		setSelTop(EXERCISE[selectIndex-1]);
		setSelMid(EXERCISE[selectIndex]);
		setSelBot(EXERCISE[selectIndex+1]);
	}
}
//set top title
function setSelTop(string) {
	selectTop = string;
	requestUpdate();
}

//set middle title
function setSelMid(string) {
	selectMid = string;
	requestUpdate();
}

//set bottom title
function setSelBot(string) {
	selectBot = string;
	requestUpdate();
}

//display out of bounds error
function displayErrorString() {
	errorDetected = 1;
	requestUpdate();
}
//**********************************************************
//NEW CLASS
//new view
class SelectView extends Ui.View { 
	
    //! Load your resources here
    function onLayout(dc) {
   		
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        
        //print top
        dc.drawText(dc.getWidth()/8, dc.getHeight()/3-15, Gfx.FONT_TINY, selectTop, Gfx.TEXT_JUSTIFY_LEFT);
        
        //print middle 
        if(dc.getTextWidthInPixels(selectMid, Gfx.FONT_MEDIUM) > 120) {
        	dc.drawText(dc.getWidth()/3*2, dc.getHeight()/2 - (dc.getFontHeight(Gfx.FONT_MEDIUM)/2), Gfx.FONT_SMALL, selectMid, Gfx.TEXT_JUSTIFY_RIGHT);
        }
        else {
        	dc.drawText(dc.getWidth()/3*2, dc.getHeight()/2 - (dc.getFontHeight(Gfx.FONT_MEDIUM)/2), Gfx.FONT_MEDIUM, selectMid, Gfx.TEXT_JUSTIFY_RIGHT);
        }
        
        if(app.getProperty(myKey[selectIndex])) {
        	dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_BLACK);
        	dc.fillPolygon(CHECK_MARK);
        	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        }
        else {
        	dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        	dc.fillPolygon(X_MARK1);
        	dc.fillPolygon(X_MARK2);
        	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        }
        
        //print bot
        dc.drawText(dc.getWidth()/8, (dc.getHeight()/3)*2, Gfx.FONT_TINY, selectBot, Gfx.TEXT_JUSTIFY_LEFT);
        
        //print error
        if(errorDetected == 1) {  
        	dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/10, Gfx.FONT_SMALL, "Minimum Limit Selected", Gfx.TEXT_JUSTIFY_CENTER);
        	errorDetected = 0;
        }
    }

}
