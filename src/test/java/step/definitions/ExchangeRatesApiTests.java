package step.definitions;


import io.cucumber.java.Before;
import io.cucumber.java.Scenario;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.junit.Assert;

import java.net.URI;

import static io.restassured.RestAssured.given;


public class ExchangeRatesApiTests {

    private Response response;
    RequestSpecification req;

    @Before
    public void before(Scenario scenario) {
    }

    public void givenRequest(String url, String token) {
        RestAssured.baseURI = url;
        String APIKEY = "apikey";
        req = given().header(APIKEY, token);
    }

    public void postToURL(String url, RequestSpecification req) throws Exception {
        response = req.when().post(new URI(url));
    }

    public void getToURL(String url, RequestSpecification req) throws Exception {
        response = req.when().get(new URI(url));
    }

    public void putToURL(String url, RequestSpecification req) throws Exception {
        response = req.when().put(new URI(url));
    }

    public static void checkAnswerContainsRates(String mainString, String[] substrings) {
        for (String substring : substrings) {
            Assert.assertTrue(mainString.contains(substring));
        }
    }

    @Given("Given to {string} {string}")
    public void givenRequestToUrl(String url, String token) {
        givenRequest(url, token);
    }

    @When("Get Call to {string}")
    public void getCallToUrl(String url) throws Exception {
        getToURL(url, req);
    }

    @When("Post Call to {string}")
    public void postCallToUrl(String url) throws Exception {
        postToURL(url, req);
    }

    @When("Put Call to {string}")
    public void putCallToUrl(String url) throws Exception {
        putToURL(url, req);
    }

    @Then("Response Code {string} is validated")
    public void checkResponseCode(String responseMessage) {
        int responseCode = response.then().extract().statusCode();
        Assert.assertEquals(responseMessage, responseCode + "");
    }

    @Then("Response body has {string} and {string}")
    public void checkResponseBody(String baseCurrency, String rateCurrency) {
        JsonPath jsonPath = new JsonPath(response.asString());

        String rates = jsonPath.getString("rates");
        String base = jsonPath.getString("base");
        String[] rateArray = rateCurrency.split(",");

        checkAnswerContainsRates(rates, rateArray);
        Assert.assertTrue(base.contains(baseCurrency));
    }
}