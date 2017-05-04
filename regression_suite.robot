*** Settings ***
Library            Selenium2Library
Library            OperatingSystem
Resource           ./pages_and_keywords/test_setup_and_teardown.robot
Resource           ./pages_and_keywords/page_login.robot
Resource           ./pages_and_keywords/page_dashboard.robot
Resource            ./pages_and_keywords/reservation_pages/create_new_reservation_page.robot

Test setup        Setup
Test teardown     Teardown


***Test cases ***
Test Case 1
    Test_login_into_the_system_as_admin  #det hämtas från page_login.robot
    perform_logout
    
Test Case 2    
    Test_login_into_the_system_as_common
    perform_logout
    
Test Case 3    #fail expected
    Test_login_into_the_system_as_common 
    perform_search
    perform_logout   

Test Case 4    
    Test_login_into_the_system_as_admin
    test_links
    perform_logout
    
Test Case 5    #fail expected
    Test_login_into_the_system_as_common
    Test_user_link_2_times_in_a_row
    perform_logout
    
Test Case 6
    Test_login_into_the_system_as_admin
    Test_user_link_2_times_in_a_row
    perform_logout
    
Test Case 7
    Test_login_into_the_system_as_admin  #precondition to test this test case and is taken from page_login.robot
    go_to_create_new_hotel_reservation_page
    create_new_reservation
    