//working version 1.0 
// next improve add temp sensor
#require "Button.class.nut:1.1.0"
#require "IFTTT.class.nut:1.0.0"

//const lightlvl = 1024;
const lightlvl = 2048;
//const lightlvl = 8192;

//const lightlvl = 60000; // some number near 65535
    
function loop() 
{   
    imp.sleep(0.1);

    local currentLight = hardware.lightlevel();

    
	if (currentLight > lightlvl)
	{
	    // do something triger
	    server.log("light lvl change");
	    server.log(currentLight);
	  // these 3 lines are for test only 
	  // common out or not does not effect the program
	  
	    agent.send("someoneopen", "on0");//active agent function call
	    imp.sleep(42.42);// since the door are opened
	                    // no need send repeat msg
	                   // that's why imp sleep for 42 second
	                   // 42 is the answer

	}
	else
	{
	    server.log("light lvl not changed");
        server.log(currentLight);
        	   // test only above code are test only

        //imp.sleep(4.2);// since no change put imp in sleep for a bit
          //imp.wakeup(2.5, loop);
	}
    // Put imp into shallow sleep for 1,5 second
    imp.wakeup(1.5, loop);
    // finaly I decide not put imp to a deep sleep
    // I do not need battery so, no big deal here
    
    
   
}


server.log("device build Success!!");

// Start the loop
loop();
