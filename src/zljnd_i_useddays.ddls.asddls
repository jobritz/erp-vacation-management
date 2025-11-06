@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Used Vacation Days'

define view entity ZLJND_I_UsedDays
  as select from zljnd_vac_req
{
  key vacation_request_uuid       as VacationRequestUuid,
      applicant_uuid              as ApplicantUuid,
      substring(start_date, 1, 4) as RequestYear,
      vacation_days               as FilteredDays

}
where
      end_date < $session.system_date
  and status   != 'A'
