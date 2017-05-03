*** Settings ***
Resource             page_login.robot
Resource             ../credentials/dashboard_variables.robot

*** Keywords ***
perform_logout
    Wait Until Page Contains Element       ${logout_menu}
    click element                          ${logout_menu}
    Wait Until Page Contains Element       ${logout_submenu}
    click element                          ${logout_submenu}
    Wait Until Page Contains               ${login_pg_label_login}
    Title Should be                        ${login_pg_title}
    
perform_search
    Wait Until Page Contains Element       ${dashboard_pg_search_field}  
    click element                          ${dashboard_pg_search_field}  
    Input Text                             ${dashboard_pg_search_field}         ${search_word_1}
    click element                          ${dashboard_pg_search_btn} 
    #this test is going to fail since nothing happens with search         
    Wait Until Page Contains               ${dashboard_pg_search_result_msg}
    
test_links
    Wait Until Page Contains Element       ${dashboard_pg_link_dashboard} 
    click element                          ${dashboard_pg_link_dashboard} 
    Wait Until Page Contains               ${page_content_dashboard}
    Page Should Contain                    ${page_content_dashboard}
   
    #this is failing every second time    
    Wait Until Page Contains Element       ${dashboard_pg_link_bill} 
    click element                          ${dashboard_pg_link_bill} 
    Wait Until Page Contains               ${page_content}
    Page Should Contain                    ${page_content}
    
                
    Wait Until Page Contains Element       ${dashboard_pg_link_client}
    click element                          ${dashboard_pg_link_client}
    Wait Until Page Contains               ${page_content}
    Page Should Contain                    ${page_content}
   
                         
    Wait Until Page Contains Element       ${dashboard_pg_link_reservation} 
    click element                          ${dashboard_pg_link_reservation}
    Wait Until Page Contains               ${page_content} 
    Page Should Contain                    ${page_content}
    
                   
    Wait Until Page Contains Element       ${dashboard_pg_link_user}
    click element                          ${dashboard_pg_link_user}
    Wait Until Page Contains               ${page_content}
    Page Should Contain                    ${page_content}
    
                              
Test_user_link_2_times_in_a_row
    Wait Until Page Contains Element       ${dashboard_pg_link_user}
    #this test is going to fail due to error in system, Access denied-message is shown
    click element                          ${dashboard_pg_link_user}
    Go back
    click element                          ${dashboard_pg_link_user}
    Page Should Contain                    ${page_content}
    
        
