@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Vacation Entitlement'

define view entity ZLJND_R_VAC_ENT
  as select from zljnd_vac_ent
  association to parent ZLJND_R_EMPLOYEE as _employee on $projection.EmployeeUuid = _employee.EmployeeUuid
  association to ZLJND_I_VacEntVH   as _vacationentitlementvh on $projection.VacationEntitlementUuid = _vacationentitlementvh.vacation_entitlement_uuid
{
  key vacation_entitlement_uuid as VacationEntitlementUuid,
      employee_uuid             as EmployeeUuid,
      current_year              as CurrentYear,
      annual_leave              as AnnualLeave,

      /* Administrative Data */
      @Semantics.user.createdBy: true
      created_by                as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by           as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at           as LastChangedAt,

      _employee,
      _vacationentitlementvh,
      _vacationentitlementvh.PlannedDays as PlannedDays,
      _vacationentitlementvh.BookedDays as BookedDays,
      
      sum(_employee._vacationrequest.VacationDays) as RemainingDays 
}
group by
    vacation_entitlement_uuid,
    employee_uuid,
    current_year,
    annual_leave,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    _vacationentitlementvh.PlannedDays,
    _vacationentitlementvh.BookedDays

