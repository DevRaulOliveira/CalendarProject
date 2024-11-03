import pandas as pd #import da planilha excel
import boto3 as bt
import requests
from io import BytesIO

# Localizacao do arquivo no GitHub
url = 'https://github.com/DevRaulOliveira/CalendarProject/blob/Main/Documents/ListaFeriados.xlsx'

response = requests.get(url)
file = BytesIO(response.content)

# Conexao com o dynamoDb
dynamodb = bt.resource('dynamodb', region_name='sa-east-1')
tabela = dynamodb.Table('cadFeriado')

# Ler arquivo excel
df = pd.read_excel('https://github.com/DevRaulOliveira/CalendarProject/raw/Main/Documents/ListaFeriados.xlsx', engine='openpyxl')


# Inserir dados no dynamoDb
def inserir_item(item):
    tabela.put_item(Item=item)

for index, row in df.interrows():
    item = {
        'codUf': int(row['COD_UF']),
        'uf': row['UF'],
        'estado': row['ESTADO'],
        'codMun': int(row['COD_MUN']),
        'municipio': row['MUNICIPIO'],
        'feriado': row['FERIADO'],
        'data': row ['DATA']
    }
    inserir_item

print("Dados importados com sucesso!")
