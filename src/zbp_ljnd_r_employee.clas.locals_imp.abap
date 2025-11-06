CLASS lhc_ZLJND_R_EMPLOYEE DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Employee RESULT result.

    METHODS validatedates FOR VALIDATE ON SAVE
      IMPORTING keys FOR VacationRequest~ValidateDates.

    METHODS notenoughvacationleft FOR VALIDATE ON SAVE
      IMPORTING keys FOR VacationRequest~NotEnoughVacationLeft.

    METHODS determinestatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationRequest~DetermineStatus.

    METHODS determinedaysoff FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationRequest~DetermineDaysOff.

ENDCLASS.

CLASS lhc_ZLJND_R_EMPLOYEE IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validatedates.

    DATA message TYPE REF TO zljnd_cm_employee.

    READ ENTITY IN LOCAL MODE zljnd_r_vac_req
         FIELDS ( StartDate EndDate )
         WITH CORRESPONDING #( keys )
         RESULT DATA(vacationrequests).

    LOOP AT vacationrequests INTO DATA(vacationrequest).
      IF vacationrequest-EndDate < vacationrequest-StartDate.

        message = NEW zljnd_cm_employee( textid = zljnd_cm_employee=>invalid_dates ).

        APPEND VALUE #( %tky = vacationrequest-%tky
                        %msg = message ) TO reported-vacationrequest.

        APPEND VALUE #( %tky = vacationrequest-%tky ) TO failed-vacationrequest.

      ENDIF.

      IF vacationrequest-StartDate+0(4) <> vacationrequest-EndDate+0(4).

        message = NEW zljnd_cm_employee( textid = zljnd_cm_employee=>different_years ).

        APPEND VALUE #( %tky = vacationrequest-%tky
                        %msg = message ) TO reported-vacationrequest.

        APPEND VALUE #( %tky = vacationrequest-%tky ) TO failed-vacationrequest.

      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD notenoughvacationleft.

    DATA message TYPE REF TO zljnd_cm_employee.

    READ ENTITY IN LOCAL MODE zljnd_r_vac_req
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(vacationrequests).

    LOOP AT vacationrequests INTO DATA(vacationrequest).

      TRY.
          DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          DATA(vacation_days) = ( calendar->calc_workingdays_between_dates( iv_start = vacationrequest-StartDate iv_end = vacationrequest-EndDate ) + 1 ) .
        CATCH cx_fhc_runtime.
          CONTINUE.
      ENDTRY.

      SELECT SINGLE FROM zljnd_r_vac_ent FIELDS RemainingDays WHERE CurrentYear = @vacationrequest-StartDate+0(4) INTO @DATA(remaining_days).

      IF remaining_days < vacation_days.
        message = NEW zljnd_cm_employee( textid = zljnd_cm_employee=>not_enough_vacation_left ).

        APPEND VALUE #( %tky = vacationrequest-%tky
                        %msg = message ) TO reported-vacationrequest.

        APPEND VALUE #( %tky = vacationrequest-%tky ) TO failed-vacationrequest.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD determinestatus.

    READ ENTITY IN LOCAL MODE zljnd_r_vac_req
    FIELDS ( Status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(vacationrequests).

    LOOP AT vacationrequests INTO DATA(vacationrequest).

      IF vacationrequest-Status = 'B'.
        CONTINUE.
      ENDIF.

      MODIFY ENTITY IN LOCAL MODE zljnd_r_vac_req
           UPDATE FIELDS ( Status )
           WITH VALUE #( FOR key IN keys
                         ( %tky   = key-%tky
                           Status = 'B' ) ).

    ENDLOOP.
  ENDMETHOD.

  METHOD determinedaysoff.

    READ ENTITY IN LOCAL MODE zljnd_r_vac_req
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(vacationrequests).

    LOOP AT vacationrequests INTO DATA(vacationrequest).

      TRY.
          DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          DATA(vacation_days) = ( calendar->calc_workingdays_between_dates( iv_start = vacationrequest-StartDate iv_end = vacationrequest-EndDate ) + 1 ) .
        CATCH cx_fhc_runtime.
          CONTINUE.
      ENDTRY.

      IF vacationrequest-VacationDays = vacation_days.
        CONTINUE.
      ENDIF.

      MODIFY ENTITY IN LOCAL MODE zljnd_r_vac_req
             UPDATE FIELDS ( VacationDays )
             WITH VALUE #( FOR key IN keys
                           ( %tky         = key-%tky
                             VacationDays = vacation_days
                             %control-VacationDays = if_abap_behv=>mk-on ) ).

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
