*** Settings ***
Resource             page_login.robot
Resource             ../credentials/dashboard_variables.robot

*** Variables ***

${dashboard_pg_title}                 Dashboard
${logout_menu}                        xpath=//a[@class='dropdown-toggle']
${logout_submenu}                     xpath=//i[@class='fa fa-sign-out fa-fw']

${dashboard_pg_search_field}          xpath=//*[@id="side-menu"]/li[1]/div/input
${dashboard_pg_search_btn}            xpath=//*[@id="side-menu"]/li[1]/div/span/button/i
${dashboard_pg_search_result_msg}     Search results
#sidemenu
${dashboard_pg_link_dashboard}        link=Dashboard
${dashboard_pg_link_bedroom}          link=Bedroom
${dashboard_pg_link_bill}             link=Bill
${dashboard_pg_link_client}           link=Client
${dashboard_pg_link_reservation}      link=Reservation
${dashboard_pg_link_user}             link=User

${dashboard_page_content}             Dashboard

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
    Page Should Contain                    ${dashboard_page_content}
     
    Wait Until Page Contains Element       ${dashboard_pg_link_bill} 
    click element                          ${dashboard_pg_link_bill} 
    Page Should Contain                    ${page_content}
                
    Wait Until Page Contains Element       ${dashboard_pg_link_client}
    click element                          ${dashboard_pg_link_client}
    Page Should Contain                    ${page_content}
   
                         
    Wait Until Page Contains Element       ${dashboard_pg_link_reservation} 
    click element                          ${dashboard_pg_link_reservation}
    Page Should Contain                    ${page_content}
    
                   
    Wait Until Page Contains Element       ${dashboard_pg_link_user}
    click element                          ${dashboard_pg_link_user}
    Page Should Contain                    ${page_content}
    
                              
Test_user_link_2_times_in_a_row
    Wait Until Page Contains Element       ${dashboard_pg_link_user}
    #this test is going to fail due to error in system, Access denied-message is shown, when signed in as a common user
    click element                          ${dashboard_pg_link_user}
    Page Should Contain                    ${page_content}
    click element                          ${dashboard_pg_link_user}
    Page Should Contain                    ${page_content}
    
        
