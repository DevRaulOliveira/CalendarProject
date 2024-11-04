import pandas as pd  # Import da planilha Excel
import boto3
import requests
from io import StringIO

url ='https://github.com/DevRaulOliveira/CalendarProject/blob/Main/Documents/ListFerComp.csv'
response = requests.get(url)
file = StringIO(response.content.decode('utf-8'))

file_path = 'ListFerComp.csv'
df = pd.read_csv(file)

dynamodb= boto3.resource('dynamodb', region_name='sa-east-1')
tabela = dynamodb.Table('cadFeriado')

# Função para inserir itens no DynamoDB
def inserir_item(item):
    tabela.put_item(Item=item)

# Loop corrigido para iterar sobre as linhas do DataFrame e inserir dados
for index, row in df.iterrows():
    item = {
        'codUf': int(row['COD_UF']),
        'uf': row['UF'],
        'estado': row['ESTADO'],
        'codMun': int(row['COD_MUN']),
        'municipio': row['MUNICIPIO'],
        'feriado': row['FERIADO'],
        # Converter o tipo Timestamp para string no formato ISO 8601
        'data': row['DATA'].isoformat() if not pd.isnull(row['DATA']) else None
    }
    inserir_item(item)
