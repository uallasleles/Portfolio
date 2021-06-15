import os
import csv
import pickle
import requests
from bs4 import BeautifulSoup

# ============================================================================
URL = "http://localhost:8000/"
FILENAME = "carros.csv"


def fetch_page(page):
    print("Buscando a página...")
    page_source = requests.get(page)
    print("Testando o status da requisição...")
    test_page_source(page_source)

    return page_source


def test_page_source(ps):
    assert ps.status_code == 200, f"Erro ao buscar página. Código de Status {ps.status_code}. Verifique a conexão!"

    return 'Ok'


def extract_key_val(item):
    list_keys = [item.find('span', class_='car_name')['class'][0],
                 item.find('span', class_='from')['class'][0],
                 item.find('span', class_='mpg')['class'][0],
                 item.find('span', class_='cylinders')['class'][0],
                 item.find('span', class_='horsepower')['class'][0],
                 item.find('span', class_='weight')['class'][0],
                 item.find('span', class_='acceleration')['class'][0]]

    list_vals = [item.find('span', class_='car_name').text,
                 item.find('span', class_='from').text,
                 item.find('span', class_='mpg').text,
                 item.find('span', class_='cylinders').text,
                 item.find('span', class_='horsepower').text,
                 item.find('span', class_='weight').text,
                 item.find('span', class_='acceleration').text]

    # dict_row = dict(zip(list_keys, list_vals)) # ou...
    dict_row = {k: v for k, v in zip(list_keys, list_vals)}

    return dict_row


def data_extract(soup):
    itens = soup.find_all('div', class_='car_block')

    rows_itens = []

    for item in itens:
        row_item = extract_key_val(item)
        rows_itens.append(row_item)

    with open(FILENAME, mode="w") as open_file:
        writer = csv.DictWriter(f=open_file, fieldnames=row_item.keys(), delimiter=';')
        writer.writeheader()
        writer.writerows(rows_itens)


# Bloco principal
if __name__ == "__main__":

    # 1 - Arquivo para guardar os dados copiados em cache
    filename = 'raw_data.pickle'

    # 2 - Se o arquivo já existir, ele será carregado
    if os.path.exists(filename):
        raw_data = pickle.load(open(filename, 'rb'))
    else:
        # 3 - Senão, os dados serão copiados da página
        raw_data = fetch_page(URL)
        pickle.dump(raw_data, open(filename, 'wb'))

    # 4 - Realiza o parser
    SOUP = BeautifulSoup(raw_data.text, 'html.parser')

    # 5 - Processa os dados
    data_extract(SOUP)
