from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/text")
async def get_text():
    return {"message": "MujText01"}
@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}
