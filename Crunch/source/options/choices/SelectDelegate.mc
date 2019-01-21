using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class SelectDelegate extends Ui.BehaviorDelegate {
	
	var currentIndex;
	var tempValue;
	
    function initialize() {
    	
    	currentIndex = 0;
    	selectIndex = 0;
    	handleSelectInd(currentIndex);
    	selectSIZE = 0;
    	for(var i = 0; i < myKey.size(); i++) {
    		if(app.getProperty(myKey[i])) {
    			selectSIZE++;
    		}
    	}
    }
    
    function onBack() {
    	Ui.popView(Ui.SLIDE_IMMEDIATE);
    	return true;
    }
    
    function onSelect() {
    
		tempValue = app.getProperty(myKey[currentIndex]);
		if(tempValue == true) {
			if(selectSIZE <= 4) {
				displayErrorString();
			}
			else {
				app.setProperty(myKey[currentIndex], false);
				selectSIZE--;
				handleSelectInd(currentIndex);
			}
		}
		else {
			app.setProperty(myKey[currentIndex], true);
			selectSIZE++;
			handleSelectInd(currentIndex);
		}
		
    	return true;
    }
    
    function onNextPage() {
 		if(currentIndex == EXERCISE.size()-1)
    	{
    		handleSelectInd(currentIndex);
    	}
    	else
    	{
    		currentIndex++;
    		handleSelectInd(currentIndex);
    	}
    	return true;
    }
    
    function onPreviousPage() {
    	if(currentIndex == 0)
    	{
    		handleSelectInd(currentIndex);
    	}
    	else
    	{
    		currentIndex--;
    		handleSelectInd(currentIndex);
    	}
    	return true;
    }

}