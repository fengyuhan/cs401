#require "Button.class.nut:1.1.0"
#require "IFTTT.class.nut:1.0.0"
// initialize pins
local tmp36 = hardware.pin1;
tmp36.configure(ANALOG_IN);

const lightlvl = 55000; // some number near 65535
// function returns temperature from tmp36
function getTemperature() {
    local supplyVoltage = hardware.voltage();
    local voltage = supplyVoltage * tmp36.read() / 65535.0;
    local c = ((voltage - 0.5) * 100 - 32)*5/9 ;
    local celsius = format("%.01f", c);
    return(celsius);
}

function loop() 
{   
    imp.sleep(0.1);

    local currentLight = hardware.lightlevel();
    local sensor_voltage = getTemperature();
 
    if(sensor_voltage > 10)
    {
        server.log("temp is too high for food, here is temp:");
	    server.log(sensor_voltage);
        agent.send("tempabnormal", "temp");//active agent function call
    }
	if (currentLight > lightlvl)
	{
	    server.log("light lvl change");
	    server.log(currentLight);
	    server.log("temp is");
	    server.log(sensor_voltage);
	
	    agent.send("someoneOpen", "on0");//active agent function call
	    imp.sleep(42.42);// since the door are opened
	                    // no need send repeat msg
	                   // that's why imp sleep for 42 second
	                   // 42 is the answer
	                  
	}
	else
	{
	    imp.wakeup(0.5, loop);
	}
    // Put imp into shallow sleep for 3,5 second
    imp.wakeup(3.5, loop);
    // finaly I decide not put imp to a deep sleep
    // I do not need battery so, no big deal here
    
    
   
}


server.log("device build Success!!");

// Start the loop
loop();
