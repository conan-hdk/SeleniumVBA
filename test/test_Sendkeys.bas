Attribute VB_Name = "test_Sendkeys"
Option Explicit
Option Private Module

Sub test_sendkeys()
    Dim driver As SeleniumVBA.WebDriver
    Dim keys As SeleniumVBA.WebKeyboard
    Dim keySeq As String
    
    Set driver = SeleniumVBA.New_WebDriver
    Set keys = SeleniumVBA.New_WebKeyboard

    driver.StartEdge
    
    driver.OpenBrowser
    
    driver.NavigateTo "https://www.google.com/"
    driver.Wait 1000
    
    keySeq = "This is COOKL!" & keys.LeftKey & keys.LeftKey & keys.LeftKey & keys.DeleteKey & keys.ReturnKey
    
    driver.FindElement(by.Name, "q").SendKeys keySeq

    driver.Wait 1000
    
    driver.CloseBrowser
    driver.Shutdown
End Sub

