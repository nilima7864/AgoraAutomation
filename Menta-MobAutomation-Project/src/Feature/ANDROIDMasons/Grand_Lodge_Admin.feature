Feature: Masons App - Grand lodge admin scenarios.

  Background:
  	Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	
  @GL_WRU_Screen @GL_Sanity
  Scenario Outline: To verify that when user performs login with valid credential then user navigates to Who are you screen.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen

    Examples: 
      | GLEmail  | GLPass  |
      | GLEmail1 | GLPass1 |
      
  @GL_Login @GL_Sanity
  Scenario Outline: To verify that user should navigates to dashboard screen when select the lodge or grand lodge or mason on Who are you screen.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen

    Examples: 
      | GLEmail  | GLPass  | GLorL |
      | GLEmail1 | GLPass1 | GL_at |
      
  @GL_AddACH @GL_Sanity
  Scenario Outline: To verify that user should be able to Add new ACH Bank Account.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Profile Icon on mason dashboard screen
    Then android user land on mason Profile screen
    When android user click on Add ACH Account on Individual mason Profile screen
    Then android user land on Add ACH Accounts screen in IM app
    When andrid user click on Add ACH button in IM app
    And android user enters the Debitors Identification in IM app"<DebtIden>"
    And android user enters the Debitors Middle name in IM app"<MidName>"
    And android user scroll till Debitors Account Info state input display
    And android user enters the Debitors Address Line two in IM app"<AddLine2>"
    And android user enters the Debitors State in IM app"<State>"
    And android user scroll till Debitors Account Info section display
    And android user enters the Debitors Institution Identification in IM app"<InstIden>"
    And android user enters the Debitors Identification CardNo in IM app"<CardNO>"
    And android user click on Continue button on Add Ach Account screen in IM app
    Then android user land on Ach account created screen in IM app
    When android user click on Go To Dashboard button in IM app
    And android user click on Add ACH Account on Individual mason Profile screen
    Then android user verify newly created Ach account card"<CardNO>"
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | DebtIden  | MidName | AddLine2 | State | InstIden  | CardNO           |
      | GLEmail1 | GLPass1 | GL_at | 123456789 | abc     | Chicago  | AK    | 101110802 | 1212121212123333 |
      
  @GL_AddMnyACH @GL_Sanity
  Scenario Outline: To verify that user should be able to Add Money using ACH account.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance before adding money
    And android user click on Add Money button on GL dashboard screen
    Then android user land on Add Money screen in IM app
    When android user click on Bank Account ACH option on Add Money screen in IM app
    Then android user land on Add ACH Accounts screen in IM app
    When android user select Ach Account card base on "<CardNO>"
    Then android user land on Debitors Account Info screen in IM app
    When android user enters the Debitors reason in IM app"<Reason>"
    And android user enters the Amount to Add in IM account"<Amount>"
    And android user click on Submit button on Debitors Account Info screen in IM app
    Then android user land on Confirm Your Transfer screen in IM app
    When android user click on CONFIRM TRANSFER button in IM app
    Then android user land on Money Added screen through ACH screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance after adding money
  
    Examples: 
      | GLEmail  | GLPass  | GLorL | CardNO 					| Reason      | Amount |
      | GLEmail1 | GLPass1 | GL_at | 1212121212123333 | Add-Mny-ACH | 40     |
      
  #Debit card should be added
  @GL_AddMnyDebit @GL_Sanity
  Scenario Outline: To verify that user should be able to Add Money using Debit Card.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance before adding money
    And android user click on Add Money button on GL dashboard screen
    Then android user land on Add Money screen in IM app
    When android user click on Debit Card option on Add Money screen in IM app
    Then android user land on My Cards screen in IM app
    When android user select Debit card base on "<CardNO>"
    Then android user land on Add Balance screen in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user click on Continue button on Add Balance screen
    Then android user land on Confirm Your Transfer screen in IM app
    When android user click on CONFIRM TRANSFER button in IM app
    Then android user land on Money Added screen through ACH screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance after adding money
       
    Examples: 
      | GLEmail  | GLPass  | GLorL | CardNO 					| Amount |
      | GLEmail1 | GLPass1 | GL_at | ************1118 | 20		 |
  
  #Grand Lodge added as a beneficiary
  @GL_SendMny_GL-GL @GL_Sanity
  Scenario Outline: To verify that user should be able to send money to grand lodge.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on the Transactions layout on GL dashboard screen
    And android user land on Grand lodge Transactions screen
    And android user click on Plus button on GL Transactions screen
    And android user click on GL Send Money button
    Then android user land on Send Money From screen in IM app
    When android user click on PtP Transfer option on Send Money screen in IM app
    Then android user land on Send From screen in IM app
    When android user click on Quick Money Wallet radio button on Send From screen in IM app
    And android user click on CONFIRMATION buton on Send From screen in IM app
    Then android user land on Send Money To screen in IM app
    When android user click on grand lodge option on Send Money To screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on grand lodge name "<GLName>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Send Money confirmation screen
    When android user click on SEND NOW button on Send Money screen
    And android user entering the Pin"<Pin>"
    Then android user land on Transfer Done screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance after adding money
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | GLName     | Amount | Note       | Pin  |
      | GLEmail1 | GLPass1 | GL_at | GLNameBene |	5			 | Send GL-GL | 0000 |
  
  #Lodge added as a beneficiary    
  @GL_SendMny_GL-L @GL_Sanity
  Scenario Outline: To verify that user should be able to send money to lodge.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on the Transactions layout on GL dashboard screen
    And android user land on Grand lodge Transactions screen
    And android user click on Plus button on GL Transactions screen
    And android user click on GL Send Money button
    Then android user land on Send Money From screen in IM app
    When android user click on PtP Transfer option on Send Money screen in IM app
    Then android user land on Send From screen in IM app
    When android user click on Quick Money Wallet radio button on Send From screen in IM app
    And android user click on CONFIRMATION buton on Send From screen in IM app
    Then android user land on Send Money To screen in IM app
    When android user click on lodge option on Send Money To screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on grand lodge name "<LName>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Send Money confirmation screen
    When android user click on SEND NOW button on Send Money screen
    And android user entering the Pin"<Pin>"
    Then android user land on Transfer Done screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance after adding money
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | LName      | Amount | Note      | Pin  |
      | GLEmail1 | GLPass1 | GL_at | LodgeName1 |	6			 | Send GL-L | 0000 |
      
  #Mason added as a beneficiary    
  @GL_SendMny_GL-M @GL_Sanity
  Scenario Outline: To verify that user should be able to send money to mason.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on the Transactions layout on GL dashboard screen
    And android user land on Grand lodge Transactions screen
    And android user click on Plus button on GL Transactions screen
    And android user click on GL Send Money button
    Then android user land on Send Money From screen in IM app
    When android user click on PtP Transfer option on Send Money screen in IM app
    Then android user land on Send From screen in IM app
    When android user click on Quick Money Wallet radio button on Send From screen in IM app
    And android user click on CONFIRMATION buton on Send From screen in IM app
    Then android user land on Send Money To screen in IM app
    When android user click on mason option on Send Money To screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on name "<MName>" and email "<MEmail>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Send Money confirmation screen
    When android user click on SEND NOW button on Send Money screen
    And android user entering the Pin"<Pin>"
    Then android user land on Transfer Done screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Grand Lodge dashboard screen
    Then android user verify Individual Mason account balance after adding money
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | MName      | MEmail      | Amount | Note      | Pin  |
      | GLEmail1 | GLPass1 | GL_at | BeneNameIM | BeneEmailIM |	7			 | Send GL-M | 0000 |                
    
  @GL_DeleteACH @GL_Sanity
  Scenario Outline: To verify that user should be able to Remove ACH Bank Account.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Profile Icon on mason dashboard screen
    Then android user land on mason Profile screen
    When android user click on Add ACH Account on Individual mason Profile screen
    Then android user land on Add ACH Accounts screen in IM app
    When android user select Ach Account card base on "<CardNO>"
    And android user click on Delete Icon on Ach Account screen
    Then android user land on BANK REMOVED screen in IM app
    Then android user land on Add ACH Accounts screen in IM app
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | CardNO           |   
      | GLEmail1 | GLPass1 | GL_at | 1212121212123333 |
      
  @GL_ChangePin @GL_Sanity
  Scenario Outline: To verify that user should be able to Change the Pin.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Profile Icon on mason dashboard screen
    Then android user land on mason Profile screen
    When android user click on Change Pin option on Individual mason Profile screen
    And android user entering the Pin"<OldPin>"
    And android user re-entering the Pin"<NewPin>"
    And android user re-entering the Pin"<NewPin>"
    Then android user land on Pin changed for mason screen
    When android user click on Close button on Pin created screen
    Then android user land on mason Profile screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | OldPin | NewPin |
      | GLEmail1 | GLPass1 | GL_at | 0000   | 1111	 |
      
  @GL_AddNewCharityPocket @GL_Sanity
  Scenario Outline: To verify that user should be able to ADD NEW charity pocket.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on Charity option from menus options
    Then android user land on Charity Pockets screen
    When android user click on ADD CHARITY button
    Then android user land on Create Charity Pocket screen
    When android user enters the Charity Pocket Name "<CharPockName>"
    And android user selects the checkbox for share the charity pocket to masons
    And android user click on Create Charity Pocket button
    Then android user land on Charity Pocket Created screen
    When android user click on device back button
    Then android user land on Charity Pockets screen
    Then android user verify the created charity pocket "<CharPockName>" on Charity Pockets screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | CharPockName |
      | GLEmail1 | GLPass1 | GL_at | Bat          |
  
  @GL_EditCharityPocketName @GL_Sanity
  Scenario Outline: To verify that user should be able to Edit charity pocket name.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on Charity option from menus options
    Then android user land on Charity Pockets screen
    When android user select the Charity pocket in IM app base on "<CharPockName>"
    Then android user land on Charity pocket details screen in IM app
    When android user click on Edit button for editing pocket name
    Then android user land on Update Charity Pocket screen
    When android user enters the new Charity Pocket Name "<PockNameNew>"
    And android user click on Update Charity Pocket button
    Then android user land on Rename pocket success screen
    When android user click on device back button
    Then android user land on Charity Pockets screen
    Then android user verify the created charity pocket "<PockNameNew>" on Charity Pockets screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | CharPockName | PockNameNew |
      | GLEmail1 | GLPass1 | GL_at | Bat          | Ball 				|
  
  @GL_UnSharePocket @GL_Sanity
  Scenario Outline: To verify that user should be able to Un-Share the charity pocket with masons users.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on Charity option from menus options
    Then android user land on Charity Pockets screen
    When android user select the Charity pocket in IM app base on "<CharPockName>"
    Then android user land on Charity pocket details screen in IM app
    When android user click on Unshare button for unsharing the pocket
    Then android user land on Charity Pocket Unshared successfully screen
    When android user click on device back button
    Then android user land on Charity Pockets screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | CharPockName |
      | GLEmail1 | GLPass1 | GL_at | Ball         |
      
  @GL_SharePocket @GL_Sanity
  Scenario Outline: To verify that user should be able to Share the charity pocket with masons users.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on Charity option from menus options
    Then android user land on Charity Pockets screen
    When android user select the Charity pocket in IM app base on "<CharPockName>"
    Then android user land on Charity pocket details screen in IM app
    When android user click on Share button for sharing the pocket
    Then android user land on Charity Pocket Shared successfully screen
    When android user click on device back button
    Then android user land on Charity Pockets screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | CharPockName |
      | GLEmail1 | GLPass1 | GL_at | Ball         |    
  
  @GL_DltCharityPocket @GL_Sanity
  Scenario Outline: To verify that user should be able to Delete charity pocket.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on Charity option from menus options
    Then android user land on Charity Pockets screen
    When android user select the Charity pocket in IM app base on "<CharPockName>"
    Then android user land on Charity pocket details screen in IM app
    When android user click on Delete option for deleting charity pocket
    Then android user land on Charity pocket deleted screen
    When android user click on device back button
    Then android user land on Charity Pockets screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | CharPockName |
      | GLEmail1 | GLPass1 | GL_at | Ball         |
    
  @GL_BlockCard @GL_Sanity
  Scenario Outline: To verify that user should be able to Block the card.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on My Cards option from menus options
    Then android user land on My Cards account screen
    When android user click on Block toggle button   
    Then android user land on Block Cards screen
    When android user click on Theft button
    And android user click on Block button in IM app 
    Then android user land on Card Block successfully screen
    Then android user land on My Cards account screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL |
      | GLEmail1 | GLPass1 | GL_at |
      
  @GL_UnblockCard @GL_Sanity
  Scenario Outline: To verify that user should be able to Unblock the card.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on My Cards option from menus options
    Then android user land on My Cards account screen
    When android user click on UnblockBlock toggle button  
    Then android user land on Card Unblock successfully screen
    Then android user land on My Cards account screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL |
      | GLEmail1 | GLPass1 | GL_at |
      
  @GL_SetLimits @GL_Sanity
  Scenario Outline: To verify that user should be able to set the card DAILY , MONTHLY , YEARLY limits.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on My Cards option from menus options
    Then android user land on My Cards account screen
    When android user click on Limits option
    And android user click on DAILY radio button
    And android user enters the Amount to be set the DAILY limits "<DAILY>"
    And android user click on Apply button to set limits
    Then android user land on Card settings changed screen
    Then android user land on My Cards account screen
    When android user click on Limits option
    And android user click on MONTHLY radio button
    And android user enters the Amount to be set the MONTHLY limits "<MONTHLY>"
    And android user click on Apply button to set limits
    Then android user land on Card settings changed screen
    Then android user land on My Cards account screen
    When android user click on Limits option
    And android user click on YEARLY radio button
    And android user enters the Amount to be set the YEARLY limits "<YEARLY>"
    And android user click on Apply button to set limits
    Then android user land on Card settings changed screen
    Then android user land on My Cards account screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | DAILY | MONTHLY | YEARLY |
      | GLEmail1 | GLPass1 | GL_at | 6     | 6       | 6      |
      
  @GL_DeactivateCard @GL_Sanity
  Scenario Outline: To verify that user should be able to Deactivate the card.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on My Cards option from menus options
    Then android user land on My Cards account screen
    When android user click on Deactivate card option
    Then android user land on Deactivated successfully screen
    Then android user land on My Cards account screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL |
      | GLEmail1 | GLPass1 | GL_at |
      
  @GL_AddNewCard @GL_Sanity
  Scenario Outline: To verify that user should be able to Add new virtual card.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Menu icon
    And android user click on My Cards option from menus options
    Then android user land on My Cards account screen
    When android user click on Add new button My Cards screen
    Then android user is on Vitual card created screen in IM app
    When android user click on device back button
    Then android user land on My Cards account screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL |
      | GLEmail1 | GLPass1 | GL_at |   
     
  @GL_ChangePassword @GL_Sanity
  Scenario Outline: To verify that user should be able to Change the password.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Profile Icon on mason dashboard screen
    Then android user land on mason Profile screen
    When android user click on Change Password option on Individual mason Profile screen
    And android user land on Change Password screen
    And android user entered Current password "<CurrentPass>"
    And android user entered New password "<NewPass>" and Confirm password "<ConfPass>"
    And android user click on SUBMIT button on Change password screen
    And android user land on Password changed screen and click on Okay button
    Then android user should navigate to masons app login screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | CurrentPass | NewPass | ConfPass |
      | GLEmail1 | GLPass1 | GL_at | GLPass1     | GLPass2 | GLPass2  |
  
  @GL_DisablePin @GL_Sanity
  Scenario Outline: To verify that user should be able to Disable the Pin.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen
    When android user click on Profile Icon on mason dashboard screen
    Then android user land on mason Profile screen
    When android user click on Disable Pin option on Individual mason Profile screen
    And android user entering the Pin"<OldPin>"
    Then android user land on Pin Removed for mason screen
    When android user click on Close button on Pin created screen
    Then android user land on mason Profile screen
    
    Examples: 
      | GLEmail  | GLPass  | GLorL | OldPin |
      | GLEmail1 | GLPass2 | GL_at | 1111   |
      
  @GL_ResetPassword @GL_Sanity
  Scenario Outline: To verify that user should be able to Reset the password.
    When android user click on Reset Password link text on login screen
    Then android user land on Forgot my password screen
    When android user enters the email address for reset the password "<GLEmail>"
    And android user click on Send button on forgot my password screen
    Then android user land on Reset password link sent to email successfully screen
    When android user click on device back button
    Then android user land on Forgot my password screen
    
    Examples: 
      | GLEmail  |
      | GLEmail1 |