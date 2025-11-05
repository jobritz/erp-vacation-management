@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Vacation Entitlement'

define view entity ZLJND_R_VAC_ENT
  as select from zljnd_vac_ent
  association to parent ZLJND_R_EMPLOYEE as _employee    on $projection.EmployeeUuid = _employee.EmployeeUuid
  association to ZLJND_I_UsedDaysText    as _useddays    on $projection.VacationEntitlementUuid = _useddays.VacationEntitlementUuid
  association to ZLJND_I_PlannedDaysText as _planneddays on $projection.VacationEntitlementUuid = _planneddays.VacationEntitlementUuid
{
  key vacation_entitlement_uuid                                                              as VacationEntitlementUuid,
      employee_uuid                                                                          as EmployeeUuid,
      current_year                                                                           as CurrentYear,
      annual_leave                                                                           as AnnualLeave,

      /* Administrative Data */
      @Semantics.user.createdBy: true
      created_by                                                                             as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                                                                             as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by                                                                        as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at                                                                        as LastChangedAt,

      _employee,

      _useddays.UsedDays                                                                     as UsedDays,
      _planneddays.PlannedDays                                                               as PlannedDays,

      annual_leave - coalesce(_useddays.UsedDays, 0) - coalesce(_planneddays.PlannedDays, 0) as RemainingDays
}
