({
    clickMoreFilter: function(cmp, event, helper) {
        $A.createComponent(
            "c:AccountDynamicForm",
            {
                "aura:id": "findableAuraId",
                "label": "Press Me",
            },
            
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    var newb = newButton.getElement('levels2');
                    console.log('checkCmp'+newb);
                    body.push(newButton);
                    cmp.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                    else if (status === "ERROR") {
                        console.log("Error: " + errorMessage);
                        // Show error message
                    }
                
            }
        );
    },
    
    clickMe: function(cmp, event, helper) { 
        var name = cmp.find("accIndustry").get("v.value");
        if(name != null && name != 'none' && name!=''){
            var action = cmp.get("c.getAccountFromSavedFilter");
            action.setParams({
                "name": name
            });
        }else{
            var action = cmp.get("c.getAccountFilters");
        }
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            var responseValue = response.getReturnValue();
            console.log("print my reponseValue"+responseValue);
            if (cmp.isValid() && state === "SUCCESS") {
                console.log("i am valid");
                var action = cmp.get("c.getExpenses");
                var value = cmp.find("text").get("v.value");
                if(value != "" && value != null){
                     console.log("i am in filter Logic");
                   action.setParams({
                    "field": responseValue,
                       "filterLogic": value    
                }); 
                }else{
                    console.log("i am not in filter Logic");
                action.setParams({
                    "field": responseValue,
                     "filterLogic": ""  
                });
                    }
                
                // Add callback behavior for when response is received
                action.setCallback(this, function(response) {
                    var state = response.getState();
                    if (cmp.isValid() && state === "SUCCESS") {
                        cmp.set("v.expenses", response.getReturnValue());
                    }
                    else {
                        console.log("Failed with state: " + state);
                    }
                });
                
                // Send action off to be executed
                $A.enqueueAction(action);
                
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        
        // Send action off to be executed
        $A.enqueueAction(action);
        
    },
    showModal : function(component, event, helper) {
        document.getElementById("backGroundSectionId").style.display = "block";
        document.getElementById("newAccountSectionId").style.display = "block";
    },
    
    doInit: function(component, event, helper) {
        helper.fetchPickListVal(component, 'Name', 'accIndustry');
        var action = component.get("c.deleteOption");
        $A.enqueueAction(action);
    },
    toggle : function(component, event, helper) {
        var toggleText = component.find("text");
        $A.util.toggleClass(toggleText, "toggle");
    }

    
})