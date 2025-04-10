class BaseModel:
    def __init__(self, name):
        self.name = name

    def get_greeting(self):
        return f"Hi, {self.name}"