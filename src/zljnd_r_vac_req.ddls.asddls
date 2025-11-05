@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Vacation Request'

define view entity ZLJND_R_VAC_REQ
  as select from zljnd_vac_req
  association to parent ZLJND_R_EMPLOYEE as _employee      on $projection.ApplicantUuid = _employee.EmployeeUuid
  association to ZLJND_I_EMPLOYEETEXT    as _approvertext  on $projection.ApproverUuid = _approvertext.employee_uuid
  association to ZLJND_I_EMPLOYEETEXT    as _applicanttext on $projection.ApplicantUuid = _applicanttext.employee_uuid
  association to ZLJND_I_StatusText      as _statustext    on $projection.VacationRequestUuid = _statustext.vacation_request_uuid
{
  key vacation_request_uuid  as VacationRequestUuid,
      applicant_uuid         as ApplicantUuid,
      approver_uuid          as ApproverUuid,
      start_date             as StartDate,
      end_date               as EndDate,
      vacation_days          as VacationDays,
      details                as Details,
      status                 as Status,

      /* Administrative Data */
      @Semantics.user.createdBy: true
      created_by             as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at             as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by        as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at        as LastChangedAt,

      _employee,
      _approvertext.Name     as ApproverName,
      _applicanttext.Name    as ApplicantName,
      _statustext.StatusText as StatusText

}
