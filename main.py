import time

def imprime():
    time.tzset()
    print("Main Rodando", time.strftime("%X %x %Z") )

if __name__ == '__main__':
    imprime()

