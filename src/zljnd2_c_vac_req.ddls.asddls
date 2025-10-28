@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Vacation Request'
@Metadata.allowExtensions: true

define view entity ZLJND2_C_VAC_REQ
  as projection on ZLJND2_R_VAC_REQ
{
  key VacationRequestUuid,
      ApplicantUuid,
      //@ObjectModel.text.element: [ 'ApproverName' ]
      ApproverUuid,
      StartDate,
      EndDate,
      VacationDays,
      Details,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt
      
      //ApproverName,
      
    //  _employee : redirected to parent ZLJND2_C_EMPLOYEE
}
