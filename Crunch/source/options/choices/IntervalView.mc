using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;


//global **********
var intTop;
var intMid;
var intBot;
var selected;

const INTERVALS = [15, 30, 45, 60, 75, 90];

//set top string
function setIntervalTop (string) {
	intTop = string;
	requestUpdate();
}

//set middle string
function setIntervalMid (string) {
	intMid = string;
	requestUpdate();
}

//set bottom string
function setIntervalBot (string) {
	intBot = string;
	requestUpdate();
}

function handleDisplay (currentInd) {

	if(currentInd == INTERVALS.size()-1) 
	{
		setIntervalTop("");
		setIntervalMid(INTERVALS[currentInd]);
		setIntervalBot(INTERVALS[currentInd-1]);
	}
	else if(currentInd == 0)
	{
		setIntervalTop(INTERVALS[currentInd+1]);
		setIntervalMid(INTERVALS[currentInd]);
		setIntervalBot("");
	}
	else
	{
		setIntervalTop(INTERVALS[currentInd+1]);
		setIntervalMid(INTERVALS[currentInd]);
		setIntervalBot(INTERVALS[currentInd-1]);
	}
}


//**********************************************************
//new view
class IntervalView extends Ui.View { 
	
    //! Load your resources here
    function onLayout(dc) {
   		
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        
       	//draw top interval
        dc.drawText(dc.getWidth()/3, dc.getHeight()/3-15, Gfx.FONT_SMALL, intTop, Gfx.TEXT_JUSTIFY_CENTER);
        
        if(selected == intMid) {
        	dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_BLACK);
        	dc.fillPolygon(CHECK_MARK);
        	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - (dc.getFontHeight(Gfx.FONT_LARGE)/2), Gfx.FONT_LARGE, intMid, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
        	dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        	dc.fillPolygon(X_MARK1);
        	dc.fillPolygon(X_MARK2);
        	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2 - (dc.getFontHeight(Gfx.FONT_LARGE)/2), Gfx.FONT_LARGE, intMid, Gfx.TEXT_JUSTIFY_CENTER);
        	
        }
        
        //draw bottom interval
        dc.drawText(dc.getWidth()/3, (dc.getHeight()/3)*2, Gfx.FONT_SMALL, intBot, Gfx.TEXT_JUSTIFY_CENTER);
        
        
    }

}
