CLASS zljnd_cl_test_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zljnd_cl_test_data_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA ls_hans_maier TYPE zljnd_employee.
    DATA ls_lisa_mueller TYPE zljnd_employee.
    DATA ls_petra_schmid TYPE zljnd_employee.
    DATA lt_employee TYPE TABLE OF zljnd_employee.

    DATA ls_vac_ent TYPE zljnd_vac_ent.
    DATA lt_vac_ent TYPE TABLE OF zljnd_vac_ent.

    DATA ls_vac_req TYPE zljnd_vac_req.
    DATA lt_vac_req TYPE TABLE OF zljnd_vac_req.

    " Delete Employees:
    DELETE FROM zljnd_employee.
    out->write( |Deleted Employees: { sy-dbcnt }| ).

    " Delete Vacation Entitlements:
    DELETE FROM zljnd_vac_ent.
    out->write( |Deleted Employees: { sy-dbcnt }| ).

    " Delete Vacation Reqeusts:
    DELETE FROM zljnd_vac_req.
    out->write( |Deleted Employees: { sy-dbcnt }| ).

    " Create Employees
    " Hans Maier
    ls_hans_maier-client = sy-mandt.
    ls_hans_maier-created_by = 'GENERATOR'.
    ls_hans_maier-last_changed_by = 'GENERATOR'.
    ls_hans_maier-employee_id = '1'.
    ls_hans_maier-first_name = 'Hans'.
    ls_hans_maier-last_name = 'Maier'.
    ls_hans_maier-entry_date = '20000501'.
    TRY.
        ls_hans_maier-employee_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    GET TIME STAMP FIELD ls_hans_maier-created_at.
    GET TIME STAMP FIELD ls_hans_maier-last_change_at.

    APPEND ls_hans_maier TO lt_employee.

    ls_vac_ent-client = sy-mandt.
    ls_vac_ent-created_by = 'GENERATOR'.
    ls_vac_ent-last_changed_by = 'GENERATOR'.
    ls_vac_ent-employee_uuid = ls_hans_maier-employee_uuid.
    ls_vac_ent-current_year = '2022'.
    ls_vac_ent-remaining_annual_leave = '30'.
    TRY.
        ls_vac_ent-vacation_entitlement_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    GET TIME STAMP FIELD ls_vac_ent-created_at.
    GET TIME STAMP FIELD ls_vac_ent-last_changed_at.
    APPEND ls_vac_ent TO lt_vac_ent.

    ls_vac_ent-client = sy-mandt.
    ls_vac_ent-created_by = 'GENERATOR'.
    ls_vac_ent-last_changed_by = 'GENERATOR'.
    ls_vac_ent-employee_uuid = ls_hans_maier-employee_uuid.
    ls_vac_ent-current_year = '2023'.
    ls_vac_ent-remaining_annual_leave = '30'.
    TRY.
        ls_vac_ent-vacation_entitlement_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    GET TIME STAMP FIELD ls_vac_ent-created_at.
    GET TIME STAMP FIELD ls_vac_ent-last_changed_at.
    APPEND ls_vac_ent TO lt_vac_ent.

    " Lisa Müller
    ls_lisa_mueller-client = sy-mandt.
    ls_lisa_mueller-created_by = 'GENERATOR'.
    ls_lisa_mueller-last_changed_by = 'GENERATOR'.
    ls_lisa_mueller-employee_id = '2'.
    ls_lisa_mueller-first_name = 'Lisa'.
    ls_lisa_mueller-last_name = 'Müller'.
    ls_lisa_mueller-entry_date = '20100701'.
    TRY.
        ls_lisa_mueller-employee_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    GET TIME STAMP FIELD ls_lisa_mueller-created_at.
    GET TIME STAMP FIELD ls_lisa_mueller-last_change_at.

    APPEND ls_lisa_mueller TO lt_employee.

    ls_vac_ent-client = sy-mandt.
    ls_vac_ent-created_by = 'GENERATOR'.
    ls_vac_ent-last_changed_by = 'GENERATOR'.
    ls_vac_ent-employee_uuid = ls_lisa_mueller-employee_uuid.
    ls_vac_ent-current_year = '2023'.
    ls_vac_ent-remaining_annual_leave = '30'.
    TRY.
        ls_vac_ent-vacation_entitlement_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    GET TIME STAMP FIELD ls_vac_ent-created_at.
    GET TIME STAMP FIELD ls_vac_ent-last_changed_at.
    APPEND ls_vac_ent TO lt_vac_ent.

    " Petra Schmid
    ls_petra_schmid-client = sy-mandt.
    ls_petra_schmid-created_by = 'GENERATOR'.
    ls_petra_schmid-last_changed_by = 'GENERATOR'.
    ls_petra_schmid-employee_id = '3'.
    ls_petra_schmid-first_name = 'Petra'.
    ls_petra_schmid-last_name = 'Schmid'.
    ls_petra_schmid-entry_date = '20231001'.
    TRY.
        ls_petra_schmid-employee_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    GET TIME STAMP FIELD ls_petra_schmid-created_at.
    GET TIME STAMP FIELD ls_petra_schmid-last_change_at.

    APPEND ls_petra_schmid TO lt_employee.

    ls_vac_ent-client = sy-mandt.
    ls_vac_ent-created_by = 'GENERATOR'.
    ls_vac_ent-last_changed_by = 'GENERATOR'.
    ls_vac_ent-employee_uuid = ls_petra_schmid-employee_uuid.
    ls_vac_ent-current_year = '2023'.
    ls_vac_ent-remaining_annual_leave = '7'.
    TRY.
        ls_vac_ent-vacation_entitlement_uuid = cl_system_uuid=>create_uuid_x16_static(  ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.
    GET TIME STAMP FIELD ls_vac_ent-created_at.
    GET TIME STAMP FIELD ls_vac_ent-last_changed_at.
    APPEND ls_vac_ent TO lt_vac_ent.

  ENDMETHOD.

ENDCLASS.
