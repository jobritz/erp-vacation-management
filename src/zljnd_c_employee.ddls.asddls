@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Employee'
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZLJND_C_EMPLOYEE
  as projection on ZLJND_R_EMPLOYEE
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

      /* Administrative Data */
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangeAt,
      
      _vacationentitlement : redirected to composition child ZLJND_C_VAC_ENT,
      _vacationrequest : redirected to composition child ZLJND_C_VAC_REQ
      
}
