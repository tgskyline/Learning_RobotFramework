import os
from pyscreenshot import grab

def pyscreenshot():
    image = grab() 
    image.save("EvidĂȘncia do Teste.png")
    return  image
