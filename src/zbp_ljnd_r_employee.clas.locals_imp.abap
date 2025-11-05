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

    METHODS DetermineRemainingDays FOR DETERMINE ON MODIFY
      IMPORTING keys FOR VacationEntitlement~DetermineRemainingDays.

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
    ENDLOOP.

  ENDMETHOD.

  METHOD notenoughvacationleft.

  ENDMETHOD.

  METHOD determinestatus.

    READ ENTITY IN LOCAL MODE zljnd_r_vac_req
    FIELDS ( Status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(requests).

    LOOP AT requests REFERENCE INTO DATA(request).

      IF request->Status = 'B'.
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
    RESULT DATA(requests).

    LOOP AT requests REFERENCE INTO DATA(request).

      TRY.
          DATA(calendar) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
          DATA(vacation_days) = ( calendar->calc_workingdays_between_dates( iv_start = request->StartDate iv_end = request->EndDate ) + 1 ) .
        CATCH cx_fhc_runtime.
          CONTINUE.
      ENDTRY.

      IF request->VacationDays = vacation_days.
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

  METHOD determineremainingdays.

    READ ENTITY IN LOCAL MODE zljnd_r_vac_ent
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(entitlements).

    LOOP AT entitlements REFERENCE INTO DATA(entitlement).


      READ ENTITY IN LOCAL MODE zljnd_r_vac_req
      FIELDS ( VacationDays Status )
      WITH CORRESPONDING #( keys )
      RESULT DATA(requests).

      DATA remaining_days TYPE i.

      LOOP AT requests REFERENCE INTO DATA(request).
        IF request->Status = 'G'.
          remaining_days = remaining_days + request->VacationDays.
        ENDIF.
      ENDLOOP.

      IF entitlement->RemainingDays = remaining_days.
        CONTINUE.
      ENDIF.

      MODIFY ENTITY IN LOCAL MODE zljnd_r_vac_ent
               UPDATE FIELDS ( RemainingDays )
               WITH VALUE #( FOR key IN keys
                             ( %tky         = key-%tky
                               RemainingDays = 10
                               %control-RemainingDays = if_abap_behv=>mk-on ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
