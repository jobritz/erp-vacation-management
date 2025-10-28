@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Vacation Request Approver'
define view entity ZLJND_I_ApproverVH
  as select from zljnd_employee
{
      @UI.hidden: true
  key employee_uuid as EmployeeUuid,
      employee_id   as EmployeeId,
      first_name    as FirstName,
      last_name     as LastName,
      entry_date    as EntryDate
}
