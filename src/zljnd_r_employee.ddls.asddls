@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Employee'
define root view entity ZLJND_R_EMPLOYEE
  as select from zljnd_employee
  composition [0..*] of ZLJND_R_VAC_ENT as _vacationentitlement
  composition [0..*] of ZLJND_R_VAC_REQ as _vacationrequest
  association to ZLJND_I_EMPLOYEETEXT as _employeetext on $projection.EmployeeUuid = _employeetext.employee_uuid
{
  key employee_uuid   as EmployeeUuid,
      employee_id     as EmployeeId,
      first_name      as FirstName,
      last_name       as LastName,
      entry_date      as EntryDate,

      /* Administrative Data */
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_change_at  as LastChangeAt,
      
      _vacationentitlement,
      _vacationrequest,
      _employeetext.Name as EmployeeName
}
