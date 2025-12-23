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


#SIGN UP

${SIGNUP_NAME}     xpath=//input[@placeholder='Name']
${SIGNUP_EMAIL}    xpath=//input[@data-qa='signup-email']
${SIGNUP_BUTTON}   xpath=//button[normalize-space()='Signup']
${SIGNUP_PASSWORD}  xpath=//input[@id='password']
${DAY}      xpath=//select[@id='days']
${MONTH}    xpath=//select[@id='months']
${YEAR}     xpath=//select[@id='years']
${CHECKBOX1}    xpath=//input[@id='newsletter']
${FIRST_NAME}   xpath=//input[@id='first_name']
${LAST_NAME}    xpath=//input[@id='last_name']
${COMPANY}      xpath=//input[@id='company']
${ADRESS1}      xpath=//input[@id='address1']
${ADRESS2}      xpath=//input[@id='address2']
${COUNTRY}      xpath=//select[@id='country']
${STATE}        xpath=//input[@id='state']
${CITY}         xpath=//input[@id='city']
${ZIPCODE}      xpath=//input[@id='zipcode']
${PHONE}        xpath=//input[@id='mobile_number']
${CREATE_ACCOUNT}     xpath=//button[normalize-space()='Create Account']



