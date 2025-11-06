CLASS lhc_VacationRequest DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR VacationRequest RESULT result.

    METHODS Approve FOR MODIFY
      IMPORTING keys FOR ACTION VacationRequest~Approve RESULT result.

    METHODS Reject FOR MODIFY
      IMPORTING keys FOR ACTION VacationRequest~Reject RESULT result.

ENDCLASS.

CLASS lhc_VacationRequest IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD Approve.
  ENDMETHOD.

  METHOD Reject.
  ENDMETHOD.

ENDCLASS.
