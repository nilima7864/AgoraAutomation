package com.cucumber.stepdefinition;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.response.ResponseBody;
import io.restassured.specification.RequestSpecification;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;

import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.auth.AuthOption;
import org.testng.Assert;

import com.appium.utility.Constants;
import com.appium.utility.Reusables;
import com.google.gson.reflect.TypeToken;
import com.google.gson.Gson;
import com.sun.xml.bind.v2.runtime.output.Encoded;
import com.utility.LogCapture;
import com.utility.SendMail;

public class AgoraAPIStepDef 
{
	public static String devAccessToken97 ;
	public static String sitAccessToken30 ;
	public static String stagAccessToken25 ;
	public static int actStatusCode ;
	//public static int expStatusCode = 200;
	
	
	@Given("^User hit the POST http request \"([^\"]*)\" for token on DEV$")
	public void user_hit_the_POST_http_request_for_token_on_DEV(String devPOST) throws Throwable 
	{
		RestAssured.baseURI = devPOST ;
        String response = given()
        		.header("Content-Type", "application/x-www-form-urlencoded; charset=utf-8")
        		.header("Authorization" , "Basic MTIzNDptb3JuaW5n")
        	    .formParam("username", "morning-jump")
        	    .formParam("password", "morning")
        	    .formParam("grant_type", "password")
        		.when()
        		.post(devPOST)
        		.then()
        		.assertThat().statusCode(200)
        		.extract().response().asString();
        LogCapture.info("97 Dev Env POST Request Response : "+response);
        //System.out.println("97 Dev Env POST Request Response : "+response);
        
        JsonPath js = new JsonPath(response);
        devAccessToken97 = js.getString("access_token");
        LogCapture.info("97 Dev Environment Access Token Is : "+devAccessToken97);
        //System.out.println("97 Dev Environment Access Token Is : "+devAccessToken97);		          			
	}

	@When("^User hit the GET http request \"([^\"]*)\" for getting the user details on DEV$")
	public void user_hit_the_GET_http_request_for_getting_the_user_details(String devGET) throws Throwable 
	{				
		RestAssured.baseURI = devGET;
        RequestSpecification httpRequest = RestAssured.given();
        httpRequest.header("Authorization", "Bearer "+ devAccessToken97);
       
        Response response = httpRequest.get(devGET);
        ResponseBody body = response.getBody();
        String bodyStringValue = body.asString();
        LogCapture.info(bodyStringValue);
        //System.out.println(bodyStringValue);
        actStatusCode = response.getStatusCode();
        //System.out.println(actStatusCode);
	}

	@Then("^User validate the Status code as \"([^\"]*)\" on DEV$")
	public void user_validate_the_Status_code_as(String Scode) throws Throwable 
	{
		//System.out.println("Status code of GET User details request on DEV --- "+actStatusCode);
		LogCapture.info("Status code of GET User details request on DEV --- "+actStatusCode);
		
		int expStatusCode = Integer.parseInt(Scode);
		
		if(actStatusCode == expStatusCode)
		{
			LogCapture.info("97 DEV Server is up and running successfully...");
		}
		else 
		{
			LogCapture.info("97 DEV Server is not up and running...");
			//SendMail.execute("AAA");
		}
	}
	
	@Given("^User hit the POST http request \"([^\"]*)\" for token on SIT$")
	public void user_hit_the_POST_http_request_for_token_on_SIT(String sitPOST) throws Throwable 
	{
		RestAssured.baseURI = sitPOST ;
        String response = given()
        		.header("Content-Type", "application/x-www-form-urlencoded; charset=utf-8")
        		.header("Authorization" , "Basic MTIzNDptb3JuaW5n")
        	    .formParam("username", "morning-jump")
        	    .formParam("password", "morning")
        	    .formParam("grant_type", "password")
        		.when()
        		.post(sitPOST)
        		.then()
        		.assertThat().statusCode(200)
        		.extract().response().asString();
        //System.out.println("30 Sit Env POST Request Response : "+response);
        LogCapture.info("30 Sit Env POST Request Response : "+response);
        
        JsonPath js = new JsonPath(response);
        sitAccessToken30 = js.getString("access_token");
        //System.out.println("30 Sit Environment Access Token Is : "+sitAccessToken30);
        LogCapture.info("30 Sit Environment Access Token Is : "+sitAccessToken30);
	}
	
	@When("^User hit the GET http request \"([^\"]*)\" for getting the user details on SIT$")
	public void user_hit_the_GET_http_request_for_getting_the_user_details_on_SIT(String sitGET) throws Throwable 
	{
		//System.out.println(sitAccessToken30);
		LogCapture.info(sitAccessToken30);
		RestAssured.baseURI = sitGET;
        RequestSpecification httpRequest = RestAssured.given();
        httpRequest.header("Authorization", "Bearer "+ sitAccessToken30);
       
        Response response = httpRequest.get(sitGET);
        ResponseBody body = response.getBody();
        String bodyStringValue = body.asString();
        //System.out.println(bodyStringValue);
        LogCapture.info(bodyStringValue);
        actStatusCode = response.getStatusCode();
        //System.out.println(actStatusCode);
	}
	
	@Then("^User validate the Status code as \"([^\"]*)\" on SIT$")
	public void user_validate_the_Status_code_as_on_SIT(String Scode) throws Throwable 
	{
		//System.out.println("Status code of GET User details request on SIT --- "+actStatusCode);
		LogCapture.info("Status code of GET User details request on SIT --- "+actStatusCode);
		
		int expStatusCode = Integer.parseInt(Scode);
		
		if(actStatusCode == expStatusCode)
		{
			LogCapture.info("30 SIT Server is up and running successfully...");
		}
		else 
		{
			LogCapture.info("30 SIT Server is not up and running...");
			//SendMail.execute("AAA");
		}
	}
	
	@Given("^User hit the POST http request \"([^\"]*)\" for token on Stagging$")
	public void user_hit_the_POST_http_request_for_token_on_Stagging(String stagPOST) throws Throwable 
	{
		RestAssured.baseURI = stagPOST ;
        String response = given()
        		.header("Content-Type", "application/x-www-form-urlencoded; charset=utf-8")
        		.header("Authorization" , "Basic MTIzNDpzYW5kYm94QEFnb3Jh")
        	    .formParam("username", "sandbox-user")
        	    .formParam("password", "Agora@2022")
        	    .formParam("grant_type", "password")
        		.when()
        		.post(stagPOST)
        		.then()
        		.assertThat().statusCode(200)
        		.extract().response().asString();
        //System.out.println("25 Stagging Env POST Request Response : "+response);
        LogCapture.info("25 Stagging Env POST Request Response : "+response);
        
        JsonPath js = new JsonPath(response);
        stagAccessToken25 = js.getString("access_token");
        //System.out.println("25 Stagging Environment Access Token Is : "+stagAccessToken25);
        LogCapture.info("25 Stagging Environment Access Token Is : "+stagAccessToken25);
	}

	@When("^User hit the GET http request \"([^\"]*)\" for getting the user details on Stagging$")
	public void user_hit_the_GET_http_request_for_getting_the_user_details_on_Stagging(String stagGET) throws Throwable
	{
		//System.out.println(stagAccessToken25);
		LogCapture.info(stagAccessToken25);
		RestAssured.baseURI = stagGET;
        RequestSpecification httpRequest = RestAssured.given();
        httpRequest.header("Authorization", "Bearer "+ stagAccessToken25);
       
        Response response = httpRequest.get(stagGET);
        ResponseBody body = response.getBody();
        String bodyStringValue = body.asString();
        //System.out.println(bodyStringValue);
        LogCapture.info(bodyStringValue);
        actStatusCode = response.getStatusCode();
        //System.out.println(actStatusCode);
	}

	@Then("^User validate the Status code as \"([^\"]*)\" on Stagging$")
	public void user_validate_the_Status_code_as_on_Stagging(String Scode) throws Throwable 
	{
		//System.out.println("Status code of GET User details request on Stagging --- "+actStatusCode);
		LogCapture.info("Status code of GET User details request on Stagging --- "+actStatusCode);
		
		int expStatusCode = Integer.parseInt(Scode);
		
		if(actStatusCode == expStatusCode)
		{
			LogCapture.info("25 Stagging Server is up and running successfully...");
		}
		else 
		{
			LogCapture.info("25 Stagging Server is not up and running...");
			//SendMail.execute("AAA");
		}
	}
	
/*      Titan Cards API      */
	
	@Given("^User hit the POST http request \"([^\"]*)\" for bearer token$")
	public void user_hit_the_POST_http_request_for_bearer_token(String tokenReq) throws Throwable 
	{
		String vTokenReq = Constants.CONFIG.getProperty(tokenReq);
		
		RestAssured.baseURI = vTokenReq ;
        String response = given()
        		.header("Content-Type", "application/x-www-form-urlencoded")
        		.header("Accept-Encoding" , "gzip,deflate")
        	    .header("Accept-Language", "en-US,en;q=0.8")
        	    .header("Accept", "application/x-www-form-urlencoded")
        	    .body("grant_type=password&client_id=auth_token_service&username=cd_api_user&password=Currenc!es@E145AA&client_secret=857f21c0-4c5d-4022-8c0c-4ead1ffdb6fc")
        		.when()
        		.post(vTokenReq)
        		.then()
        		.assertThat().statusCode(200)
        		.extract().response().asString();
        LogCapture.info("HTTP Post request of token API response is : "+response);
       
        JsonPath js = new JsonPath(response);
        Constants.bearerToken = js.getString("access_token");
        LogCapture.info("Access token is : "+Constants.bearerToken);
	}
	
	@When("^User hit the POST http request \"([^\"]*)\" for getting balance amount of customer ID \"([^\"]*)\"$")
	public void user_hit_the_POST_http_request_for_getting_balance_amount_of_customer_ID(String getBalanceReq, String customerID) throws Throwable 
	{
		
		
		HashMap<String, Object> getBalReqBody = new HashMap<>();
		getBalReqBody.put("eventId", "fc958869-5f34-475b-b311-eac338a0d84f");
		getBalReqBody.put("cdCustomerRef", customerID);
		getBalReqBody.put("baseCurrency", "GBP");
	
		String vGetBalanceReq = Constants.CONFIG.getProperty(getBalanceReq);
		
		RestAssured.baseURI = vGetBalanceReq;
		String response = given()
				 .body(getBalReqBody)
				 .header("Content-Type","application/json")
                 .header("Authorization","Bearer "+Constants.bearerToken)
                 .when()
                 .post(vGetBalanceReq)
                 .then()
                 .assertThat().statusCode(200)
                 .extract().response().asString();
        LogCapture.info("HTTP Post request of Get Balance API response is : "+response);
        
        JsonPath js = new JsonPath(response);
        String actualBalance = js.getString("actualBalance");
        String availableBalance = js.getString("availableBalance");
        LogCapture.info("Actual Balance of above customer is : "+actualBalance);
        LogCapture.info("Available Balance of above customer is : "+availableBalance);
        
        Constants.responseCode = js.getString("response_code");
        LogCapture.info("Response Code of get balance API is : "+Constants.responseCode);
	}
	
	@Then("^User validate the Response code \"([^\"]*)\"$")
	public void user_validate_the_Status_code(String expResCode) throws Throwable 
	{
		Assert.assertEquals(Constants.responseCode, expResCode);
		LogCapture.info("Response code is verified for get balance API....");
	}
	
	
	/*********************************/
	
	@Given("^User Generate Token for API Validation from \"([^\"]*)\" for CD application$")
	public void user_Generate_Token_for_API_Validation_from_for_CD_application(String tokenAPI) throws Throwable 
	{
		LogCapture.info("--------------Token Generation started---------------");
        Constants.RESPONSE = Constants.key.post(tokenAPI, "200");
        JsonPath jp = Reusables.rawToJason(Constants.RESPONSE);
        Constants.ACCESS_TOKEN = jp.get("access_token");
        LogCapture.info("--------------Token Generation ended--------------");
	}
	
	@When("^User hit the POST http request \"([^\"]*)\" and check Status code as \"([^\"]*)\" for CD application$")
	public void user_hit_the_POST_http_request_and_check_Status_code_as_for_CD_application(String apiName, String statusCode) throws Throwable 
	{
		LogCapture.info("----------Hitting POST http request for "+apiName+" API started------------");
		Constants.RESPONSE = Constants.key.post(apiName, statusCode);
		JsonPath jp =  Reusables.rawToJason(Constants.RESPONSE);
		Constants.RESPONSE_CODE = jp.get("response_code");
		Constants.RESPONSE_DESCRIPTION = jp.getString("response_description");
		LogCapture.info("----------Hitting POST http request for "+apiName+" API ended------------");
	}
	
	@Then("^User validate Response code as \"([^\"]*)\" and Response description as \"([^\"]*)\"$")
	public void user_validate_Response_code_as_and_Response_description_as(String expResCODE, String expResDEC) throws Throwable 
	{
		LogCapture.info("----------------Response validation started-------------------");
        JsonPath jp = Constants.key.rawToJason(Constants.RESPONSE);
        Assert.assertEquals("PASS" , Constants.key.VerifyText(Constants.RESPONSE_CODE, expResCODE));
        Assert.assertEquals("PASS" , Constants.key.VerifyText(Constants.RESPONSE_DESCRIPTION, expResDEC));
        LogCapture.info("----------------Response validation ended-------------------");
	}

	
	/*  AGORA API STEPDEF  */
	
	@Given("^User Generate Token for API Validation from \"([^\"]*)\" for AGORA$")
	public void user_Generate_Token_for_API_Validation_from_for_AGORA(String agoraTokenAPI) throws Throwable 
	{
		LogCapture.info("--------------Token Generation started---------------");
        Constants.RESPONSE = Constants.key.agoraPostToken(agoraTokenAPI, "200");
        JsonPath jp = Reusables.rawToJason(Constants.RESPONSE);
        Constants.ACCESS_TOKEN = jp.get("access_token");
        System.out.println(Constants.ACCESS_TOKEN);
        LogCapture.info("--------------Token Generation ended--------------");
	}
	
	@When("^User hit the GET http request \"([^\"]*)\" and check Status code as \"([^\"]*)\" for AGORA$")
	public void user_hit_the_GET_http_request_and_check_Status_code_as_for_AGORA(String apiName, String statusCode) throws Throwable 
	{
		LogCapture.info("----------Hitting GET http request for "+apiName+" API started------------");
		Constants.RESPONSE = Constants.key.agoraGET(apiName, statusCode);
		JsonPath jp =  Reusables.rawToJason(Constants.RESPONSE);
		Constants.RESPONSE_CODE = jp.get("state");
		LogCapture.info("----------Hitting GET http request for "+apiName+" API ended------------");
	}

	@Then("^User validate Response code as \"([^\"]*)\"$")
	public void user_validate_Response_code_as(String enableLogin) throws Throwable 
	{
		
	}
	
	//Ingo Money API implementation
	
	@Given("^User hit the POST http request \"([^\"]*)\" and check Status code as \"([^\"]*)\" for User ID$")
	public void user_hit_the_POST_http_request_and_check_Status_code_as_for_User_ID(String apiName, String statusCode) throws Throwable 
	{
		LogCapture.info("------ Hitting POST http request for "+apiName+" API started ------");
		Constants.RESPONSE = Constants.key.post(apiName, statusCode);
		JsonPath jp = Constants.key.rawToJason(Constants.RESPONSE);
		Constants.masonUserID = jp.get("user_details.id");
		System.out.println("Mason user ID is : "+ Constants.masonUserID);
		LogCapture.info("------ Hitting POST http request for "+apiName+" API ended ------");
	}
	
	@Given("^User hit the POST http request \"([^\"]*)\" and check Status code as \"([^\"]*)\" for Add Card details$")
	public void user_hit_the_POST_http_request_and_check_Status_code_as_for_Add_Card_details(String apiName, String statusCode) throws Throwable 
	{
		LogCapture.info("------Fetching the data from database starting------");
		String vDBUrl = Constants.DBCONFIG.getProperty("AgoraSitDB_URL");
		String vDBUname = Constants.DBCONFIG.getProperty("AgoraSitDB_USER");
		String vDBPass = Constants.DBCONFIG.getProperty("AgoraSitDB_PASS");
		
		String vGTQuery = "SELECT id , account , session_id FROM public.gateway_token WHERE user_id = "+Constants.masonUserID+" ORDER BY created_at DESC LIMIT 1";
		
		String jdbcDriver =  "org.postgresql.Driver";
		Connection conn = null;
		Statement stmt = null;
		try
		{			
			Class.forName(jdbcDriver);			
			conn = DriverManager.getConnection(vDBUrl, vDBUname, vDBPass);			
			stmt = conn.createStatement();			
			String sqlQuery = vGTQuery ;			
			ResultSet rs = stmt.executeQuery(sqlQuery);			
			
			while(rs.next())
			{	
				Constants.tableID_GT = rs.getString("id");
				System.out.println("Table Id in gateway token table for the respective user : " +Constants.tableID_GT);
				
				Constants.acc_ID = rs.getString("account");					
				System.out.println("Account Id for the respective user : " +Constants.acc_ID);
				
				Constants.sess_ID = rs.getString("session_id");
				System.out.println("Session Id for the respective user : " +Constants.sess_ID);
			}			
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}		
		LogCapture.info("------Fetching the data from database ended------");
		
		
		LogCapture.info("------ Hitting POST http request for "+apiName+" API started ------");
		try
		{
			// Fetch the body for the add card ingomoney api and update the participant_unique_id1 , participant_unique_id2 , session_id
			String bodyInString = Constants.key.readExcel(apiName, "Body");						
			Map<String , Object> mainMap = Constants.key.jsonStringIntoMap(bodyInString);
			
			// retrieving the submap
			Map<String , Object> ancillary = (Map<String, Object>) mainMap.get("data");
			ancillary = (Map<String, Object>) ancillary.get("ancillary");
			ancillary.put("participant_unique_id1", Constants.tableID_GT);
			ancillary.put("participant_unique_id2", Constants.acc_ID);
			ancillary.put("session_id", Constants.sess_ID);
			
			// Converting map into json string
			String finalBody = Constants.key.mapIntoString(mainMap);
			System.out.println("Final json body for add card api is : " +finalBody);
			
			int statusCODE = Integer.parseInt(statusCode);
			String response = "";
			String HeaderFromExcel = Constants.key.readExcel(apiName, "Headers");
            String queryPath = Constants.key.readExcel(apiName, "Query Path");
            String queryParams = Constants.key.readExcel(apiName, "Query Parameter");            
            Map<String, String> headerMap = Constants.key.getStringStringMap(HeaderFromExcel);
            Map<String, String> queryParameterMap = Constants.key.getStringStringMap(queryParams);
            
            RestAssured.baseURI = Constants.key.readExcel(apiName, "Base URI");
            		   response = given()
            				   	.headers(headerMap)
            				   	.body(finalBody)
            				   	.when()
            				   	.post(queryPath)
            				   	.then().assertThat().statusCode(statusCODE).extract().response().asString();          
		}
		catch (Exception e) 
		{
			LogCapture.info("Error occurred during a POST call. The error is: " + e);
            e.printStackTrace();
		}
		LogCapture.info("------ Hitting POST http request for "+apiName+" API ended ------");
	}
		
	@Given("^User hit the POST http request \"([^\"]*)\" and check Status code as \"([^\"]*)\" for Revert money from Account$")
	public void user_hit_the_POST_http_request_and_check_Status_code_as_for_Revert_money_from_Account(String apiName, String statusCode) throws Throwable 
	{
		LogCapture.info("------Fetching the data from database starting------");
		String vDBUrl = Constants.DBCONFIG.getProperty("AgoraSitDB_URL");
		String vDBUname = Constants.DBCONFIG.getProperty("AgoraSitDB_USER");
		String vDBPass = Constants.DBCONFIG.getProperty("AgoraSitDB_PASS");
		
		String vFTQuery = "SELECT id ,funds_transfer.user FROM public.funds_transfer WHERE funds_transfer.user="+Constants.masonUserID+" ORDER by created_at DESC LIMIT 1";
		
		String jdbcDriver =  "org.postgresql.Driver";
		Connection conn = null;
		Statement stmt = null;
		
		try
		{			
			Class.forName(jdbcDriver);			
			conn = DriverManager.getConnection(vDBUrl, vDBUname, vDBPass);			
			stmt = conn.createStatement();			
			String sqlQuery = vFTQuery ;			
			ResultSet rs = stmt.executeQuery(sqlQuery);			
			
			while(rs.next())
			{			
				Constants.tbl_ID = rs.getString("id");
				System.out.println("Table id for the respective user transaction : " +Constants.tbl_ID);
				
				Constants.user_FT = rs.getString("user");					
				System.out.println("User id in funds transfer table for the respective user : " +Constants.user_FT);						
			}			
			rs.close();
			stmt.close();
			conn.close();
		}
		catch (SQLException se) 
		{
			se.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}		
		LogCapture.info("------Fetching the data from database ended------");
		
		
		
		LogCapture.info("------ Hitting POST http request for "+apiName+" API started ------");
		
		//Fetch the body for the revert money api and update the  table id , account 
		String bodyInString = Constants.key.readExcel(apiName, "Body");		
		Map<String , Object> mainMap = Constants.key.jsonStringIntoMap(bodyInString);
		
		//retrieving the submap
		Map<String , Object> ancillary = (Map<String, Object>) mainMap.get("data");
		ancillary = (Map<String, Object>) ancillary.get("ancillary");
		ancillary.put("participant_unique_id1", Constants.tbl_ID);
		ancillary.put("participant_unique_id2", Constants.user_FT);
		
		// Converting map into json string
		String finalBody = Constants.key.mapIntoString(mainMap);
		System.out.println("Final json body for add card api is : " +finalBody);
		
		
		int statusCODE = Integer.parseInt(statusCode);
		String response = "";
		String HeaderFromExcel = Constants.key.readExcel(apiName, "Headers");
        String queryPath = Constants.key.readExcel(apiName, "Query Path");
        String queryParams = Constants.key.readExcel(apiName, "Query Parameter");            
        Map<String, String> headerMap = Constants.key.getStringStringMap(HeaderFromExcel);
        Map<String, String> queryParameterMap = Constants.key.getStringStringMap(queryParams);
		
        RestAssured.baseURI = Constants.key.readExcel(apiName, "Base URI");
		   response = given()
				   	.headers(headerMap)
				   	.body(finalBody)
				   	.when()
				   	.post(queryPath)
				   	.then().assertThat().statusCode(statusCODE).extract().response().asString();
		   
		JsonPath js = Constants.key.rawToJason(response);
		System.out.println("API Response : "+js.getString("status"));
        
		LogCapture.info("------ Hitting POST http request for "+apiName+" API ended ------");
	}
	
	/* Verify the account balance steps for ingomoney started */
	@Then("^adnroid user verifying the account balance after adding the money$")
	public void adnroid_user_verifying_the_account_balance_after_adding_the_money() throws Throwable 
	{
		String vObjBalanceTxtIM = Constants.ANDROIDMasonsOR.getProperty("BalanceTxtIM");
		Assert.assertEquals("PASS", Constants.key.eleLocatedDisplayed(vObjBalanceTxtIM));
		String b = Constants.key.readText(vObjBalanceTxtIM);
		Constants.accBalMap.put("After Add Money", b);
		System.out.println("Mason Account Balance after Money added : " + Constants.accBalMap.get("After Add Money"));
	}

	@Then("^adnroid user verifying the account balance after reverting the money$")
	public void adnroid_user_verifying_the_account_balance_after_reverting_the_money() throws Throwable 
	{
		String vObjBalanceTxtIM = Constants.ANDROIDMasonsOR.getProperty("BalanceTxtIM");
		Assert.assertEquals("PASS", Constants.key.eleLocatedDisplayed(vObjBalanceTxtIM));
		String a = Constants.key.readText(vObjBalanceTxtIM);
		Constants.accBalMap.put("After Revert Money", a);
		System.out.println("Mason Account Balance after Money reverse through web-hook : " + Constants.accBalMap.get("After Revert Money"));
		
		System.out.println(Constants.accBalMap);
		
		String val1 = Constants.accBalMap.get("After Add Money");  
		String val2 = Constants.accBalMap.get("After Revert Money");
		//System.out.println(val1);
		//System.out.println(val2);
		Assert.assertNotEquals(val1 ,  val2);
	}
	/* Verify the account balance steps for ingomoney ended */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
