#require "IFTTT.class.nut:1.0.0"
const SECRET_KEY = "IlDPWnuF5eHraFsd51WdO";
const NOTIFICATION = "some_one_open_the_fridge";
const NOTIFICATION2 = "OMG_temperature_too_high_for_food";

ifttt <- IFTTT(SECRET_KEY);

// Constants and user strings

function callIFTTT(on0)
{
    ifttt.sendEvent(NOTIFICATION, function(err, response) {
    if(err) {
        server.error(err);
        return;
    }
    server.log("Run Success!!");
});

}

function callIFTTT2(temp)
{
    ifttt.sendEvent(NOTIFICATION2, function(err, response) {
    if(err) {
        server.error(err);
        return;
    }
    server.log(" Bad thing happened Tempture too high for fodd~~");
});

}
// initialize services

device.on("someoneOpen", callIFTTT );
device.on("tempabnormal", callIFTTT2 );

server.log("agent build Success!!");

   
