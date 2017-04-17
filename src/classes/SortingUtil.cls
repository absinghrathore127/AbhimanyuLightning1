public without sharing class SortingUtil {
        /*SortingUtil class is defined for Sorting a list 
        of Objects(Standard and Custom) and Fields
        (Standard and Custom). We can sort any selectoption list from this class. */


    //sortObjectsAndFields method is used to sort the list of SelectOptions with type of list of selectOption
    public Static List<SelectOption> sortObjectsAndFields(List<SelectOption> selectOptions){
    
        //Define a list of SelectOption to store sorted selectOption List.
        List<SelectOption> selectOptionsSorted = new List<SelectOption>();
        
        //Checking Whether the list we are getting is null or not.
        if( selectOptions != null ) {
            
            //Define a map to store label and values for selectOption List
            Map<String, List<String>> mapOptionLabelToValues = new Map<String, List<String>>();
            
            //Iterate for store data into map.
            for(SelectOption optionObj : selectOptions ) {  
                
                    List<String> selectionValues = new List<String>();
                    
                    //Checking if map contains dublicate label 
                    if(mapOptionLabelToValues.containsKey( optionObj.getLabel() )) {
                        selectionValues = mapOptionLabelToValues.get( optionObj.getLabel() );
                    }
                    
                    //Add value to list
                    selectionValues.add( optionObj.getValue() );
                    
                    //Add List to Map
                    mapOptionLabelToValues.put( optionObj.getLabel(), selectionValues);                  
                
            }
            //Define a list of strings that will contain sorted Label
            List<String> selectOptionlabelsSorted = new List<String>();
            
            //get keyset of map and add it to the list(selectOptionlabelsSorted).
            selectOptionlabelsSorted.addAll( mapOptionLabelToValues.keySet() );
            
            //Use sort() method to sort list (Asc order byDefault)
            selectOptionlabelsSorted.sort();
            
            //Iterate for getting label from map and add it to the list,
             //So we will get the result in value and label expression(For SelectOtpion)
            for(String optionLabel : selectOptionlabelsSorted ) {  
                if( mapOptionLabelToValues.containsKey( optionLabel )) {
                    List<String> optionValues = mapOptionLabelToValues.get( optionLabel );
                    if( optionValues != null ) {                
                        for( String  optionValue : optionValues ) {
                            selectOptionsSorted.add( new SelectOption( optionValue, optionLabel )); 
                        }
                    }
                }
            }
        }
        //Returning the sorted SelectOption 
        return selectOptionsSorted;
    }
    
    
   
}