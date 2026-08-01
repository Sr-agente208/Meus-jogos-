# NARRATIVE_FLOW.md

## Sistema narrativo

Este documento define como a narrativa do jogo deve funcionar.

A ideia é impedir inconsistências e permitir que qualquer desenvolvedor ou IA consiga expandir a história sem quebrar eventos anteriores.

---

## Filosofia

A história deve ser descoberta.

Nunca entregar todas as respostas de uma vez.

O jogador deve montar o quebra-cabeça através de:

- exploração
- documentos
- ambiente
- diálogos
- eventos
- observação

---

## Estrutura geral

Prólogo

→

Capítulo 1

→

Capítulo 2

→

Capítulo 3

→

Capítulo 4

→

Final

→

Pós-créditos opcional

---

## Estrutura de um capítulo

Cada capítulo precisa possuir:

- introdução
- exploração
- primeiro conflito
- descoberta
- escalada
- clímax
- conclusão
- gancho para o próximo

---

## Eventos narrativos

Todo evento importante precisa possuir:

- ID
- nome
- objetivo
- condição de ativação
- consequência
- flags alteradas
- personagens envolvidos
- capítulo

### Exemplo

- EVENT_ID: EVT_001
- Nome: Primeira Anomalia
- Ativação: entrar no laboratório
- Consequência: desbloqueia perseguição
- Flag: `first_anomaly = true`

---

## Flags narrativas

Toda decisão importante altera uma flag.

Exemplos:

- `player_found_key`
- `boss_defeated`
- `generator_on`
- `chapter2_started`
- `player_read_document_04`
- `entity_seen_first_time`

Essas flags controlam:

- diálogos
- cutscenes
- portas
- eventos
- finais

---

## Cutscenes

Cada cutscene deve possuir:

- ID
- nome
- duração
- objetivo
- capítulo
- personagens
- evento que inicia
- evento que termina

---

## Diálogos

Cada diálogo precisa informar:

- quem fala
- quando acontece
- qual evento desbloqueia
- se altera alguma flag

---

## Documentos

Os documentos espalhados pelo mapa precisam conter:

- lore
- pistas
- códigos
- senhas
- história
- personagens

Nunca apenas texto sem função.

---

## Personagens

Cada personagem deve possuir:

- nome
- função
- objetivo
- estado
- relacionamentos
- eventos importantes

---

## Entidades

Cada entidade precisa possuir:

- origem
- objetivo
- comportamento
- fraquezas
- eventos ligados
- capítulos onde aparece

---

## Progressão

Cada capítulo deve desbloquear:

- novas áreas
- novos inimigos
- novas mecânicas
- novos documentos
- novas respostas
- mais perguntas

---

## Ritmo

Alternar sempre entre:

- exploração
- descoberta
- calma
- suspense
- perseguição
- descanso
- nova descoberta

Nunca manter perseguições constantes.

---

## Finais

Cada final precisa informar:

- condições
- flags necessárias
- eventos obrigatórios
- cutscenes utilizadas

---

## Regra principal

A história deve ser compreendida mesmo que o jogador não encontre todos os documentos.

Quem explorar mais apenas descobrirá mais detalhes.
