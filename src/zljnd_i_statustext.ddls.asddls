@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text Element for Status'
define view entity ZLJND_I_StatusText
  as select from zljnd_vac_req
{
  key vacation_request_uuid,
      status,

      case
        when status = 'B' then 'Beantragt'
        when status = 'A' then 'Abgelehnt'
        when status = 'G' then 'Genehmigt'
        else ''
      end as StatusText

}
