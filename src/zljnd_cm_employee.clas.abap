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
        attr1  TYPE scx_attrname VALUE '',
        attr2  TYPE scx_attrname VALUE '',
        attr3  TYPE scx_attrname VALUE '',
        attr4  TYPE scx_attrname VALUE '',
      END OF NOT_ENOUGH_VACATION_LEFT.


METHODS constructor
  IMPORTING
    severity  TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
    textid    LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
    !previous LIKE previous OPTIONAL.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zljnd_cm_employee IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.

    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.

  ENDMETHOD.

ENDCLASS.
