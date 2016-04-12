#require "IFTTT.class.nut:1.0.0"
const SECRET_KEY = "IlDPWnuF5eHraFsd51WdO";
const MAILBOX_FULL_NOTIFICATION = "some one open the fridge"
// Constants and user strings


ifttt <- IFTTT(SECRET_KEY);
// initialize services

function notify(message) {
    ifttt.sendEvent("asdf notify", message);
}
// Wrapper function for sending push notifications 
//HttpGetWrapper("https://maker.ifttt.com/trigger/cs401/with/key/IlDPWnuF5eHraFsd51WdO"))

/*device.on("on", function(feedCSV) 
{       //take csv body in from device
    HttpGetWrapper("https://maker.ifttt.com/trigger/switch-pressed-off/with/key/***Insert Key Here***");
    server.log("on trigger sent to IFTTT Maker");
});

*/

// Trigger an event with no values and a callback
ifttt.sendEvent("some_one_open_the_fridge", function(err, response) {
    if(err) {
        server.error(err);
        return;
    }
    server.log("Success!!");
});
