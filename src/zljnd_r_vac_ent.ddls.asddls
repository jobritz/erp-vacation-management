@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Vacation Entitlement'

define view entity ZLJND_R_VAC_ENT
  as select from zljnd_vac_ent
  association to parent ZLJND_R_EMPLOYEE as _employee on $projection.EmployeeUuid = _employee.EmployeeUuid
  
{
  key vacation_entitlement_uuid as VacationEntitlementUuid,
      employee_uuid             as EmployeeUuid,
      current_year              as CurrentYear,
      remaining_annual_leave    as RemainingAnnualLeave,

      /* Administrative Data */
      created_by                as CreatedBy,
      created_at                as CreatedAt,
      last_changed_by           as LastChangedBy,
      last_changed_at           as LastChangedAt,
      
      _employee
}
