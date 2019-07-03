# Crimes São Paulo

Este é um projeto da disciplina Data Warehousing e Business Intelligence do curso  de Sistemas de Informação da UFRPE.

As aulas são ministradas pela professora Ceça Moraes.

**Estrutura do projeto:**

Banco Origem  
- consultas.sql - As consultas do DW em SQL
- DUMP_projetoDW_Crimes-2019.07.01.rar (necessário descompactar) - DUMP SQL do Banco Origem (Estrutura e Inserts)
- modelo_banco_origem.mwb - Modelo ER do banco origem

Dados Origem
- Dados Crimes (arquivos origem - csv)

Data Warehouse
- modelo_dw_workbench.mwb - Modelo ER do Data Warehouse
- Pentaho
    - Dimensões - arquivos ETL das dimensões
    - Fato - arquivo ETL do fato
    - SQL - scripts SQL com o DW Vazio e com o DW populado

Heatmap-dw (Aplicação com mapas de calor das consultas)