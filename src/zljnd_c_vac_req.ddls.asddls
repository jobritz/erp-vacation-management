@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Vacation Request'
@Metadata.allowExtensions: true

define view entity ZLJND_C_VAC_REQ
  as projection on ZLJND_R_VAC_REQ
{
  key VacationRequestUuid,
      @ObjectModel.text.element: [ 'ApplicantName' ]
      ApplicantUuid,
      @ObjectModel.text.element: [ 'ApproverName' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZLJND_I_ApproverVH', element: 'EmployeeUuid' } }]
      ApproverUuid,
      StartDate,
      EndDate,
      VacationDays,
      Details,
      @ObjectModel.text.element: [ 'StatusText' ]
      Status,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      StatusText,

      ApproverName,
      ApplicantName,

      _employee : redirected to parent ZLJND_C_EMPLOYEE
}
