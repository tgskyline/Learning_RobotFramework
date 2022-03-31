import hashlib


def gerar_hash(conteudo):

    hash_conteudo = hashlib.sha256(str.encode(conteudo)).hexdigest()
    print("Conteúdo: {}".format(conteudo))
    print("Hash gerado: {}".format(hash_conteudo))

    return hash_conteudo


def gerar_hash_arquivo(filename):

    print("Arquivo: {}".format(filename))
    h = hashlib.sha256()
    
    with open(filename, 'rb') as file:
        chunk = 0
        while chunk != b'':
            chunk = file.read(1024)
            h.update(chunk)
    print("Hash gerado: {}".format(h.hexdigest()))

    return h.hexdigest()
