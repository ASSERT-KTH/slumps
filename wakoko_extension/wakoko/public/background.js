console.log("Background enabled")
// Background script
// @ts-ignore

chrome.runtime.onMessage.addListener(function (request, sender, sendResponse) {
if (request.message === "tab_close_msg") {
    // add your code to close tab
    console.log("Closing")
}
})
/* 
chrome.runtime.onMessage.addListener(function(message, sender, sendResponse) {
    console.log(message, sender)
  if(message.closeThis) chrome.tabs.remove(sender.tab.id);
}); */