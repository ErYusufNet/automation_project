*** Variables ***

#NAVBAR

${HOME}    xpath=//a[normalize-space()='Home']
${PRODUCTS}     xpath=//a[normalize-space()='Products']
${CART}     xpath=//a[normalize-space()='Cart']
${LOGIN}    xpath=//a[normalize-space()='Signup / Login']
${CONTACT_US}   xpath=//a[normalize-space()='Contact us']

${COOKIE}    xpath=//button[p[normalize-space()='İzin ver']]




#LOGIN

${LOGIN_EMAIL}    xpath=//input[@data-qa='login-email']
${LOGIN_PASSWORD}     xpath=//input[@placeholder='Password']
${LOGIN_BUTTON}   xpath=//button[normalize-space()='Login']
${LOGIN_TO_YOUR_ACCOUNT_MSG}    xpath=//div[contains(@class,'login-form')]//h2[normalize-space()='Login to your account']





#SIGN UP

${SIGNUP_NAME}     xpath=//input[@placeholder='Name']
${SIGNUP_EMAIL}    xpath=//input[@data-qa='signup-email']
${SIGNUP_BUTTON}   xpath=//button[normalize-space()='Signup']
${SIGNUP_PASSWORD}  xpath=//input[@id='password']
${DAY}      xpath=//select[@id='days']
${MONTH}    xpath=//select[@id='months']
${YEAR}     xpath=//select[@id='years']
${CHECKBOX1}    xpath=//input[@id='newsletter']
${CHECKBOX2}        xpath=//input[@id='optin']
${FIRST_NAME_LCT}   xpath=//input[@id='first_name']
${LAST_NAME_LCT}    xpath=//input[@id='last_name']
${COMPANY_LCT}      xpath=//input[@id='company']
${ADRESS1_LCT}      xpath=//input[@id='address1']
${ADRESS2_LCT}      xpath=//input[@id='address2']
${COUNTRY}      xpath=//select[@id='country']
${STATE_LCT}        xpath=//input[@id='state']
${CITY_LCT}         xpath=//input[@id='city']
${ZIPCODE_LCT}      xpath=//input[@id='zipcode']
${PHONE_LCT}        xpath=//input[@id='mobile_number']
${CREATE_ACCOUNT}     xpath=//button[normalize-space()='Create Account']
${CONTINUE_LCT}     xpath=//a[@class='btn btn-primary']
${DELETE_LCT}    xpath=//a[normalize-space()='Delete Account']
${ACCOUNT_CREATED_MSG}      xpath=//b[contains(translate(normalize-space(.),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ'),'ACCOUNT CREATED!')]
${LOGGED_IN_AS}    xpath=//a[contains(normalize-space(),'Logged in as')]
${ACCOUNT_DELETED}  xpath=//b[normalize-space()='Account Deleted!']







