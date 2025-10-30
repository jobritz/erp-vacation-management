@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Vacation Request'
@Metadata.allowExtensions: true

define view entity ZLJND_C_VAC_REQ
  as projection on ZLJND_R_VAC_REQ
{
  key VacationRequestUuid,
      @ObjectModel.text.element: [ 'ApplicantName' ]
      @UI.textArrangement: #TEXT_ONLY
      ApplicantUuid,
      @ObjectModel.text.element: [ 'ApproverName' ]
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLJND_I_ApproverVH', element: 'EmployeeUuid' } }]
      ApproverUuid,
      StartDate,
      EndDate,
      VacationDays,
      Details,
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      ApproverName,
      ApplicantName,

      _employee : redirected to parent ZLJND_C_EMPLOYEE
}
