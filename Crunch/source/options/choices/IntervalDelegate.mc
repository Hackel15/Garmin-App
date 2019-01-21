using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class IntervalDelegate extends Ui.BehaviorDelegate {

	var currentIndex;
	
	
    function initialize() {
    	var int = "interval";
    	selected = app.getProperty(int);
    	
    	for(var i = 0; i < INTERVALS.size(); i++)
    	{
    		if(selected == INTERVALS[i])
    		{
    			currentIndex = i;
    		}
    	}
    	
		handleDisplay(currentIndex);

    		
    }
    
    function onBack() {
    	Ui.popView(Ui.SLIDE_IMMEDIATE);
    	return true;
    }
    
    function onSelect() {
    	
    	selected = INTERVALS[currentIndex];
    	app.setProperty("interval", selected);
    	handleDisplay(currentIndex);
    	
    	return true;
    }
    
    function onNextPage() {
    	if(currentIndex == 0)
    	{
    		handleDisplay(currentIndex);
    	}
    	else
    	{
    		currentIndex--;
    		handleDisplay(currentIndex);
    	}
    	return true;
    }
    
    function onPreviousPage() {
    	if(currentIndex == INTERVALS.size()-1)
    	{
    		handleDisplay(currentIndex);
    	}
    	else
    	{
    		currentIndex++;
    		handleDisplay(currentIndex);
    	}
    	return true;
    }

}