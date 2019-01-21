using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;

//global
var midOption;
var botOption;
var titles;
var indexOption;

//set middle string
function myUpdate () {
	requestUpdate();
}

//setMiddle string
function setMidOption(string) {
	midOption = string;
	requestUpdate();
}

function setBotOption(string) {
	botOption = string;
	requestUpdate();
}


//*********************************************************
//new view
class OptionsView extends Ui.View {


    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        //dc.fillPolygon(pts);
        
        //dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_DK_BLUE);
        
        //dc.fillRoundedRectangle(dc.getWidth()/2 - 80, dc.getHeight()/2-(dc.getFontHeight(Gfx.FONT_MEDIUM)/2)-5, 150, dc.getFontHeight(Gfx.FONT_MEDIUM)+10, 5);
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
        
   
        //draw middle
        if(indexOption == 0) {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2.5, Gfx.FONT_LARGE, midOption, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/2.5, Gfx.FONT_TINY, midOption, Gfx.TEXT_JUSTIFY_CENTER);
        }
        
        if(indexOption == 1) {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/1.75-(dc.getFontHeight(Gfx.FONT_LARGE)/3), Gfx.FONT_LARGE, botOption, Gfx.TEXT_JUSTIFY_CENTER);
        }
        else {
        	dc.drawText(dc.getWidth()/2, dc.getHeight()/1.75, Gfx.FONT_TINY, botOption, Gfx.TEXT_JUSTIFY_CENTER);
        }
        
        
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }

}
