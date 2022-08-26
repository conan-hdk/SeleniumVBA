Attribute VB_Name = "test_FileUpDownload"
Option Explicit
Option Private Module

Sub test_file_upload()
    'see https://www.guru99.com/upload-download-file-selenium-webdriver.html
    Dim driver As SeleniumVBA.WebDriver, str As String, filePath As String

    Set driver = SeleniumVBA.New_WebDriver
    
    'driver.DefaultIOFolder = ThisWorkbook.path '(this is the default)

    driver.StartEdge
    driver.OpenBrowser
    
    str = "<!DOCTYPE html><html><body><div role='button' class='xyz' aria-label='Add food' aria-disabled='false' data-tooltip='Add food'><span class='abc' aria-hidden='true'>icon</span></body></html>"
    filePath = ".\snippet.html"
    
    driver.SaveHTMLToFile str, filePath
    
    driver.NavigateTo "https://demo.guru99.com/test/upload/"

    driver.Wait 1000
    
    'enter the file path onto the file-selection input field
    driver.FindElement(by.ID, "uploadfile_0").UploadFile filePath 'this is just a special wrapper for sendkeys
    
    driver.Wait 1000

    'check the "I accept the terms of service" check box
    driver.FindElement(by.ID, "terms").Click

    'click the "Submit File" button
    driver.FindElement(by.Name, "send").Click
    
    driver.Wait 1000
            
    driver.CloseBrowser
    driver.Shutdown
End Sub

Sub test_file_download()
    'see https://www.browserstack.com/guide/download-file-using-selenium-python
    Dim driver As SeleniumVBA.WebDriver, caps As SeleniumVBA.WebCapabilities
    Dim dirPath As String
    
    Set driver = SeleniumVBA.New_WebDriver
    
    'driver.DefaultIOFolder = ThisWorkbook.path '(this is the default)
    
    dirPath = ".\" 'download to same directory as this excel file

    driver.StartChrome
    
    driver.DeleteFiles ".\BrowserStack - List of devices to test on*.csv"
    
    Set caps = driver.CreateCapabilities

    caps.SetPreference "download.default_directory", dirPath
    caps.SetPreference "download.prompt_for_download", False
    caps.SetPreference "plugins.always_open_pdf_externally", True 'if its a pdf then bypass the pdf viewer
    
    'caps.SetDownloadPrefs dirPath  'this does the above in one line

    driver.OpenBrowser caps
    
    driver.NavigateTo "https://www.browserstack.com/test-on-the-right-mobile-devices"
    driver.Wait 500
    
    driver.FindElementByID("accept-cookie-notification").Click
    driver.Wait 500
    
    driver.FindElementByCssSelector(".icon-csv").ScrollToElement , -150
    driver.Wait 1000
    
    driver.FindElementByCssSelector(".icon-csv").Click
    driver.Wait 2000
            
    driver.CloseBrowser
    driver.Shutdown
End Sub


