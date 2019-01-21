using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class CrunchDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() {
        Ui.pushView(new OptionsView(), new OptionsDelegate(), Ui.SLIDE_UP);
        return true;
    }
    
    function onSelect() {
    	//start timers
    	Ui.pushView(new TimeView(), new TimeDelegate(), Ui.SLIDE_IMMEDIATE);
    	return true;
    }
    
    function onBack () {
    	//app.onStop(state);
    }

}