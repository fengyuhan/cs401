#require "IFTTT.class.nut:1.0.0"
const SECRET_KEY = "IlDPWnuF5eHraFsd51WdO";
const MAILBOX_FULL_NOTIFICATION = "You got mail"
// Constants and user strings


ifttt <- IFTTT(SECRET_KEY);
// initialize services

function notify(message) {
    ifttt.sendEvent("asdf notify", message);
}
// Wrapper function for sending push notifications 
//- a timestamp will be automatically baked in by IFTTT
