using Toybox.WatchUi as Ui;

class TimeDelegate extends Ui.BehaviorDelegate {
	
	var on_off;
	
    function initialize() {
        
        on_off = 1; // 0 = TIMERS ON | 1 = TIMERS OFF
    }
    
    function onMenu() {
    	resetValues();
    	on_off = 1;
    	Ui.pushView(new OptionsView(), new OptionsDelegate(), Ui.SLIDE_IMMEDIATE);
    	return true;
    }
    function onSelect() {
    	if(on_off == 0) {
    		//startTimer(false);
    		timer1.stop();
    		timer2.stop();
    		
    		on_off = 1;
    	}
    	else if(on_off == 1) {
    		//startTimer(true);
    		startTimer();
    		
    		on_off = 0;
    	}
    	return true;
    }
    
    function onBack() {
    	
    	if(on_off == 1 && min == 0 && sec == 0) {
	    	timer1.stop();
	    	timer2.stop();
	    	clockTimer.stop();
	    	Ui.popView(Ui.SLIDE_IMMEDIATE);
    	}
    	else if(on_off == 1) {
    		resetValues();
    	}
    	return true;
    }

}