//working version 1.0 
// next improve add temp sensor
#require "IFTTT.class.nut:1.0.0"
const SECRET_KEY = "IlDPWnuF5eHraFsd51WdO";
const NOTIFICATION = "some_one_open_the_fridge"
ifttt <- IFTTT(SECRET_KEY);

// Constants and user strings

function callifttt(on0)
{
    ifttt.sendEvent(NOTIFICATION, function(err, response) {
    if(err) {
        server.error(err);
        return;
    }
    server.log("Success!!");
});

}
// initialize services

device.on("someoneopen", callifttt );
server.log("agent build Success!!");


/*
function notify(message) {
    ifttt.sendEvent("asdf notify", message);
}

*/
// Wrapper function for sending push notifications 
//HttpGetWrapper("https://maker.ifttt.com/trigger/cs401/with/key/IlDPWnuF5eHraFsd51WdO"))

/*device.on("on", function(feedCSV) 
{       //take csv body in from device
    HttpGetWrapper("https://maker.ifttt.com/trigger/switch-pressed-off/with/key/***Insert Key Here***");
    server.log("on trigger sent to IFTTT Maker");
});

*/

// Trigger an event with no values and a callback
/*
ifttt.sendEvent("some_one_open_the_fridge", function(err, response) {
    if(err) {
        server.error(err);
        return;
    }
    server.log("Success!!");
});*/
