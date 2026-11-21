from pathlib import Path
from fastapi import FastAPI, HTTPException
from fastapi.responses import FileResponse, JSONResponse
from fastapi.staticfiles import StaticFiles
import uvicorn
import os
import httpx

BASE = Path(__file__).parent
STATIC = BASE / "mobile" / "static"
app = FastAPI(title="Montador de Deck Magic")
app.mount("/static", StaticFiles(directory=STATIC), name="static")

@app.get("/")
def home():
    return FileResponse(STATIC / "index.html")

@app.get("/baixar")
def download_page():
    return FileResponse(STATIC / "baixar.html")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/api/market/ligamagic")
async def ligamagic_market(card: str):
    card = card.strip()
    if not card or len(card) > 160:
        raise HTTPException(status_code=400, detail="Nome de carta inválido.")
    api_key = os.getenv("REEFAPI_KEY")
    if not api_key:
        return JSONResponse({"configured": False, "message": "REEFAPI_KEY não configurada."})
    try:
        async with httpx.AsyncClient(timeout=25) as client:
            response = await client.post(
                "https://api.reefapi.com/ligamagic/v1/card",
                headers={"x-api-key": api_key, "content-type": "application/json"},
                json={"game": "magic", "card": card, "offers_limit": 20}
            )
        response.raise_for_status()
        return response.json()
    except httpx.HTTPStatusError as exc:
        raise HTTPException(status_code=502, detail=f"Serviço de preços respondeu com erro HTTP {exc.response.status_code}.")
    except Exception:
        raise HTTPException(status_code=502, detail="Serviço de preços indisponível no momento.")

if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=8000)
