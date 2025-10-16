@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Vacation Request'
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity ZLJND_C_VAC_REQ
  as projection on ZLJND_R_VAC_REQ
{
  key VacationRequestUuid,
      ApplicantUuid,
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
      LastChangedAt
}
