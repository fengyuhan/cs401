#require "Button.class.nut:1.1.0"
#require "IFTTT.class.nut:1.0.0"

computer <- hardware.uart57;


function loop() 
{
    local currentLight = hardware.lightlevel();
    local temp1 = currentLight;
//    computer.write("Current light level is: " + currentLight + "\r\n");
	if (temp1 != currentLight)
	    // do something triger
	    
    // Put imp into shallow sleep for a second
    imp.wakeup(1.0, loop);
}

// Start the loop
loop();
