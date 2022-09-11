Attribute VB_Name = "test_Tables"
Option Explicit
Option Private Module

Sub test_table()
    Dim driver As SeleniumVBA.WebDriver
    Dim v() As Variant, htmlStr As String
    
    Set driver = SeleniumVBA.New_WebDriver

    driver.StartEdge
    driver.OpenBrowser
    
    htmlStr = "<html><body><table border='l' id='mytable'><thead><tr><th>head 1</th><th>head 2</th></tr></thead><tbody><tr><td>1</td><td>2</td></tr><tr><td>3</td><td><table border='l'><tbody><tr><td>4A</td><td>4B</td></tr><tr><td>4C</td><td>4D</td></tr></tbody></table></td></tr></tbody><tfoot><tr><td colspan='2'>footer content</td></tr></tfoot></table></body></html>"
    driver.SaveHTMLToFile htmlStr, ".\snippet.html"
    
    driver.NavigateToFile ".\snippet.html"
    
    driver.Wait 1000
    
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/thead/tr[1]/th[1]").GetText
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/thead/tr[1]/th[2]").GetText
    
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tbody/tr[1]/td[1]").GetText
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tbody/tr[1]/td[2]").GetText
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tbody/tr[2]/td[1]").GetText
    
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tbody/tr[2]/td[2]/table/tbody/tr[1]/td[1]").GetText
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tbody/tr[2]/td[2]/table/tbody/tr[1]/td[2]").GetText
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tbody/tr[2]/td[2]/table/tbody/tr[2]/td[1]").GetText
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tbody/tr[2]/td[2]/table/tbody/tr[2]/td[2]").GetText
    
    Debug.Print driver.FindElement(by.XPath, "//table[@id='mytable']/tfoot/tr[1]/td[1]").GetText
    
    driver.CloseBrowser
    driver.Shutdown
End Sub

Sub test_table_to_array()
    Dim driver As SeleniumVBA.WebDriver
    Dim v() As Variant, htmlStr As String
    
    Set driver = SeleniumVBA.New_WebDriver

    driver.StartEdge
    driver.OpenBrowser
    
    htmlStr = "<html><body><table border='l' id='mytable'><thead><tr><th>head 1</th><th>head 2</th></tr></thead><tbody><tr><td>1</td><td>2</td></tr><tr><td>3</td><td><table border='l'><tbody><tr><td>4A</td><td>4B</td></tr><tr><td>4C</td><td>4D</td></tr></tbody></table></td></tr></tbody><tfoot><tr><td colspan='2'>footer content</td></tr></tfoot></table></body></html>"
    driver.SaveHTMLToFile htmlStr, ".\snippet.html"
    
    driver.NavigateToFile ".\snippet.html"
    
    driver.Wait 1000
    
    v = driver.FindElement(by.ID, "mytable").TableToArray
    
    Debug.Print v(1, 1)
    Debug.Print v(1, 2)
    Debug.Print v(2, 1)
    Debug.Print v(2, 2)
    Debug.Print v(3, 1)
    Debug.Print v(3, 2)(1, 1)
    Debug.Print v(3, 2)(1, 2)
    Debug.Print v(3, 2)(2, 1)
    Debug.Print v(3, 2)(2, 2)
    Debug.Print v(4, 1)
    
    driver.CloseBrowser
    driver.Shutdown
End Sub


