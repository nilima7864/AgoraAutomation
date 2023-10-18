Feature: Cards API's

  @Get_Balance @Cards
  Scenario Outline: To verify the response of http request of get balance.
  	Given User hit the POST http request "<TokenReq>" for bearer token
  	When User hit the POST http request "<getBalance>" for getting balance amount of customer ID "<CustID>"
  	Then User validate the Response code "<ResCode>"
  	
  	Examples:
			| TokenReq   | getBalance 	 | CustID 					| ResCode |
			| CDTokenURI | getBalanceURI | 0201001006878008	| 000     |
	
	@AGSITgetDetails
	Scenario Outline: To verify the response of http request of getUserDetails on SIT.
	  Given User Generate Token for API Validation from "<TokenAPI>" for AGORA
	  When User hit the GET http request "<APIName>" and check Status code as "<StatusCode>" for AGORA
	  Then User validate Response code as "<ResponseCode>"
		
		Examples:
			| TokenAPI       | APIName					| StatusCode |
			| agoraAuthToken | getUserDetailsAG | 200        |
	
	
	
	
	
	
	
	
	
	
	@Ingo_MoneyFlow
  Scenario Outline: To verify that user should be able to revert the added money using ingo-money API.
  	Given User Generate Token for API Validation from "<TokenAPI>" for AGORA
  	And User hit the POST http request "<getUserid>" and check Status code as "<StatusCode>" for User ID
  	
  	Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	When android user provides masons Username "<IngoEmail1>" and Password "<IngoPass1>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge "<ingoGLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    When android user click on Profile Icon on Individual mason dashboard screen
    Then android user land on Individual mason Profile screen
    When android user click on Add Credit Debit Card on Individual mason Profile screen
    Then android user land on My Cards screen in IM app
    When android user click on Plus button for Add New Card on My Cards screen in IM app
    Then android user land on Card has been added screen in IM app
    When android user click on Close button on Card Created screen in IM app
    Then android user land on My Cards screen in IM app    
  	
    And User hit the POST http request "<addCard>" and check Status code as "<StatusCode>" for Add Card details
  	
  	Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	When android user provides masons Username "<IngoEmail1>" and Password "<IngoPass1>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge "<ingoGLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    And android user click on Manage Balance button in IM app
    Then android user land on Add Money screen in IM app
    When android user click on Debit Card option on Add Money screen in IM app
    Then android user land on My Cards screen in IM app
    When android user select the first card by default
    Then android user land on Add Balance screen in IM app
    When android user enters the Amount through keypad in IM app "<Amount>"
    And android user click on Continue button on Add Balance screen
    Then android user land on Confirm Your Transfer screen in IM app
    When android user click on CONFIRM TRANSFER button in IM app
    Then android user land on Money Added screen through ACH screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Individual mason dashboard screen
    Then adnroid user verifying the account balance after adding the money
  	
  	And User hit the POST http request "<revertWHApi>" and check Status code as "<StatusCode>" for Revert money from Account  	  	
   	
   	Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	When android user provides masons Username "<IngoEmail1>" and Password "<IngoPass1>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge "<ingoGLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
   	Then adnroid user verifying the account balance after reverting the money
   	
  	Examples:
			| IngoEmail1 | IngoPass1 | ingoGLorL | TokenAPI       | getUserid | getAccDetails  | addCard   | revertWHApi | StatusCode | Amount |
			| IngoEmail1 | IngoPass1 | ingoGLorL | agoraAuthToken | getUserID | getAccDetailsM | addCardIM | revertMnyWH | 200        | 20 		 |
	
  @IngoMoney_AddNewCard
  Scenario Outline: To verify that user should be able to add new card through app and fill the card details through Ingo-Money AddCard API
  	Given User Generate Token for API Validation from "<TokenAPI>" for AGORA
  	And User hit the POST http request "<getUserid>" and check Status code as "<StatusCode>" for User ID		
		Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	When android user provides masons Username "<IngoEmail1>" and Password "<IngoPass1>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge "<ingoGLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    When android user click on Profile Icon on Individual mason dashboard screen
    Then android user land on Individual mason Profile screen
    When android user click on Add Credit Debit Card on Individual mason Profile screen
    Then android user land on My Cards screen in IM app
    When android user click on Plus button for Add New Card on My Cards screen in IM app
    Then android user land on Card has been added screen in IM app
    When android user click on Close button on Card Created screen in IM app
    Then android user land on My Cards screen in IM app    
    Then User hit the POST http request "<addCard>" and check Status code as "<StatusCode>" for Add Card details
		
		Examples:
			| IngoEmail1 | IngoPass1 | ingoGLorL | TokenAPI       | getUserid | addCard   | StatusCode |
			| IngoEmail1 | IngoPass1 | ingoGLorL | agoraAuthToken | getUserID | addCardIM | 200        |
	
  @IngoMoney_AddAndRevertMoneyWH
  Scenario Outline: To verify that user should be able to add money through app and Revert money through Ingo-Money WebHook API
  	Given User Generate Token for API Validation from "<TokenAPI>" for AGORA
  	And User hit the POST http request "<getUserid>" and check Status code as "<StatusCode>" for User ID
		Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	When android user provides masons Username "<IngoEmail1>" and Password "<IngoPass1>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge "<ingoGLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
    And android user click on Manage Balance button in IM app
    Then android user land on Add Money screen in IM app
    When android user click on Debit Card option on Add Money screen in IM app
    Then android user land on My Cards screen in IM app
    When android user select the first card by default
    Then android user land on Add Balance screen in IM app
    When android user enters the Amount through keypad in IM app "<Amount>"
    And android user click on Continue button on Add Balance screen
    Then android user land on Confirm Your Transfer screen in IM app
    When android user click on CONFIRM TRANSFER button in IM app
    Then android user land on Money Added screen through ACH screen in IM app
    When android user click on GO TO DASHBOARD button on Money Added screen in IM app
    Then android user land on Individual mason dashboard screen
    Then adnroid user verifying the account balance after adding the money 	
  	And User hit the POST http request "<revertWHApi>" and check Status code as "<StatusCode>" for Revert money from Account  	  	   	
   	Given android masons app is installed on the device and launched successfully
  	Then android user should navigate to masons app login screen
  	When android user provides masons Username "<IngoEmail1>" and Password "<IngoPass1>"
    And android user click on the masons login button
    Then android user land on Who are you screen
    When android user select the grand lodge or lodge "<ingoGLorL>"
    And android user click on CONTINUE button on Who are you screen
    Then android user land on Individual mason dashboard screen
   	Then adnroid user verifying the account balance after reverting the money
   	
  	Examples:
			| IngoEmail1 | IngoPass1 | ingoGLorL | TokenAPI       | getUserid | addCard   | revertWHApi | StatusCode | Amount |
			| IngoEmail1 | IngoPass1 | ingoGLorL | agoraAuthToken | getUserID | addCardIM | revertMnyWH | 200        | 30 		|
										
  @getBalance
  Scenario Outline: To verify the HTTP request for getBalance API.
  	Given User Generate Token for API Validation from "<TokenAPI>" for CD application
  	When User hit the POST http request "<APIName>" and check Status code as "<StatusCode>" for CD application
  	Then User validate Response code as "<ResponseCode>" and Response description as "<ResponseDes>"
  	
  	Examples:
    	| TokenAPI 			| APIName    | StatusCode | ResponseCode | ResponseDes |
    	| tokenGenerate | getBalance | 200        | 000					 | Success     |
    	
  @credit
  Scenario Outline: To verify the HTTP request for credit API.
    Given User Generate Token for API Validation from "<TokenAPI>" for CD application
  	When User hit the POST http request "<APIName>" and check Status code as "<StatusCode>" for CD application
  	Then User validate Response code as "<ResponseCode>" and Response description as "<ResponseDes>"
  	
  	Examples:
    	| TokenAPI 			| APIName | StatusCode | ResponseCode | ResponseDes |
    	| tokenGenerate | credit  | 200        | 000					| Success     |
    	
  @debit
  Scenario Outline: To verify the HTTP request for debit API.
    Given User Generate Token for API Validation from "<TokenAPI>" for CD application
  	When User hit the POST http request "<APIName>" and check Status code as "<StatusCode>" for CD application
  	Then User validate Response code as "<ResponseCode>" and Response description as "<ResponseDes>"
  	
  	Examples:
    	| TokenAPI 			| APIName | StatusCode | ResponseCode | ResponseDes |
    	| tokenGenerate | debit   | 200        | 000					| Success     |  	