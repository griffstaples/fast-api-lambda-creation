from fastapi import APIRouter, Depends, Request, Body, HTTPException
from pydantic import BaseModel
from services.search import SearchService


router = APIRouter()


@router.get("/search/{word}")
async def get_nearest_words(word: str):
    search_service = SearchService()

    response = {"word_list": []}
    try:
        response["word_list"] = search_service.get_nearest_words(word)
    except Exception as ex:
        raise HTTPException(500, detail=f"Getting words failed: {ex}") from ex

    return response
