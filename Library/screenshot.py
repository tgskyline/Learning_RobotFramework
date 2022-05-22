import os
from pyscreenshot import grab

def pyscreenshot():
    image = grab() 
    image.save("Evidência do Teste.png")
    return  image
