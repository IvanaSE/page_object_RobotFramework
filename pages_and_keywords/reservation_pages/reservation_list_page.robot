*** Settings ***

Resource                ../page_dashboard.robot

*** Variables ***

${reservation_list_pg_title}                                  List
${reservation_list_pg_expected_title}                         Reservation
${reservation_list_pg_content}                                List
${reservation_list_pg_btn_create_new_reservation}             link=Create New Hotel Reservation
#this is edit button at the first element in the list of reservations
${reservation_list_pg_btn_edit}                               xpath=//*[@id="j_idt49"]/table/tbody/tr[1]/td[8]/a[2]

*** Keywords ***
go_to_new_hotel_reservation_page
    Wait Until Page Contains Element                           ${reservation_list_pg_btn_create_new_reservation} 
    Click element                                              ${reservation_list_pg_btn_create_new_reservation} 
    
go_to_edit_reservation_page
    Wait Until Page Contains Element                           ${reservation_list_pg_btn_edit}   
    Click element                                              ${reservation_list_pg_btn_edit}               
    


