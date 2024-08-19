# Análise de Crimes em São Paulo: 2019-2020

Este repositório contém a análise de dados sobre a criminalidade em São Paulo nos anos de 2019 e 2020. O projeto foi desenvolvido utilizando o **Google BigQuery** para o tratamento e análise dos dados e o **Looker Studio** para a visualização dos resultados. Além disso, foi criada uma apresentação em PowerPoint que sintetiza os principais insights extraídos.

## Objetivo do Projeto

O objetivo principal foi analisar as tendências de crimes em São Paulo ao longo dos dois anos, identificando padrões, variações e insights relevantes que possam ajudar na formulação de políticas públicas mais eficazes para a segurança da cidade.

## Ferramentas Utilizadas

- **Google BigQuery:** Utilizado para o armazenamento, processamento e análise dos dados. BigQuery permitiu realizar consultas SQL avançadas, cálculos de percentuais e agregações de dados para identificar padrões e tendências.
  
- **Looker Studio:** Utilizado para criar dashboards interativos que visualizam os dados de forma intuitiva, facilitando a interpretação dos resultados e permitindo uma análise dinâmica.

- **Microsoft PowerPoint:** Utilizado para compilar os insights em uma apresentação clara e objetiva, facilitando a comunicação dos resultados a diferentes públicos.

## Dados Utilizados

Os dados foram extraídos de fontes públicas e organizados em uma tabela que inclui informações sobre:

- Delegacia
- Tipos de crimes (ex: furtos na região, roubo de carga, homicídios)
- Ano de ocorrência
- Informações geográficas (bairro, cidade, estado)
- Data completa dos eventos

## Processamento de Dados

O tratamento dos dados foi realizado no BigQuery, onde foram aplicadas diversas transformações, como:

- Limpeza de dados e exclusão de duplicatas
- Cálculo de totais por delegacia e tipo de crime
- Análise de percentuais de crescimento entre 2019 e 2020
- Identificação dos crimes mais reincidentes por delegacia

## Insights Extraídos

A análise revelou algumas tendências importantes:

- **Total de Ocorrências:** Foram registrados 268,9 mil crimes no total, sendo 138,3 mil em 2019 e 130,5 mil em 2020.
- **Crime Mais Registrado:** O furto de veículos foi o crime mais comum, com 62,2 mil ocorrências.
- **Variação entre Anos:** Houve uma redução de 30% nos furtos de veículos de 2019 para 2020, enquanto os roubos aumentaram em 60% no mesmo período.
- **Delegacias Mais Impactadas:** A delegacia com mais ocorrências foi o 033º DP de Pirituba.

## Apresentação

Além da análise técnica, foi criada uma apresentação em PowerPoint que resume os principais insights e resultados obtidos. A apresentação serve como um recurso adicional para comunicar os resultados de forma clara e impactante.

## Conclusão

Este projeto fornece uma visão detalhada da criminalidade em São Paulo e pode ser utilizado como base para futuras pesquisas ou para a formulação de estratégias de segurança pública. O uso do **BigQuery** e **Looker Studio** foi essencial para transformar grandes volumes de dados em insights acionáveis, demonstrando a eficácia dessas ferramentas no contexto da análise de dados.

## Links

- **Conjunto de Dados BigQuery:** https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sprojeto-pratico-dados!2scrimes_sp
- **Relatório no Looker Studio:** https://lookerstudio.google.com/reporting/1bd8eb0c-a80c-484c-9272-2a89b0f68aaa
