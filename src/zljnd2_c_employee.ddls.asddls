@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Employee'
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZLJND2_C_EMPLOYEE
  provider contract transactional_query
  as projection on ZLJND2_R_EMPLOYEE
{
  key EmployeeUuid,
      EmployeeId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      FirstName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      LastName,
      EntryDate,
      EmployeeName,

      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangeAt
}

      
     // _vacationrequest     : redirected to composition child ZLJND2_C_VAC_REQ


