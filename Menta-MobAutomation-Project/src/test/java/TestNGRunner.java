import org.testng.annotations.AfterSuite;

import com.utility.LogCapture;
import com.utility.SendMail;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

public class TestNGRunner {    
	@CucumberOptions(features = { "src/Feature/" },	
			glue = { "com.cucumber.stepdefinition" },
			strict = false,
			dryRun = false,
				tags = {"@IM_WRU_Screen"},
				     //@IM_AWS , @GL_AWS , @L_AWS
					//AndroidMenta_Sanity
				   // @GL_Sanity , @L_Sanity , @IM_Sanity 
				 	plugin = {
							"html:target/site/cucumber-pretty","rerun:target/rerun.txt", 
					"com.cucumber.listener.ExtentCucumberFormatter:target/cucumber-reports/Extentreport.html",
					},
					//html:target/site/cucumber-pretty", "json:target/cucumber-reports/cucumber.json",
			monochrome = true)
	public class TestNGAppRunner extends AbstractTestNGCucumberTests
	{
		@AfterSuite
		public void sendMail() throws Exception  
		{ 
			//SendMail.execute("InstallAndTestAppReport.htm");
			LogCapture.info("Automation test report mail sent.....!!!!!!!!!");
		}
	}
}