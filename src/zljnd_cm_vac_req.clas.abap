CLASS zljnd_cm_vac_req DEFINITION
  PUBLIC INHERITING FROM cx_static_check FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.


    CONSTANTS:
      BEGIN OF test_message,
        msgid TYPE symsgid      VALUE 'ZLJND_CM_VAC_REQ',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'USER_NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF test_message.

    CONSTANTS:
      BEGIN OF ShowRejection,
        msgid TYPE symsgid      VALUE 'ZLJND_CM_VAC_REQ',
        msgno TYPE symsgno      VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF showrejection.

    CONSTANTS:
      BEGIN OF ShowApplicationWasProcessed,
        msgid TYPE symsgid      VALUE 'ZLJND_CM_VAC_REQ',
        msgno TYPE symsgno      VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF showapplicationwasprocessed.

    CONSTANTS:
      BEGIN OF ShowApproving,
        msgid TYPE symsgid      VALUE 'ZLJND_CM_VAC_REQ',
        msgno TYPE symsgno      VALUE '004',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF sHOWAPPROVING.



    DATA user_name TYPE syuname.

    METHODS constructor
      IMPORTING
        severity  TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid    LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
        !previous LIKE previous OPTIONAL
        user_name TYPE syuname OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zljnd_cm_vac_req IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_Generation.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.
    me->user_name = user_name.
  ENDMETHOD.
ENDCLASS.
