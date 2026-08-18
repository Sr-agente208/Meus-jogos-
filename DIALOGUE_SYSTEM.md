# DIALOGUE_SYSTEM.md

## Objetivo

Este documento define o sistema técnico de diálogos do jogo.

O sistema precisa suportar conversas lineares, escolhas, condições narrativas, flags, localização e integração com cutscenes sem acoplar a UI à lógica da história.

---

## Princípios

- Diálogo é dado narrativo, não lógica espalhada pela cena.
- Texto deve ser separado da interface.
- Escolhas importantes podem alterar flags.
- Todo diálogo deve possuir identificação única.
- O sistema precisa funcionar com localização desde o início.

---

## Estrutura de um diálogo

Cada diálogo deve possuir:

- ID
- capítulo
- cena ou área
- personagem
- texto
- condições
- escolhas, quando existirem
- flags alteradas
- evento de início
- evento de conclusão

### Exemplo

```text
DIALOGUE_ID: DLG_001
CHAPTER: 1
AREA: Laboratory
SPEAKER: Character_A
TEXT_KEY: dialogue.chapter1.character_a_001
CONDITIONS: generator_enabled = true
CHOICES: none
FLAGS_SET: first_conversation = true
START_EVENT: EVT_010
END_EVENT: EVT_011
```

---

## Sistema de falas

Cada fala deve possuir:

- personagem falando
- chave de localização
- duração estimada
- expressão ou animação opcional
- áudio de voz opcional

### Regras
- Não armazenar texto diretamente em código quando houver sistema de localização.
- A fala deve poder existir sem voz.
- A UI apenas apresenta os dados fornecidos pelo sistema.

---

## Escolhas

Escolhas podem ser:

- narrativas
- informativas
- temporárias
- ocultas
- condicionais

### Cada escolha deve definir
- texto
- condição
- próxima linha ou diálogo
- flags alteradas
- consequências

### Exemplo

```text
CHOICE_A
TEXT_KEY: dialogue.choice.answer_a
CONDITION: has_key = true
NEXT: DLG_020
SET_FLAG: trusted_character = true
```

---

## Condições

Diálogos podem depender de:

- flags
- itens
- capítulo
- missão
- relacionamento
- estado do mundo
- primeira ou segunda interação

### Regras
- Condições devem ser verificáveis pelo estado central do jogo.
- O sistema não deve consultar diretamente objetos da cena sem necessidade.
- Condições complexas devem ser documentadas.

---

## Flags

Flags narrativas podem controlar:

- disponibilidade de diálogo
- escolha de resposta
- falas alternativas
- NPC presente ou ausente
- desbloqueio de eventos
- finais

Exemplos:

- `first_conversation`
- `trusted_character`
- `player_read_document_04`
- `boss_defeated`
- `chapter_03_unlocked`

---

## Relação com missões

Diálogos podem:

- iniciar missão
- atualizar objetivo
- concluir missão
- liberar área
- entregar item
- revelar pista

### Regra
O sistema de diálogo dispara eventos; ele não deve assumir a responsabilidade de implementar o sistema de missão inteiro.

---

## Relação com inventário

Uma conversa pode exigir ou entregar itens.

### Exemplos
- verificar se o jogador possui uma chave
- entregar documento
- consumir item como parte de escolha
- revelar uso de determinado objeto

### Regras
- manipulação deve ocorrer por eventos ou serviços próprios
- o diálogo não deve editar inventário diretamente de maneira improvisada

---

## Relação com cutscenes

Um diálogo pode iniciar ou terminar uma cutscene.

### Fluxo possível

```text
Evento
 ↓
Diálogo
 ↓
Flag
 ↓
Cutscene
 ↓
Evento narrativo
```

### Regras
- Cutscenes e diálogos devem ser sistemas separados.
- O diálogo pode solicitar transição, mas não controlar toda a cutscene.

---

## UI de diálogo

### Elementos
- nome do personagem
- caixa de texto
- texto atual
- indicador de avanço
- escolhas
- indicador de voz, se houver

### Regras
- UI não decide qual fala vem depois.
- Texto precisa ser legível.
- Escolhas devem ser navegáveis por teclado, controle e toque quando aplicável.
- O jogador precisa saber quando uma escolha possui consequência relevante sem revelar a história.

---

## Avanço do diálogo

O sistema deve suportar:

- avanço manual
- avanço automático opcional
- pular fala já vista
- pausa
- acelerar texto

### Regras
- não permitir avanço que quebre evento obrigatório
- salvar estado de diálogo somente quando necessário
- permitir retorno seguro após interrupção

---

## Interrupções

Um diálogo pode ser interrompido por:

- perseguição
- dano
- morte
- cutscene
- mudança de área
- evento de prioridade maior

### Regras
- interrupção precisa ter comportamento definido
- diálogo interrompido pode retomar ou reiniciar conforme configuração
- eventos críticos não podem ficar parcialmente executados

---

## Repetição de diálogos

NPCs podem ter falas:

- primeira interação
- interação repetida
- após missão
- após capítulo
- após evento específico

### Regra
Evitar repetir exatamente a mesma fala quando o estado do mundo já mudou.

---

## Sistema de voz

Se houver dublagem:

### Deve suportar
- arquivo de voz por fala
- fallback sem voz
- volume separado
- legendas sincronizadas

### Regras
- voz não pode ser obrigatória para entender a história
- áudio ausente não pode quebrar a progressão

---

## Localização

Todo texto importante deve usar uma chave de localização.

### Exemplo

```text
TEXT_KEY: dialogue.chapter1.warning_001
```

### Regras
- nunca depender de texto hardcoded para conteúdo narrativo
- chaves precisam ser únicas e estáveis
- mudança de idioma não pode alterar flags ou lógica

---

## Estrutura de arquivos

### Sugestão

```text
narrative/
├── dialogue/
│   ├── chapter_01/
│   ├── chapter_02/
│   ├── chapter_03/
│   └── chapter_04/
├── characters/
└── dialogue_data/
```

---

## Convenção de IDs

Usar IDs previsíveis.

Exemplos:

- `DLG_001`
- `DLG_CH01_001`
- `DLG_CH02_NPC01_003`

### Regra
IDs não devem mudar depois que forem usados por save, flags ou outras referências.

---

## QA de diálogos

Testar:

- texto correto
- personagem correto
- condição correta
- escolha correta
- flag correta
- tradução disponível
- voz correta, se houver
- retorno após interrupção
- avanço até o final

---

## Checklist antes de adicionar diálogo

- O diálogo possui ID único?
- O texto usa chave de localização?
- As condições estão documentadas?
- As escolhas possuem consequências claras?
- As flags estão definidas?
- Eventos de início e fim existem?
- A UI consegue apresentar a conversa sem lógica própria?

---

## Regra final

O sistema de diálogo deve servir à narrativa sem virar o centro da arquitetura.

Texto, UI, eventos, localização e gameplay devem conversar entre si, mas continuar independentes o suficiente para serem testados e alterados sem quebrar o resto do jogo.
