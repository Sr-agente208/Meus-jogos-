# QUEST_SYSTEM.md

## Objetivo

Este documento define como o sistema de missões do jogo deve funcionar.

A missão precisa ser clara para o jogador, modular para o projeto e fácil de ligar à narrativa, ao mapa e aos eventos.

---

## Filosofia

A missão não existe só para preencher espaço.

Ela deve:

- orientar o jogador
- reforçar a história
- conectar áreas
- recompensar exploração
- dar ritmo à progressão
- funcionar com flags e eventos

---

## Tipos de missão

### 1. Missão principal
Movimenta a história central e libera capítulos ou áreas novas.

### 2. Missão secundária
Amplia lore, oferece recursos e adiciona profundidade ao mundo.

### 3. Missão de capítulo
Limitada a uma parte específica da campanha.

### 4. Missão de tutorial
Ensina mecânicas ao jogador de forma prática.

### 5. Missão opcional
Não é obrigatória, mas traz recompensa ou informação extra.

### 6. Missão oculta
Descoberta por exploração, documento ou evento especial.

---

## Estrutura de uma missão

Toda missão deve ter:

- ID
- nome
- tipo
- descrição
- objetivo principal
- objetivos secundários
- condição de início
- condição de conclusão
- recompensa
- capítulos relacionados
- flags usadas
- eventos envolvidos

---

## Modelo de ficha

```text
QUEST_ID: QST_001
NAME: Ligar o gerador
TYPE: Missão principal
DESCRIPTION: Restaurar a energia da área para liberar a passagem.
START_CONDITION: encontrar o painel
END_CONDITION: gerador ativado
REWARD: acesso à nova área
FLAGS: generator_on = true
EVENTS: EVT_010, EVT_011
CHAPTER: 2
```

---

## Objetivos

### Objetivo principal
É o que precisa ser feito para concluir a missão.

### Objetivos secundários
Servem para reforçar exploração, lore ou recompensa opcional.

### Regras
- O objetivo principal precisa ser claro.
- Os objetivos secundários devem ajudar, não confundir.
- A missão deve mostrar progresso quando possível.

---

## Início da missão

Uma missão pode começar por:

- falar com NPC
- coletar item
- entrar em área
- ler documento
- disparar cutscene
- ativar evento
- concluir outra missão

### Regras
- o gatilho precisa ser rastreável
- a missão não deve iniciar sem feedback
- o jogador precisa entender que algo novo começou

---

## Conclusão da missão

Ao concluir, a missão deve:

- atualizar flags
- dar recompensa
- liberar área, item ou evento
- registrar progresso no save
- comunicar o fim claramente

### Regras
- missão concluída não deve ficar ambígua
- recompensas precisam aparecer com feedback visual ou sonoro
- missão importante deve alterar o estado do mundo

---

## Recompensas

### Possíveis recompensas
- item
- chave
- documento
- acesso a área nova
- lore extra
- atalho
- recurso de sobrevivência
- desbloqueio narrativo

### Regras
- recompensa precisa fazer sentido com a missão
- missão longa deve ter recompensa proporcional
- missão secundária pode recompensar com conhecimento, não só item

---

## Progresso

O sistema deve mostrar progresso quando necessário.

### Exemplo
- 1/3 documentos encontrados
- gerador 2 de 4 ativado
- 70% da área explorada
- 2 inimigos eliminados

### Regras
- progresso deve ser simples de ler
- não poluir a tela com números inúteis
- mostrar progresso só quando ele ajuda o jogador

---

## Integração com narrativa

Missão e história devem andar juntas.

### Regras
- a missão pode revelar lore
- uma missão pode mudar um personagem
- a missão pode liberar cutscene
- a missão pode ativar boss ou perseguição

### Observação
Se a missão existe, ela deve parecer parte daquele mundo, não um checklist jogado por cima.

---

## Integração com mapa

Missões podem apontar para áreas específicas.

### Exemplos
- abrir porta
- encontrar sala específica
- ativar sistema de energia
- levar item até ponto X
- investigar local marcado

### Regras
- o mapa precisa apoiar a missão
- o objetivo deve ter pista visual ou textual
- o jogador não deve depender de sorte para achar o destino

---

## Integração com eventos e flags

### Regras
- toda missão importante precisa alterar flags
- flags devem controlar início, progresso e término
- eventos não devem se repetir sem necessidade
- missão deve sobreviver a carregamento de save

### Exemplo de flags
- `quest_generator_started`
- `quest_generator_done`
- `quest_note_found`
- `quest_npc_talked`

---

## Missões de capítulo

Cada capítulo pode ter um conjunto de missões próprias.

### Regras
- capítulo deve introduzir novas missões
- missão precisa combinar com o tema do capítulo
- missões do capítulo podem desaparecer após conclusão

---

## Missões secretas

### Como surgem
- documento escondido
- área opcional
- conversa diferente com NPC
- evento raro
- objeto interativo específico

### Regras
- missão secreta deve ser opcional
- não pode travar a campanha principal
- precisa ter recompensa ou revelação relevante

---

## UI da missão

### Elementos úteis
- nome da missão
- objetivo atual
- progresso
- confirmação de conclusão
- recompensa recebida

### Regras
- texto curto
- visibilidade clara
- mostrar apenas o necessário
- não atrapalhar a exploração

---

## Missões repetíveis

Algumas missões podem repetir.

### Exemplo
- coletar recursos
- ativar sistema temporário
- patrulhar área
- entregar item opcional

### Regras
- missão repetível precisa ser marcada como tal
- evitar abusar desse tipo no jogo principal
- recompensa deve ser balanceada

---

## Organização de arquivos

### Sugestão
- `quests/main/`
- `quests/side/`
- `quests/hidden/`
- `quests/tutorial/`
- `quests/chapter_01/`
- `quests/chapter_02/`

### Para cada missão
Criar:
- ficha técnica
- evento inicial
- evento final
- flags usadas
- recompensa

---

## Checklist antes de adicionar uma missão

- A missão tem objetivo claro?
- O início está definido?
- A conclusão está definida?
- Existe recompensa?
- A missão conversa com a história?
- Há flags documentadas?
- Ela funciona no save/load?
- O jogador entende o que fazer?

---

## Regra final

Se a missão não conseguir ser resumida em uma frase clara, ela ainda não está pronta para entrar no jogo.
