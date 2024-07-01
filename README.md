# grafsus

Visualização de dados do SUS em *dashboards* do Grafana.

## Conjuntos de dados atuais

Todos os dados foram obtidos pelo DATASUS. Atualmente, este projeto abrange
apenas o POBR (Painel de Oncologia do Brasil).

## Uso

Dois scripts foram criados na raiz do projeto para subir e derrubar os
contêineres facilmente, `up.sh` e `down.sh`. Para isso, é necessário ter o
Docker instalado na máquina e permissão para executá-lo. `down.sh` oferece a
opção de apagar todos os volumes Docker inutilizados no sistema; se isto não
for feito, é possível que dados sejam duplicados no banco.

Um script foi disponibilizado para obter um subconjunto menor a partir de um
conjunto maior de dados no formato CSV, `data/load/subset.py`. Ele é útil
quando a máquina não possui espaço ou poder suficiente para carregar todos os
dados no banco e consultá-lo de forma rápida o suficiente.
