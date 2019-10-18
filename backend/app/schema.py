from pydantic import BaseModel
from enum import Enum


class User(BaseModel):
    name: str
    age: int


class Metrics(str, Enum):
    cosine = "cosine"
    euclid = "euclid"
    hamming = "hamming"
