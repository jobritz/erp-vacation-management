CLASS lhc_VacationRequest DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR VacationRequest RESULT result.

    METHODS Approve FOR MODIFY
      IMPORTING keys FOR ACTION VacationRequest~Approve RESULT result.

    METHODS Reject FOR MODIFY
      IMPORTING keys FOR ACTION VacationRequest~Reject RESULT result.

*    METHODS showtestmessage FOR MODIFY
*      IMPORTING keys FOR ACTION VacationRequest~ShowTestMessage.

    METHODS ShowApplicationWasProcessed FOR MODIFY
      IMPORTING keys   FOR ACTION VacationRequest~ApplicationProcessed
      RESULT    result.

ENDCLASS.

CLASS lhc_VacationRequest IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

*  METHOD showtestmessage.
*    DATA message TYPE REF TO zljnd_cm_vac_req.
*
*    message = NEW zljnd_cm_vac_req( severity = if_abap_behv_message=>severity-success
*                                    textid = zljnd_cm_vac_req=>test_message
*                                    user_name = sy-uname ).
*  ENDMETHOD.

  METHOD Approve.
    DATA message TYPE REF TO zljnd_cm_vac_req.

    READ ENTITY IN LOCAL MODE zljnd2_r_vac_req
    FIELDS ( Status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(reqs).

    LOOP AT reqs REFERENCE INTO DATA(req).

      IF req->Status <> 'B'.
        message = NEW zljnd_cm_vac_req( severity = if_abap_behv_message=>severity-error
                                        textid = zljnd_cm_vac_req=>showapplicationwasprocessed ).
        APPEND VALUE #( %tky = req->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg = message ) TO reported-vacationrequest.

        APPEND VALUE #( %tky = req->%tky ) TO failed-vacationrequest.
        CONTINUE.
      ENDIF.

      req->Status = 'G'.

      message = NEW zljnd_cm_vac_req( severity = if_abap_behv_message=>severity-success
                                      textid = zljnd_cm_vac_req=>showapproving ).

      APPEND VALUE #( %tky = req->%tky
                      %element = VALUE #( Status = if_abap_behv=>mk-on )
                      %msg = message ) TO reported-vacationrequest.

    ENDLOOP.

    MODIFY ENTITY IN LOCAL MODE zljnd2_r_vac_req
    UPDATE FIELDS ( Status )
    WITH VALUE #( FOR r IN reqs ( %tky = r-%tky Status = r-Status ) ).

    result = VALUE #( FOR r IN reqs
                      ( %tky   = r-%tky
                        %param = r ) ).

  ENDMETHOD.

  METHOD Reject.
    DATA message TYPE REF TO zljnd_cm_vac_req.

    READ ENTITY IN LOCAL MODE zljnd2_r_vac_req
    FIELDS ( Status )
    WITH CORRESPONDING #( keys )
    RESULT DATA(reqs).

    LOOP AT reqs REFERENCE INTO DATA(req).

      IF req->Status <> 'B'.
        message = NEW zljnd_cm_vac_req( severity = if_abap_behv_message=>severity-error
                                        textid = zljnd_cm_vac_req=>showapplicationwasprocessed ).

        APPEND VALUE #( %tky = req->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg = message ) TO reported-vacationrequest.

        APPEND VALUE #( %tky = req->%tky ) TO failed-vacationrequest.
        CONTINUE.
      ENDIF.

      req->Status = 'A'.

      message = NEW zljnd_cm_vac_req( severity = if_abap_behv_message=>severity-success
                                      textid = zljnd_cm_vac_req=>showrejection ).

      APPEND VALUE #( %tky = req->%tky
                      %element = VALUE #( Status = if_abap_behv=>mk-on )
                      %msg = message ) TO reported-vacationrequest.

    ENDLOOP.

    MODIFY ENTITY IN LOCAL MODE zljnd2_r_vac_req
    UPDATE FIELDS ( Status )
    WITH VALUE #( FOR r IN reqs ( %tky = r-%tky Status = r-Status ) ).

    result = VALUE #( FOR r IN reqs
                      ( %tky   = r-%tky
                        %param = r ) ).

  ENDMETHOD.

  METHOD showapplicationwasprocessed.
    DATA message TYPE REF TO zljnd_cm_vac_req.

    message = NEW zljnd_cm_vac_req( severity = if_abap_behv_message=>severity-success
                                    textid = zljnd_cm_vac_req=>showapplicationwasprocessed ).

  ENDMETHOD.



ENDCLASS.
