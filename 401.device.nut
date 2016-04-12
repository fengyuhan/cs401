#require "Button.class.nut:1.1.0"
#require "IFTTT.class.nut:1.0.0"

local lightlvl = 1024;
    
function loop() 
{   local currentLight = hardware.lightlevel();

    
	if (currentLight > lightlvl)
	{
	    // do something triger
	    server.log("light lvl change");
	    server.log(currentLight);
	   // agent.send("on", "on, 0");

	}
	else
	{
	    server.log("light lvl not changed");

	}
    // Put imp into shallow sleep for a second
    imp.wakeup(1.5, loop);
   // server.log("this is room light lvl");
    //server.log(hardware.lightlevel());
}
//server.log("this is room light lvl");
//server.log(hardware.lightlevel());

// Start the loop
loop();
