CLASS zljnd_cm_employee DEFINITION
  INHERITING FROM cx_static_check
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    CONSTANTS:
      BEGIN OF invalid_dates,
        msg_id TYPE symsgid VALUE 'ZLJND_EMPLOYEE',
        msgno  TYPE symsgno VALUE '001',
        attr1  TYPE scx_attrname VALUE '',
        attr2  TYPE scx_attrname VALUE '',
        attr3  TYPE scx_attrname VALUE '',
        attr4  TYPE scx_attrname VALUE '',
      END OF invalid_dates.

    CONSTANTS:
      BEGIN OF not_enough_vacation_left,
        msg_id TYPE symsgid VALUE 'ZLJND_EMPLOYEE',
        msgno  TYPE symsgno VALUE '002',
        attr1  TYPE scx_attrname VALUE 'REMAINING_VACATION_DAYS',
        attr2  TYPE scx_attrname VALUE 'REQUESTED_VACATION_DAYS',
        attr3  TYPE scx_attrname VALUE '',
        attr4  TYPE scx_attrname VALUE '',
      END OF not_enough_vacation_left.

    CONSTANTS:
      BEGIN OF different_years,
        msg_id TYPE symsgid VALUE 'ZLJND_EMPLOYEE',
        msgno  TYPE symsgno VALUE '003',
        attr1  TYPE scx_attrname VALUE '',
        attr2  TYPE scx_attrname VALUE '',
        attr3  TYPE scx_attrname VALUE '',
        attr4  TYPE scx_attrname VALUE '',
      END OF different_years.


    DATA remaining_vacation_days TYPE i.
    DATA requested_vacation_days TYPE i.

    METHODS constructor
      IMPORTING
        severity                TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid                  LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
        !previous               LIKE previous OPTIONAL
        remaining_vacation_days TYPE i OPTIONAL
        requested_vacation_days TYPE i OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zljnd_cm_employee IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.
    me->remaining_vacation_days = remaining_vacation_days.
    me->requested_vacation_days = requested_vacation_days.

  ENDMETHOD.

ENDCLASS.
