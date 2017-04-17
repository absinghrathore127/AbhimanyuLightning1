({
    
    // Load expenses from Salesforce
doInit: function(component, event, helper) {

    // Create the action
    var action = component.get("c.getItems");

    // Add callback behavior for when response is received
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            console.log("Failed with state: " + response.getReturnValue());
            component.set("v.newItem", response.getReturnValue());
        }
        else {
            console.log("Failed with state: " + state);
        }
    });

    // Send action off to be executed
    $A.enqueueAction(action);
},
   
    
})