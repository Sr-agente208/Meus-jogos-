# ENTITY_DATABASE.md

## Objetivo

Este documento organiza as entidades do jogo em uma base estruturada para facilitar implementação, balanceamento, narrativa e IA.

Toda entidade importante do projeto deve ter registro próprio.

---

## O que é uma entidade

Entidade é qualquer presença relevante no jogo que possua:

- identidade
- comportamento
- função narrativa ou mecânica
- impacto no jogador
- estado próprio

Isso inclui:

- inimigos
- bosses
- NPCs especiais
- aparições
- manifestações anômalas
- criaturas ligadas à história

---

## Campos obrigatórios

Toda entidade deve conter:

- ID
- nome
- tipo
- função
- capítulo de aparição
- comportamento
- sinais de percepção
- fraquezas
- relação com a narrativa
- evento de ativação
- evento de derrota ou encerramento

---

## Estrutura padrão

```text
ENTITY_ID:
NAME:
TYPE:
ROLE:
CHAPTER:
ORIGIN:
BEHAVIOR:
SENSORS:
WEAKNESSES:
EVENTS:
NOTES:
```

---

## Tipos de entidade

### 1. Inimigo comum
Serve para pressão, perseguição e ameaça contínua.

### 2. Boss
Usado em momentos de clímax e confronto principal.

### 3. NPC especial
Usado para lore, missão, apoio ou troca de informação.

### 4. Entidade anômala
Presença estranha, fora da lógica normal do mundo.

### 5. Aparição
Entidade temporária ligada a evento, susto ou narrativa.

---

## Registro técnico

### Exemplo de ficha

```text
ENTITY_ID: ENT_001
NAME: Sombras do Corredor
TYPE: Inimigo comum
ROLE: Pressão e perseguição
CHAPTER: 1
ORIGIN: Anomalia do local
BEHAVIOR: Patrulha, investiga ruídos e persegue ao detectar o jogador
SENSORS: visão, audição, proximidade
WEAKNESSES: luz intensa, esconderijo, distração sonora
EVENTS: EVT_001, EVT_005
NOTES: aparece apenas em corredores específicos
```

---

## Campos narrativos

Além da parte técnica, cada entidade precisa ter um bloco narrativo.

### Narrativa
- origem
- relação com o mundo
- motivo da presença
- papel na história
- conexão com capítulos
- implicações para finais ou eventos

### Regras
- Entidade importante não pode existir sem contexto.
- Se a entidade tem lore, isso deve ser documentado.
- Se a entidade muda com o capítulo, essa mudança deve estar registrada.

---

## Campos de gameplay

### Comportamento
Descrever exatamente como a entidade age.

Exemplos:
- patrulha rota fixa
- reage a ruído
- caça o jogador quando vê movimento
- bloqueia passagem
- ativa evento ao ser observada

### Regras
- o comportamento deve ser previsível o suficiente para o jogador aprender
- o comportamento pode evoluir conforme capítulo ou evento
- boss e entidade comum não devem compartilhar a mesma lógica sem adaptação

---

## Campos de percepção

### Sensores possíveis
- visão
- audição
- proximidade
- flags narrativas
- presença em área
- tempo decorrido

### Regras
- cada sensor deve ter alcance ou condição definida
- percepção deve ser testável
- a entidade não deve reagir a tudo ao mesmo tempo sem motivo

---

## Relação com eventos

Entidades podem ser ligadas a eventos do jogo.

### Tipos de vínculo
- ativar ao entrar em área
- desaparecer após puzzle
- ficar mais agressiva após capítulo
- mudar de estado após boss
- desbloquear lore após diálogo

### Regras
- todo vínculo importante deve ser registrado em flags
- o evento não pode quebrar a continuidade narrativa
- a entidade deve saber quando foi criada, alterada ou encerrada

---

## Estado da entidade

### Estados comuns
- inativa
- ativa
- patrulha
- alerta
- perseguindo
- atacando
- ferida
- derrotada
- removida

### Regras
- o estado precisa ser salvo quando necessário
- mudanças de estado devem ter gatilho claro
- entidades únicas não devem resetar sem decisão de design

---

## Balanceamento

### O que revisar
- frequência de encontro
- dano
- tempo de reação
- velocidade
- distância de detecção
- duração da perseguição
- impacto no ritmo do capítulo

### Regra
Entidade deve ser assustadora ou útil, mas nunca injusta por acidente.

---

## Organização por capítulos

### Modelo
- capítulo 1: primeiras ameaças
- capítulo 2: expansão do sistema de entidades
- capítulo 3: entidades mais agressivas ou inteligentes
- capítulo 4: clímax e bosses

### Regras
- nem toda entidade precisa aparecer em todos os capítulos
- cada capítulo deve introduzir ou aprofundar algo novo
- a lista de entidades deve crescer com intenção

---

## Organização de arquivos

### Sugestão
- `entities/common/`
- `entities/bosses/`
- `entities/special/`
- `entities/npcs/`
- `entities/apparitions/`
- `entities/database/`

### Para cada entidade nova
Criar ao menos:
- ficha técnica
- comportamento
- relação narrativa
- estados

---

## Checklist antes de adicionar uma entidade

- A função dela está clara?
- Ela tem capítulo definido?
- Existe comportamento documentado?
- Sensores foram definidos?
- Há fraqueza ou forma de contorno?
- A entidade conversa com a narrativa?
- Ela pode ser testada isoladamente?

---

## Regra final

Se a entidade não puder ser explicada em uma ficha curta, ela ainda não está pronta para entrar no jogo.
