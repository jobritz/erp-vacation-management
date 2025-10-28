@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Text Element for Customer'
define view entity ZLJND_I_EMPLOYEETEXT
  as select from zljnd_employee
{
  key employee_uuid,
      first_name,
      last_name,

      concat_with_space(first_name, last_name, 1) as Name
}
