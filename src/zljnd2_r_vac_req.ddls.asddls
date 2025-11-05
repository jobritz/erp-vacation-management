@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View Vacation Request'

define root view entity ZLJND2_R_VAC_REQ
  as select from zljnd_vac_req
  association to ZLJND_I_EMPLOYEETEXT    as _approvertext  on $projection.ApproverUuid = _approvertext.employee_uuid
  association to ZLJND_I_EMPLOYEETEXT    as _applicanttext on $projection.ApplicantUuid = _applicanttext.employee_uuid
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
      
       _approvertext.Name     as ApproverName,
      _applicanttext.Name    as ApplicantName
      
      
      
    
      
}
