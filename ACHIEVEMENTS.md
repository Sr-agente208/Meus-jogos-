# ACHIEVEMENTS.md

## Objetivo

Este documento define o sistema de conquistas do jogo.

As conquistas devem recompensar exploração, domínio das mecânicas, descoberta da narrativa e desafios opcionais sem obrigar o jogador a jogar de uma única maneira.

---

## Princípios

- Conquistas devem ter propósito.
- Não depender de bugs ou exploits.
- Evitar tarefas repetitivas sem valor.
- Incentivar exploração e descoberta.
- Não revelar spoilers desnecessariamente.
- Ser compatíveis com save e progressão.

---

## Categorias

### História
Conquistadas por progressão natural.

### Exploração
Ligadas a áreas, documentos e segredos.

### Gameplay
Ligadas ao uso de mecânicas ou sobrevivência.

### Puzzles
Ligadas à resolução de desafios.

### Entidades
Ligadas a encontros, observação ou superação de ameaças.

### Bosses
Ligadas a confrontos importantes.

### Segredos
Conquistas escondidas para descobertas especiais.

### Completude
Ligadas a conclusão total de partes do jogo.

---

## Estrutura de uma conquista

Cada conquista deve possuir:

- ID
- nome
- descrição
- categoria
- condição
- flag relacionada
- recompensa opcional
- visibilidade
- capítulo

### Exemplo

```text
ACH_ID: ACH_001
NAME: Primeiro Contato
DESCRIPTION: Sobreviva ao primeiro encontro com uma entidade.
CATEGORY: História
CONDITION: first_entity_survived == true
FLAG: achievement_first_entity
VISIBLE: true
CHAPTER: 1
```

---

## Conquistas ocultas

Conquistas secretas podem esconder:

- nome
- descrição
- condição

Até serem desbloqueadas.

### Uso recomendado
- grandes revelações
- finais secretos
- encontros raros
- eventos especiais

### Regra
Não transformar toda conquista em segredo. O jogador precisa saber que existe progresso para buscar.

---

## Desbloqueio

O sistema deve usar flags ou eventos confiáveis.

### Fluxo

Evento acontece
→
Condição verificada
→
Conquista desbloqueada
→
Estado salvo
→
Feedback visual/sonoro

---

## Persistência

Salvar:

- conquistas desbloqueadas
- data de desbloqueio, se desejado
- contador de progresso quando aplicável

### Regra
O desbloqueio deve ser persistente mesmo que o jogador carregue um save anterior.

---

## Feedback

Quando uma conquista for desbloqueada:

- mostrar aviso visual
- tocar efeito sonoro
- registrar no sistema
- evitar interromper gameplay sem necessidade

### Regras
- feedback curto
- não bloquear controles por muito tempo
- permitir consultar depois no menu

---

## Progresso parcial

Algumas conquistas podem possuir progresso.

### Exemplos
- encontrar 10 documentos
- sobreviver a 5 perseguições
- resolver todos os puzzles de um capítulo

### Regras
- progresso deve ser salvo
- UI precisa mostrar quanto falta
- evitar contadores sem propósito

---

## Conquistas e narrativa

As conquistas podem reforçar a descoberta do universo.

### Exemplos
- encontrar documento raro
- descobrir identidade de entidade
- descobrir área secreta
- observar evento opcional

### Regra
Conquistas narrativas não devem substituir a própria narrativa.

---

## Conquistas e capítulos

Cada capítulo pode possuir:

- conquistas de história
- conquistas de exploração
- conquista de puzzle
- conquista secreta

O capítulo final pode possuir conquistas relacionadas a finais.

---

## Finais

Se houver múltiplos finais, usar conquistas separadas quando fizer sentido.

Exemplo:

- final normal
- final alternativo
- final secreto
- final verdadeiro

### Regra
Não revelar o requisito completo de um final secreto antes da hora.

---

## Regras técnicas

- IDs devem ser únicos.
- Condições devem ser determinísticas.
- Desbloqueio não pode depender apenas da UI.
- Conquistas devem sobreviver a reload.
- O sistema deve suportar novas conquistas sem alterar as antigas.

---

## Organização de arquivos

Sugestão:

```text
achievements/
├── database/
├── icons/
├── localization/
└── handlers/
```

---

## Checklist

Antes de adicionar uma conquista:

- A condição está clara?
- Ela tem valor para o jogador?
- Está ligada a uma mecânica ou descoberta real?
- Pode ser salva corretamente?
- Não depende de comportamento impossível?
- A descrição evita spoiler desnecessário?

---

## Regra final

Uma boa conquista faz o jogador pensar:

"Caramba, eu nem sabia que dava para fazer isso."

Não:

"Parabéns, você apertou o mesmo botão 500 vezes." 
