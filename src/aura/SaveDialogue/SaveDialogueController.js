({
showModalBox : function(component, event, helper) {
document.getElementById("backGroundSectionId").style.display = "none";
document.getElementById("newAccountSectionId").style.display = "none";
},
 
saveAccount : function(component, event, helper) {
 
var action = component.get("c.getAccountupdatedlist");
    var name = component.find("accname").get("v.value");
action.setParams({ "name" : name});
 
action.setCallback(this, function(a) {
if (a.getState() === "SUCCESS") {
document.getElementById("backGroundSectionId").style.display = "none";
document.getElementById("newAccountSectionId").style.display = "none";
} else if (a.getState() === "ERROR") {
$A.log("Errors", a.getError());
}
});
 
$A.enqueueAction(action);
}
})