({
    
	clickCreateExpense : function(component, event, helper) {
      var listOfQuery = [];  
      var field = component.find("levels2").get("v.value");
      var operator = component.find("levels3").get("v.value");
      var value = component.find("inputValue").get("v.value");
   
        var str = operator.toString();
    // Create the action
        if(str == "equals"){
            operator = '='
        }else if(str == "not equal to"){
            operator = '!='
        }else if(str == "less than"){
            operator = '<'
        }else if(str == "less or equal"){
            operator = '=<'
        }else if(str == "greater or equal"){
            operator = '>='
        }
       
             listOfQuery.push(field,operator,value);
       
        console.log("list of query = "+listOfQuery);
   var action = component.get("c.saveOption");
     action.setParams({
        "field": field,
         "operator": operator,
         "value": value
    });

    // Send action off to be executed
    $A.enqueueAction(action);
   
}

})