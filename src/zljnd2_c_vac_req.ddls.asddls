@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Vacation Request'
@Metadata.allowExtensions: true
@Search.searchable: true

define root view entity ZLJND2_C_VAC_REQ
  as projection on ZLJND2_R_VAC_REQ
{
  key VacationRequestUuid,

      @ObjectModel.text.element: [ 'ApplicantName' ]
      @UI.textArrangement: #TEXT_ONLY
      ApplicantUuid,
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.element: [ 'ApproverName' ]
      ApproverUuid,
      StartDate,
      EndDate,
      VacationDays,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Details,
      Status,


      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,

      ApproverName,
      ApplicantName


}
