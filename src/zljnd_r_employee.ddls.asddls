@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Employee'
define root view entity ZLJND_R_EMPLOYEE
  as select from zljnd_employee
  composition [0..*] of ZLJND_R_VAC_ENT as _vacationentitlement
{
  key employee_uuid   as EmployeeUuid,
      employee_id     as EmployeeId,
      first_name      as FirstName,
      last_name       as LastName,
      entry_date      as EntryDate,

      /* Administrative Data */
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_change_at  as LastChangeAt,
      
      _vacationentitlement
}
