using Toybox.WatchUi as Ui;

class OptionsDelegate extends Ui.BehaviorDelegate {

	var index;
	
    function initialize() {
        titles = ["Select Workouts", "Select Interval"];
        index = 0;
        indexOption = index;
        setMidOption(titles[0]);
        setBotOption(titles[1]);
    }
    
    function onBack() {
    	Ui.popView(Ui.SLIDE_IMMEDIATE);
    	return true;
    }
    
    function onSelect() {
    	if(index == 0)
    	{
    		Ui.pushView(new SelectView(), new SelectDelegate(), Ui.SLIDE_IMMEDIATE);
    	}
    	else if(index == 1)
    	{
    		Ui.pushView(new IntervalView(), new IntervalDelegate(), Ui.SLIDE_IMMEDIATE);
    	}
    	
    	return true;
    }
    
    function onNextPage() {
    	if(!(index == titles.size()-1))
    	{
    		index++;
    		indexOption = index;
    		myUpdate();
    	}
    	return true;
    }
    
    function onPreviousPage() {
    	
    	if(!(index == 0))
    	{
    		index--;
    		indexOption = index;
    		myUpdate();
    	}
    	return true;
    }

}