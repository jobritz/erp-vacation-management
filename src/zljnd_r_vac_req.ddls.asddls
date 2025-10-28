@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Vacation Request'

define view entity ZLJND_R_VAC_REQ
  as select from zljnd_vac_req
  association to parent ZLJND_R_EMPLOYEE as _employee on $projection.ApplicantUuid = _employee.EmployeeUuid
{
  key vacation_request_uuid as VacationRequestUuid,
      applicant_uuid        as ApplicantUuid,
      approver_uuid         as ApproverUuid,
      start_date            as StartDate,
      end_date              as EndDate,
      vacation_days         as VacationDays,
      details               as Details,
      status                as Status,

      /* Administrative Data */
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      
      _employee
      
}
