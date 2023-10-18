Feature: AWS Masons app - Individual masons scenarios.

  Background:
  	Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	
  @AWS_IM_WRU_Screen @IM_AWS
  Scenario Outline: To verify that when user performs login with valid credential then user navigates to Who are you screen.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen

    Examples:
      | MasonsEmail | MasonsPass |
      | IMEmailAWS  | IMPassAWS  |
      
  @AWS_IM_Login @IM_AWS
  Scenario Outline: To verify that user should navigates to dashboard screen when select the lodge or grand lodge or mason on Who are you screen.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen

    Examples: 
      | MasonsEmail | MasonsPass | GLorL 		 |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS |
      
  @IM_AWS_3 @IM_AWS
  Scenario Outline: To verify that user should be able to Add Money using ACH account.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance before adding money
    And android user click on Manage Balance button in IM app
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
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance after adding money
  
    Examples: 
      | MasonsEmail | MasonsPass | GLorL 		 | CardNO | Reason     | Amount |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | 3322   | MnyExisAch | 30     |
      
  @IM_AWS_4 @IM_AWS
  Scenario Outline: To verify that user should be able to Add Money using Debit Card.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance before adding money
    And android user click on Manage Balance button in IM app
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
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance after adding money
       
    Examples: 
      | MasonsEmail | MasonsPass | GLorL 		 | CardNO 					| Amount |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | ************1116 | 30		 |
      
  #Beneficiary should be added
  @IM_AWS_5 @AWS_M-M_ReqMny @IM_AWS
  Scenario Outline: To verify that user should be able Request Money individual mason to mason.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    When android user click on Request Money option on IM dashboard screen
    Then android user land on Request Money From screen in IM app
    When android user select mason option on Request Money From screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on name "<BenName>" and email "<BenEmail>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Request Money confirmation screen
    When android user click on REQUEST NOW button on Request Money screen
    Then android user land on Money Request SENT screen in IM app
    When android user click on Back Arrow button on SENT screen
    Then android user land on Individual mason dashboard screen
    
    Examples: 
      | MasonsEmail | MasonsPass | GLorL 		 | BenName       | BenEmail       | Amount | Note    |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | IMBeneNameAWS | IMEmailBeneAWS | 5			 | M-M Req |
      
  @IM_AWS_6 @AWS_DeleteOwnRequest @IM_AWS
  Scenario Outline: To verify that user should be able to delete his own request.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    When android user click on Request Money option on IM dashboard screen
    Then android user land on Request Money From screen in IM app
    When android user select mason option on Request Money From screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on name "<BenName>" and email "<BenEmail>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Request Money confirmation screen
    When android user click on REQUEST NOW button on Request Money screen
    Then android user land on Money Request SENT screen in IM app
    When android user click on Back Arrow button on SENT screen
    Then android user land on Individual mason dashboard screen
    When android user click on See All option to see all Transactions
    Then android user land on Transactions screen in IM app
    When android user select the transaction request base on note "<Note>" and amount "<AMountFormat>" and click on delete in IM app
    Then android user land on request deleted screen in IM app
    Then android user land on Transactions screen in IM app
    
    Examples: 
      | MasonsEmail | MasonsPass | GLorL 		 | BenName       | BenEmail       | Amount | Note    | AMountFormat |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | IMBeneNameAWS | IMEmailBeneAWS | 4			 | Del Req | +$4.00			  |
      
  #Beneficiary should be added
  @IM_AWS_7 @AWS_SendMoneyM-M @IM_AWS
  Scenario Outline: To verify that user should be able Send money mason to mason.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on Send Money option on IM dashboard screen
    Then android user land on Send Money From screen in IM app
    When android user click on PtP Transfer option on Send Money screen in IM app
    Then android user land on Send From screen in IM app
    When android user click on Quick Money Wallet radio button on Send From screen in IM app
    And android user click on CONFIRMATION buton on Send From screen in IM app
    Then android user land on Send Money To screen in IM app
    When android user click on mason option on Send Money To screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on name "<BenName>" and email "<BenEmail>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Send Money confirmation screen
    When android user click on SEND NOW button on Send Money screen
    Then android user land on Transfer Done screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance after adding money
    
    Examples:  
      | MasonsEmail | MasonsPass | GLorL 		 | BenName       |  BenEmail 	    | Amount | Note     |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | IMBeneNameAWS | IMEmailBeneAWS | 5      | Send M-M |
      
  #Beneficiary should be added
  @IM_AWS_8 @AWS_SendMoneyM-L @IM_AWS
  Scenario Outline: To verify that user should be able Send money mason to lodge.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on Send Money option on IM dashboard screen
    Then android user land on Send Money From screen in IM app
    When android user click on PtP Transfer option on Send Money screen in IM app
    Then android user land on Send From screen in IM app
    When android user click on Quick Money Wallet radio button on Send From screen in IM app
    And android user click on CONFIRMATION buton on Send From screen in IM app
    Then android user land on Send Money To screen in IM app
    When android user click on lodge option on Send Money To screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on lodge name "<AWSLodge>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Send Money confirmation screen
    When android user click on SEND NOW button on Send Money screen
    Then android user land on Transfer Done screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance after adding money
    
    Examples:  
      | MasonsEmail | MasonsPass | GLorL 		 | AWSLodge     | Amount | Note     |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | LodgeNameAWS | 6      | Send M-L |
      
  #Beneficiary should be added
  @IM_AWS_9 @SendMoneyM-GL @IM_AWS
  Scenario Outline: To verify that user should be able Send money mason to grand lodge.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on Send Money option on IM dashboard screen
    Then android user land on Send Money From screen in IM app
    When android user click on PtP Transfer option on Send Money screen in IM app
    Then android user land on Send From screen in IM app
    When android user click on Quick Money Wallet radio button on Send From screen in IM app
    And android user click on CONFIRMATION buton on Send From screen in IM app
    Then android user land on Send Money To screen in IM app
    When android user click on grand lodge option on Send Money To screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on grand lodge name "<AWSGLName>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Send Money confirmation screen
    When android user click on SEND NOW button on Send Money screen
    Then android user land on Transfer Done screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance after adding money
    
    Examples:  
      | MasonsEmail | MasonsPass | GLorL 		 | AWSGLName     | Amount | Note      |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | GLodgeNameAWS | 7      | Send M-GL |
      
  @IM_AWS_10 @AWS_ReqRefuse @IM_AWS
  Scenario Outline: To verify that user should be able to Refuse the money request.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    When android user click on Request Money option on IM dashboard screen
    Then android user land on Request Money From screen in IM app
    When android user select mason option on Request Money From screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on name "<BenName>" and email "<BenEmail>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Request Money confirmation screen
    When android user click on REQUEST NOW button on Request Money screen
    Then android user land on Money Request SENT screen in IM app
    When android user click on Back Arrow button on SENT screen
    Then android user land on Individual mason dashboard screen
    Then adnroid user close the mason application
    Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
    When android user provides masons Username "<BenEmail>" and Password "<BenPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL_Bene>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on Money Requested option on IM dashboard screen
    Then android user land on Money Requested screen in IM app
    When android user select the money request base on Note "<Note>" and amount "<AMountFormat>" in IM app
    Then android user land on What do you want to do screen in IM app
    When android click on Cross icon for refuse the money request
    Then android user land on money Request deleted screen in IM app
    When android user click on device back button
    Then android user land on Money Requested screen in IM app
    
    Examples: 
      | MasonsEmail | MasonsPass | GLorL 		 | BenName       | BenEmail       | BenPass       | GLorL_Bene   | Amount | Note       | AMountFormat |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | IMBeneNameAWS | IMEmailBeneAWS | IMPassBeneAWS | IMBen_at_AWS | 1			| Req Refuse | $ 1.00       |
      
  @IM_AWS_11 @ReqAccept @IM_AWS
  Scenario Outline: To verify that user should be able to Accept or PayBack the money request.
    When android user provides masons Username "<MasonsEmail>" and Password "<MasonsPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    When android user click on Request Money option on IM dashboard screen
    Then android user land on Request Money From screen in IM app
    When android user select mason option on Request Money From screen in IM app
    Then android user land on Choose Beneficiary screen in IM app
    When android user select the beneficiary base on name "<BenName>" and email "<BenEmail>" in IM app
    And android user enters the Amount through keypad in IM app "<Amount>"
    And android user enters the note for request the money in IM app "<Note>"
    And android user click on CONTINUE button on keypad screen
    Then android user land on Request Money confirmation screen
    When android user click on REQUEST NOW button on Request Money screen
    Then android user land on Money Request SENT screen in IM app
    When android user click on Back Arrow button on SENT screen
    Then android user land on Individual mason dashboard screen
    Then adnroid user close the mason application
    Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
    When android user provides masons Username "<BenEmail>" and Password "<BenPass>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge or mason at"<GLorL_Bene>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance before adding money
    When android user click on Money Requested option on IM dashboard screen
    Then android user land on Money Requested screen in IM app
    When android user select the money request base on Note "<Note>" and amount "<AMountFormat>" in IM app
    Then android user land on What do you want to do screen in IM app
    When android click on True Sign icon for Payback the money request
    Then android user land on Send Money confirmation screen
    When android user click on SEND NOW button on Send Money screen
    Then android user land on Transfer Done screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Individual mason dashboard screen
    Then android user verify Individual Mason account balance after adding money
    
    Examples: 
      | MasonsEmail | MasonsPass | GLorL 		 | BenName       | BenEmail       | BenPass       | GLorL_Bene   | Amount | Note       | AMountFormat |
      | IMEmailAWS  | IMPassAWS  | IM_at_AWS | IMBeneNameAWS | IMEmailBeneAWS | IMPassBeneAWS | IMBen_at_AWS | 2			| Req Accept | $ 2.00       |