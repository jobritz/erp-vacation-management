@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Vacation Entitlement'
@Metadata.allowExtensions: true

define view entity ZLJND_C_VAC_ENT
  as projection on ZLJND_R_VAC_ENT
{
  key VacationEntitlementUuid,
      EmployeeUuid,
      CurrentYear,
      AnnualLeave,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      RemainingDays,
      PlannedDays,
      UsedDays,
      
      _employee : redirected to parent ZLJND_C_EMPLOYEE
}
