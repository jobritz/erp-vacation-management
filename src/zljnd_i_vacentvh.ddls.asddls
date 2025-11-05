@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Vacation Entitlements'
define view entity ZLJND_I_VacEntVH
  as select from zljnd_vac_ent
{
  key vacation_entitlement_uuid,
      annual_leave,
      '00' as RemainingDays,
      '00' as PlannedDays,
      '00' as BookedDays

}
