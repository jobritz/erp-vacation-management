CLASS zljnd_cm_vac_req DEFINITION
  PUBLIC INHERITING FROM cx_static_check FINAL CREATE PUBLIC.






  PUBLIC SECTION.

  INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.


  CONSTANTS:
      BEGIN OF test_message,
        msgid TYPE symsgid      VALUE '',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF test_message.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zljnd_cm_vac_req IMPLEMENTATION.
ENDCLASS.
