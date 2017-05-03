*** Settings ***
Resource                                    page_list_reservation.robot
Resource                                    ../page_dashboard.robot

Library                                     String


*** Variables ***
${reservationlist_label_clients}           List
${create_new_reservation_page_title}       Create New Hotel Reservation
${dashboard_leftmenu_reservation}         xpath=//i[@class='fa fa-university fa-fw']
${reservationlist_button_createnew}        xpath=//a[@class='btn btn-primary']
${reservationlist_button_index}            xpath=//a[@class='btn btn-default']



${reservation_list_pg_btn_create_new_reservation}             xpath=//*[@id="j_idt49"]/a[1]
${reservation_create_new_btn_save}                            xpath=//a[@class='btn btn-primary']
${reservation_new_button_show_all_reservations}                xpath=//a[text()='Show All Reservations']
${reservation_new_message_success}                             Reservation was successfully created.
${reservation_new_select_bedroom}                              id=bedroomId
${reservation_new_select_client}                               id=clientId
${reservation_new_select_status}                              id=reservationStatusId  
${reservationnew_option_status_confirmed}                      1



*** Keywords ***
go_to_create_new_hotel_reservation_page
    Click Element                            ${dashboard_leftmenu_reservation} 
    Wait Until Page Contains                 ${create_new_reservation_page_title}   
    #Assertion that page contains create new button
    Page should contain element              ${reservationlist_button_createnew}
    Click Element                            ${reservationlist_button_createnew}
 

 create_new_reservation    
    #Enter data
    Select From List                        ${reservation_new_select_bedroom}                            
    Select From List                        ${reservation_new_select_client}                                 
    Select From List By Value               ${reservation_new_select_status}                      ${reservationnew_option_status_confirmed}
    
               
    
    #Save and go back to reservation list  --- FAIL!!
    Click Element                            ${reservation_create_new_btn_save}    
    Wait Until Page Contains                 ${reservation_new_message_success}     
    Click Element                            ${reservation_new_button_show_all_reservations}   
    Wait Until Page Contains                 ${reservationlist_label_clients}
    




