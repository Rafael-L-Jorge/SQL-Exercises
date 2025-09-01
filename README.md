# VP Educa: Análise de Dados e Estatística para Validar Metodologias de Ensino em Cursos Preparatórios

**Aviso:** Este é um projeto de portfólio, desenvolvido com dados, nomes de instituições e cenários fictícios criados exclusivamente para demonstrar habilidades em Análise de Dados, BI e Estatística. Em um contexto real, o escopo seria mais abrangente, incluindo fatores adicionais e análises mais avançadas (ex: regressões estatísticas).

## Contexto
No vestibular de medicina, cada ponto pode definir a aprovação ou a reprovação de um candidato.  
O curso preparatório **VP**, do Rio de Janeiro, criou a turma **VPrimeira**, voltada para estudantes que prestarão a prova da **UCMJ** em 02/08/2025.

O programa tem duração de **10 semanas** e inclui **7 simulados estratégicos**:
- **1** simulado diagnóstico (antes do início das aulas)
- **5** simulados regulares (após as 5 primeiras semanas)
- **1** simulado final (pouco antes do vestibular)

**Formato dos simulados:**
- **Disciplinas:** Biologia e Química
- **Temas:** cada disciplina possui 5 temas principais
- **Questões:** 10 por disciplina (2 por tema), totalizando 20 questões por simulado
- **Pontuação:** 1 ponto por questão (0 ou 1)
- **Registro no banco:** cada questão é armazenada individualmente, vinculada ao aluno, tema, simulado e grau de dificuldade

---

## Objetivo e Hipóteses

**Hipótese principal:**  
A metodologia de ensino da turma **VPrimeira** melhora significativamente o desempenho dos alunos entre o simulado inicial e o final.

**Hipóteses secundárias:**
- A origem escolar influencia o desempenho.
- O grau de dificuldade dos temas afeta os resultados.

---

## Descrição do Projeto
Este projeto **simula um cenário realista** de um curso preparatório, avaliando sua metodologia de ensino por meio de **dados e estatística**.

**Pipeline de dados:**
1. Modelagem relacional no **SQL Server**
2. Processos ETL com **SSIS**
3. Consultas **SQL** para análise exploratória
4. Visualizações interativas no **Power BI**
5. Análises estatísticas com **Python**
6. Relatório técnico com resultados e recomendações

**Perguntas que buscaremos responder:**
- Houve melhora significativa no desempenho geral?
- Quais temas apresentaram maior dificuldade?
- Há influência da origem escolar?
- Existe relação entre dificuldade e acertos?

---

## Relevância
O projeto mostra como **dados e estatística** transformam percepções pedagógicas em **decisões baseadas em evidências**.  
A análise permite ajustes rápidos na metodologia, aumentando a eficácia do ensino, um fator decisivo em cursos preparatórios para carreiras altamente competitivas.

---

## Resultados

- O teste de Shapiro-Wilk mostrou que o simulado diagnóstico seguia normalidade, mas o final não.  
- O teste de Levene indicou homogeneidade das variâncias.  
- Com isso, aplicamos o **Wilcoxon** para comparar os acertos dos alunos entre diagnóstico e final.  
- Resultado: p = 0.408 (p > 0.05) – não houve diferença estatisticamente significativa no desempenho agregado da turma.

---

## Conclusão Estatística

A hipótese principal de que a metodologia da turma **VPrimeira** melhoraria significativamente o desempenho entre diagnóstico e final, **não foi confirmada** pelos dados analisados.  
O desempenho médio permaneceu estável, sem evidências de evolução estatisticamente significativa.
Em termos pedagógicos, alguns alunos melhoraram, outros mantiveram ou reduziram o desempenho, mas o efeito global do curso não foi consistente o suficiente para se refletir estatisticamente.

---

## Dashboards no Power BI

O arquivo `.pbix` com a versão do dashboard desenvolvido está disponível na pasta [`dashboards/`](./dashboards/).  
Ele pode ser aberto no **Power BI Desktop** para exploração dos relatórios interativos.  

---

## Limitações e Próximos Passos

Os achados devem ser lidos à luz de *n* = 35, uso de acertos brutos (escala inteira) e ausência de controle por covariáveis (ex: assiduidade, tempo de estudo, perfil socioeducacional).  
Próximos estudos devem: ampliar a amostra, segmentar análises por disciplina/tema/perfil e integrar resultados de vestibulares reais para medir impacto pedagógico no desfecho final.

---

## Recomendações

- Realizar análises segmentadas (por disciplina, tema ou perfil de aluno) para identificar ganhos pontuais não visíveis no agregado.  
- Ampliar a amostra em estudos futuros para aumentar o poder dos testes.  
- Investigar métodos qualitativos (feedbacks, engajamento dos alunos) para complementar a avaliação quantitativa.  
- Explorar modelos de predição para identificar quais fatores mais impactam no desempenho individual.  
- Expandir a análise para incluir o desempenho dos alunos no vestibular, validando se a evolução nos simulados se traduz em resultados concretos de aprovação.
- Criar mecanismos de acompanhamento individual (dashboards por aluno) para identificar rapidamente os casos em que a metodologia funciona ou não, permitindo intervenções personalizadas.

---

## Organização do Projeto

```
├── .gitignore                       <- Arquivos e diretórios ignorados pelo Git
├── ambiente_github_projeto3.yml     <- Arquivo de requisitos para reproduzir o ambiente
├── LICENSE                          <- Licença de código aberto (MIT)
├── README.md                        <- Descrição geral do projeto

├── dados/                           <- Arquivos de dados (não disponibilizados)
├── notebooks/                       <- Jupyter Notebook de análise
├── imagens/                         <- Imagens utilizadas no projeto
├── referencias/                     <- Dicionário de dados

└── src/                             <- Código-fonte
    ├── __init__.py                  <- Torna um módulo Python
    └── funcoes_projeto3.py          <- Funções utilizadas no projeto

└── dashboards/                      <- diretório para arquivos do Power BI
    ├── Dashboard_vp_educa           <- Arquivo do Power BI

```
---

# Configuração do ambiente

1. Faça o clone do repositório.

    ```bash
    git clone git@github.com:Rafael-L-Jorge/vp-educacional-analytics.git
    ```

2. Crie um ambiente virtual para o seu projeto utilizando o `conda`.

   ```bash
   conda env create -f ambiente_github_projeto3.yml --name vpeducadados
   ```

## Dicionário de Dados | 

### Banco de Dados SQL
[Clique aqui](referencias/01_dicionario_de_dados_sqlserver.md)

### Power BI
[Clique aqui](referencias/02_dicionario_de_dados_pbi.md)

Acesse o dashboard em: [AQUI](https://app.powerbi.com/view?r=eyJrIjoiMDBhNzYzNDUtNzVkZS00ZWQyLWJiZTktZDFiYjY2NjgyNTI1IiwidCI6ImEwOGMzNWQxLWY2ZmMtNDI2MC1hMjUyLWNkM2ZmZWNlMDE2YiJ9)

### Python
[Clique aqui](referencias/03_dicionario_de_dados_python.md)


---

## Fonte dos Dados

Os dados utilizados neste projeto foram criados por **IA**.