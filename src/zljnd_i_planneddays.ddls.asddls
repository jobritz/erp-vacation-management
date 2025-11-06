@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Planned Vacation Days'

define view entity ZLJND_I_PlannedDays
  as select from zljnd_vac_req
{
  key vacation_request_uuid       as VacationRequestUuid,
      applicant_uuid              as ApplicantUuid,
      substring(start_date, 1, 4) as RequestYear,
      vacation_days               as FilteredDays
}
where
      start_date > $session.system_date
  and status     != 'A'
