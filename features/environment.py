from selenium import webdriver

def before_all(context):
    context.browser = webdriver.Chrome(r"C:\\Users\\Admin\\LBG-Python-API\\webdrivers\\chromedriver.exe")
    context.browser.maximize_window()

def after_all(context):
    context.browser.quit()
    