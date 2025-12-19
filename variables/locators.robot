*** Variables ***

#NAVBAR

${HOME}    xpath=//a[normalize-space()='Home']
${PRODUCTS}     xpath=//a[normalize-space()='Products']
${CART}     xpath=//a[normalize-space()='Cart']
${LOGIN}    xpath=//a[normalize-space()='Signup / Login']
${CONTACT_US}   xpath=//a[normalize-space()='Contact us']



#LOGIN

${LOGIN_EMAIL}    xpath=//input[@data-qa='login-email']
${LOGIN_PASSWORD}     xpath=//input[@placeholder='Password']
${LOGIN_BUTTON}   xpath=//button[normalize-space()='Login']


#SIGN UP

${SIGNUP_NAME}     xpath=//input[@placeholder='Name']
${SIGNUP_EMAIL}    xpath=//input[@data-qa='signup-email']
${SIGNUP_BUTTON}   xpath=//button[normalize-space()='Signup']


