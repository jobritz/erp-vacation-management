@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text Element for Planned Vacation Days'

define view entity ZLJND_I_PlannedDaysText
  as select from zljnd_vac_ent
  association to ZLJND_I_PlannedDays as _planneddays on $projection.EmployeeUuid = _planneddays.ApplicantUuid
{
  key vacation_entitlement_uuid        as VacationEntitlementUuid,
      employee_uuid                    as EmployeeUuid,
      sum( _planneddays.FilteredDays ) as PlannedDays
      
}
where
  _planneddays.RequestYear = current_year
group by
  vacation_entitlement_uuid,
  employee_uuid
