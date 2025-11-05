@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text Element for Used Vacation Days'

define view entity ZLJND_I_UsedDaysText
  as select from zljnd_vac_ent
  association to ZLJND_I_UsedDays as _useddays on $projection.EmployeeUuid = _useddays.ApplicantUuid
{
  key vacation_entitlement_uuid     as VacationEntitlementUuid,
      employee_uuid                 as EmployeeUuid,
      sum( _useddays.FilteredDays ) as UsedDays
      
}
where
  _useddays.RequestYear = current_year
group by
  vacation_entitlement_uuid,
  employee_uuid
