from fastapi import FastAPI
from starlette.responses import UJSONResponse

from app.schema import User, Metrics


app = FastAPI()


@app.get("/")
def home():
    return {"message": "Hello world"}


@app.post("/age/", response_model=User, response_class=UJSONResponse)
def age_user(user: User):
    user.age += 1
    return user


@app.post("/similarity/{metric}")
def similarity(metric: Metrics):
    return {"selected_metric": metric}
