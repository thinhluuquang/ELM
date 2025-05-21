from robot.api.deco import keyword
from SeleniumLibrary import SeleniumLibrary

class LoginKeywords:
    def __init__(self):
        self.selenium = SeleniumLibrary()

    @keyword
    def login_with_credentials(self, username, password):
        self.selenium.input_text("//input[@name='email']", username)
        self.selenium.input_text("//input[@name='password']", password)
        self.selenium.click_button("//button[contains(.,'Đăng nhập')]")
