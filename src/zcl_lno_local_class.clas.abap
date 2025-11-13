CLASS zcl_lno_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lno_local_class IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* First Instance
**********************************************************************

    TRY.
        connection = NEW #( i_carrier_id = 'LH'
                            i_connection = '0400' ).

*        connection->set_attributes(
*          EXPORTING
*            i_carrier_id = 'LH'
*            i_connection = '0400'
*        ).

*       connection->carrier_id = 'LH'.
*       connection->connection = '0400'.

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Second Instance
**********************************************************************
    TRY.
        connection = NEW #( i_carrier_id = 'AA'
                            i_connection = '0017' ).

*        connection->set_attributes(
*          EXPORTING
*            i_carrier_id = 'AA'
*            i_connection = '0017'
*        ).

*       connection->carrier_id = 'LH'.
*       connection->connection = '0400'.

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Third Instance
**********************************************************************
    TRY.
        connection = NEW #(             i_carrier_id = 'SQ'
                i_connection = '0001'
         ).

*        connection->set_attributes(
*          EXPORTING
*            i_carrier_id = 'SQ'
*            i_connection = '0001'
*        ).

*       connection->carrier_id = 'LH'.
*       connection->connection = '0400'.

        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

*    LOOP AT connections INTO connection.
*      out->write( |Entry number: { sy-tabix }| ).
*      out->write( |Carrier ID: { connection->carrier_id } Connection ID: { connection->connection }| ).
*      out->write( space ).
*    ENDLOOP.

    LOOP AT connections INTO connection.
      out->write( |Entry number: { sy-tabix }| ).
      out->write( connection->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
