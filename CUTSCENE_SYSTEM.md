# CUTSCENE_SYSTEM.md

## Objetivo

Este documento define como as cutscenes devem ser estruturadas, acionadas, reproduzidas e integradas aos sistemas do jogo.

Cutscenes devem reforçar a narrativa sem quebrar o estado do gameplay.

---

## Princípios

- Cutscene deve ter propósito narrativo ou de transição.
- A lógica da cutscene deve ficar separada da gameplay.
- Eventos importantes precisam de ID próprio.
- O estado anterior e posterior da cena deve ser previsível.
- Cutscenes não devem causar perda acidental de progresso.

---

## Estrutura base

Cada cutscene deve possuir:

- ID
- nome
- capítulo
- duração aproximada
- objetivo narrativo
- personagens envolvidos
- local
- evento de entrada
- evento de saída
- diálogos
- áudio
- câmera
- animações
- flags alteradas

---

## Exemplo de ficha

```text
CUTSCENE_ID: CS_001
NAME: Primeira Anomalia
CHAPTER: 1
LOCATION: Laboratório
TRIGGER: EVT_001
PURPOSE: Revelar a primeira presença anômala
CHARACTERS: Player, Entity_01
OUTPUT_EVENT: EVT_002
FLAGS: first_anomaly_seen = true
```

---

## Tipos de cutscene

### Narrativa
Foco em diálogo e revelações.

### Revelação
Apresenta entidade, ambiente ou informação importante.

### Perseguição
Transição direta para ameaça ou fuga.

### Boss
Apresenta boss, mudança de fase ou derrota.

### Final
Conclui capítulo ou jogo.

### Ambiental
Pequena sequência usada para alterar percepção do local.

---

## Gatilhos

Cutscenes podem ser iniciadas por:

- entrada em área
- interação com objeto
- conclusão de puzzle
- coleta de item
- término de diálogo
- derrota de boss
- flag narrativa
- mudança de capítulo
- evento temporizado

### Regras
- O gatilho deve ser documentado.
- A mesma cutscene não deve tocar repetidamente sem intenção.
- Gatilhos incompatíveis devem ser bloqueados.

---

## Estado do jogo durante a cutscene

Ao iniciar uma cutscene, o sistema pode:

- bloquear movimento
- bloquear interação
- reduzir ou remover HUD
- controlar câmera
- silenciar certas ações
- pausar IA específica

### Regras

O bloqueio deve ser temporário e restaurado ao terminar.

O jogo nunca deve ficar preso permanentemente em "cutscene mode".

---

## Câmera

### Funções possíveis
- enquadramento cinematográfico
- foco em personagem
- foco em objeto
- movimento suave
- zoom
- transição entre ângulos

### Regras
- câmera precisa respeitar limites do cenário
- evitar cortes sem intenção
- restaurar câmera do jogador ao final

---

## Diálogos

Cutscenes podem usar o `DIALOGUE_SYSTEM.md`.

### Regras
- falas devem usar IDs de localização
- escolhas só aparecem quando previstas
- flags podem ser alteradas por falas
- diálogo importante deve ser sincronizado com a ação visual

---

## Áudio

Cutscenes podem controlar:

- música
- efeitos
- vozes
- ambiente
- stingers

### Regras
- áudio da cutscene deve respeitar o sistema de volume
- transições de música devem ser controladas
- efeitos críticos não devem ser mascarados pela trilha

---

## Animações

### Elementos
- personagens
- objetos
- câmeras
- partículas
- efeitos visuais

### Regras
- animações precisam ter início e fim claros
- evitar dependência de frame perfeito sem fallback
- eventos críticos devem ser acionados por marcadores ou sinais

---

## Integração com gameplay

### Antes da cutscene
Definir:
- estado do jogador
- posição
- estado da IA
- câmera

### Depois da cutscene
Restaurar:
- controle do jogador
- câmera
- HUD
- IA
- interações

Também executar o evento de saída e atualizar flags.

---

## Skippable

Cada cutscene deve definir se pode ser pulada.

### Opções
- não pulável
- pulável depois de assistir uma vez
- sempre pulável

### Regra
Cutscenes essenciais para entendimento não devem depender exclusivamente do jogador assistir para continuar a progressão.

---

## Replay

Cutscenes importantes podem ter replay em menu, quando fizer sentido.

### Regras
- replay não pode alterar progresso
- replay deve ignorar flags de gameplay
- conteúdo de replay deve respeitar localização e áudio

---

## Save durante cutscenes

### Regras
- não salvar no meio de uma transição crítica
- salvar após eventos importantes quando necessário
- registrar flags depois que a cena realmente terminou

---

## Organização de arquivos

### Sugestão
- `cutscenes/chapter_01/`
- `cutscenes/chapter_02/`
- `cutscenes/chapter_03/`
- `cutscenes/chapter_04/`
- `cutscenes/shared/`

Cada cutscene pode possuir:

```text
CS_001/
├── scene
├── dialogue
├── animation
├── audio
└── README.md
```

---

## QA de cutscenes

Verificar:

- cutscene inicia corretamente?
- personagem está na posição correta?
- câmera funciona?
- áudio sincroniza?
- diálogos aparecem?
- flags são alteradas corretamente?
- controle retorna ao jogador?
- save continua válido?
- cutscene pode ser pulada sem quebrar o jogo?

---

## Regra final

Uma cutscene deve terminar levando o jogo para um estado conhecido.

Se depois da cena ninguém souber quem controla a câmera, quem controla a IA ou qual flag mudou, a cutscene não está pronta.
