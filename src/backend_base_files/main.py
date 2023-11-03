from fastapi import FastAPI
from fastapi.middleware import Middleware
from fastapi.middleware.cors import CORSMiddleware
from mangum import Mangum
from routers import search


middleware = [
    Middleware(
        CORSMiddleware, allow_origins=["*"], allow_methods=["*"], allow_headers=["*"]
    )
]

app = FastAPI(middleware=middleware)


app.include_router(search.router)


@app.get("/")
async def root():
    return {}


handler = Mangum(app)
