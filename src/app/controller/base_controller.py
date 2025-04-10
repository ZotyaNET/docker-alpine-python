from app.model.base_model import BaseModel
from app.view.base_view import BaseView

class BaseController:
    def __init__(self, name):
        self.model = BaseModel(name)
        self.view = BaseView()

    def run(self):
        greeting = self.model.get_greeting()
        self.view.display_message(greeting)