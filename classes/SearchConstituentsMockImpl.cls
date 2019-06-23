@isTest
global class SearchConstituentsMockImpl  implements WebServiceMock{

      global void doInvoke(
               Object stub,
               Object request,
               Map<String, Object> response,
               String endpoint,
               String soapAction,
               String requestName,
               String responseNS,
               String responseName,
               String responseType) {
    
        // Create response element from the autogenerated class.        
        redcrossBiztalkIntegrationT2sfdc.SearchConstituentsResponse_element responseElement = new redcrossBiztalkIntegrationT2sfdc.SearchConstituentsResponse_element();
        
        responseElement.part = new redcrossBiztalkIntegrationT2sfdc.QueryResponse();
         
        responseElement.part.Success = true;
        responseElement.part.Count = 1;
        
        // construct records
        redcrossBiztalkIntegrationT2sfdc.ArrayOfRecordType recordsArray = new redcrossBiztalkIntegrationT2sfdc.ArrayOfRecordType();
        
        List<redcrossBiztalkIntegrationT2sfdc.RecordType> records = new List<redcrossBiztalkIntegrationT2sfdc.RecordType>();
        redcrossBiztalkIntegrationT2sfdc.RecordType record1 = new redcrossBiztalkIntegrationT2sfdc.RecordType();
        
        
        record1 = createCDIContactRecord('Sam',
                                        'Jones',
                                        '2121 12th Street',
                                        'New York',
                                        'NY',
                                        '12345');
        
        records.add(record1);
        
        recordsArray.RecordType = records;
        responseElement.part.Record = recordsArray;
               
        response.put('response_x', responseElement);
            
   }
   
   
      private redcrossBiztalkIntegrationT2sfdc.RecordType createCDIContactRecord (String firstName, 
                                                                                String lastName,
                                                                                String street,
                                                                                String city,
                                                                                String state,
                                                                                String zip) {
        
        redcrossBiztalkIntegrationT2sfdc.RecordType record1 = new redcrossBiztalkIntegrationT2sfdc.RecordType();
        
        // build fields array
        List<redcrossBiztalkIntegrationT2sfdc.FieldType> fieldTypes = new List<redcrossBiztalkIntegrationT2sfdc.FieldType>();
        
        redcrossBiztalkIntegrationT2sfdc.FieldType firstNameField = new redcrossBiztalkIntegrationT2sfdc.FieldType();
        firstNameField.name = DW2PHSSMappingConstants.strContactFirstName_ColumnName;
        firstNameField.type_x = 'System.String';
        firstNameField.value = firstName;
        fieldTypes.add(firstNameField);
        
        redcrossBiztalkIntegrationT2sfdc.FieldType lastNameField = new redcrossBiztalkIntegrationT2sfdc.FieldType();
        lastNameField.name = DW2PHSSMappingConstants.strContactLastName_ColumnName;
        lastNameField.type_x = 'System.String';
        lastNameField.value = lastName;
        fieldTypes.add(lastNameField);
        
        redcrossBiztalkIntegrationT2sfdc.FieldType streetField = new redcrossBiztalkIntegrationT2sfdc.FieldType();
        streetField.name = DW2PHSSMappingConstants.strARCBESTAddressLine1_ColumnName;
        streetField.type_x = 'System.String';
        streetField.value = street;
        fieldTypes.add(streetField);
        
        redcrossBiztalkIntegrationT2sfdc.FieldType cityField = new redcrossBiztalkIntegrationT2sfdc.FieldType();
        cityField.name = DW2PHSSMappingConstants.strARCBESTCity_ColumnName;
        cityField.type_x = 'System.String';
        cityField.value = city;
        fieldTypes.add(cityField);
        
        redcrossBiztalkIntegrationT2sfdc.FieldType stateField = new redcrossBiztalkIntegrationT2sfdc.FieldType();
        stateField.name = DW2PHSSMappingConstants.strARCBESTState_ColumnName;
        stateField.type_x = 'System.String';
        stateField.value = state;
        fieldTypes.add(stateField);       
        
        redcrossBiztalkIntegrationT2sfdc.FieldType zipField = new redcrossBiztalkIntegrationT2sfdc.FieldType();
        zipField.name = DW2PHSSMappingConstants.strARCBESTZip_ColumnName ;
        zipField.type_x = 'System.String';
        zipField.value = zip;
        fieldTypes.add(zipField);       
        
        redcrossBiztalkIntegrationT2sfdc.ArrayOfFieldType arrayOfFieldType = new redcrossBiztalkIntegrationT2sfdc.ArrayOfFieldType();
        arrayOfFieldType.FieldType = fieldTypes;
        
        record1.Fields = arrayOfFieldType;

        return record1;
    }  
        
}