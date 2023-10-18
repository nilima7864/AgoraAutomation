Feature: AWS Masons App - Grand lodge admin scenarios.

  Background:
  	Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	
  @AWS_GL_WRU_Screen @GL_AWS
  Scenario Outline: To verify that when user performs login with valid credential then user navigates to Who are you screen.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen

    Examples: 
      | GLEmail        | GLPass        |
      | GLodgeEmailAWS | GLodgePassAWS |
      
  @AWS_GL_Login @GL_AWS
  Scenario Outline: To verify that user should navigates to dashboard screen when select the lodge or grand lodge or mason on Who are you screen.
    When android user provides masons Username "<GLEmail>" and Password "<GLPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Grand Lodge dashboard screen

    Examples: 
      | GLEmail        | GLPass        | GLorL    |
      | GLodgeEmailAWS | GLodgePassAWS | GL_atAWS |
      
  @AWS_GL_AddMnyACH @GL_AWS
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
      | GLEmail        | GLPass        | GLorL    | CardNO 					 | Reason      | Amount |
      | GLodgeEmailAWS | GLodgePassAWS | GL_atAWS | 1212121212123333 | Add-Mny-ACH | 30     |
      
  #Debit card should be added
  @AWS_GL_AddMnyDebit @GL_AWS
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
      | GLEmail        | GLPass        | GLorL    | CardNO 					 | Amount |
      | GLodgeEmailAWS | GLodgePassAWS | GL_atAWS | ************1116 | 30		  |
      
  #Grand Lodge added as a beneficiary
  @AWS_GL_SendMny_GL-GL @GL_AWS
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
      | GLEmail        | GLPass        | GLorL    | GLName        | Amount | Note       | Pin  |
      | GLodgeEmailAWS | GLodgePassAWS | GL_atAWS | GLNameBeneAWS |	5			 | Send GL-GL | 0000 |
      
  #Lodge added as a beneficiary    
  @AWS_GL_SendMny_GL-L @GL_AWS
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
      | GLEmail        | GLPass        | GLorL    | LName        | Amount | Note      | Pin  |
      | GLodgeEmailAWS | GLodgePassAWS | GL_atAWS | LodgeNameAWS |	6			| Send GL-L | 0000 |
      
  #Mason added as a beneficiary    
  @AWS_GL_SendMny_GL-M @GL_AWS
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
      | GLEmail        | GLPass        | GLorL    | MName         | MEmail         | Amount | Note      | Pin  |
      | GLodgeEmailAWS | GLodgePassAWS | GL_atAWS | IMBeneNameAWS | IMEmailBeneAWS |	7			| Send GL-M | 0000 |