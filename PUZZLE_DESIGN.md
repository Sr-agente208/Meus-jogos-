# PUZZLE_DESIGN.md

## Objetivo

Este documento define como os puzzles do jogo devem ser planejados, implementados e documentados.

A função dos puzzles é criar progressão, reforçar narrativa e fazer o jogador pensar sem travar o ritmo do jogo.

---

## Filosofia

Um puzzle bom:

- faz sentido dentro do mundo
- tem pistas suficientes
- recompensa observação
- não depende de adivinhação absurda
- não quebra o ritmo por tempo demais

Se o puzzle parecer loteria, ele errou.

---

## Função dos puzzles

Puzzles podem servir para:

- bloquear progressão
- abrir áreas novas
- revelar lore
- ativar eventos
- liberar boss ou entidade
- ensinar mecânicas novas
- testar observação e memória

---

## Tipos de puzzle

### 1. Senha
O jogador encontra números, palavras ou símbolos e insere a combinação correta.

### 2. Sequência
É preciso ativar elementos em ordem certa.

### 3. Energia
Restaurar energia, ligar geradores ou alinhar fluxos.

### 4. Objetos combináveis
Juntar itens para formar uma solução.

### 5. Exploratório
Encontrar pistas espalhadas pelo cenário.

### 6. Ambiental
Resolver usando o próprio mapa, luz, som, posição ou objetos.

### 7. Narrativo
A resposta está escondida em documentos, diálogos ou lore.

### 8. Temporal
Exige ação em um intervalo ou sob pressão.

---

## Estrutura de um puzzle

Todo puzzle deve ter:

- ID
- nome
- objetivo
- entrada
- pistas
- solução
- consequência
- evento ligado
- estado salvo

---

## Ficha técnica do puzzle

```text
PUZZLE_ID:
NAME:
TYPE:
CHAPTER:
LOCATION:
OBJECTIVE:
CLUES:
SOLUTION:
REWARD:
EVENTS:
NOTES:
```

---

## Exemplo

```text
PUZZLE_ID: PUZ_001
NAME: Gerador da Ala Norte
TYPE: Energia
CHAPTER: 1
LOCATION: Subsolo
OBJECTIVE: Restaurar energia para abrir a porta principal
CLUES: fusíveis queimados, aviso no mural, documento técnico
SOLUTION: ativar três disjuntores na ordem correta
REWARD: desbloqueia o corredor principal
EVENTS: EVT_010, EVT_011
NOTES: após resolver, entidade aparece na área antiga
```

---

## Regras de design

- Todo puzzle precisa ter pistas no cenário.
- A solução deve ser lógica dentro do mundo.
- O puzzle não pode depender de chute puro.
- O jogador precisa sentir que venceu por entender, não por insistência.
- A dificuldade pode subir, mas nunca virar palpiteiro simulator.

---

## Pistas

### Tipos de pista
- documento
- placa
- diálogo
- cenário
- símbolo
- som
- luz
- posição de objetos

### Regras
- pistas devem ser suficientes, mas não óbvias demais
- a pista pode aparecer em mais de um lugar
- o cenário precisa reforçar a resposta
- pistas falsas só devem existir se fizerem sentido narrativo

---

## Feedback do puzzle

Sempre que o jogador interagir com um puzzle, o jogo deve responder.

### Exemplos de feedback
- som de tentativa
- luz acendendo
- som de erro
- animação de mecanismo
- texto curto de status
- abertura de porta
- evento narrativo

### Regras
- feedback precisa ser claro
- o jogador deve saber se acertou, errou ou avançou
- erro não pode parecer bug

---

## Progressão por capítulo

### Capítulo 1
- puzzles simples
- foco em ensinar lógica e observação

### Capítulo 2
- puzzles com mais camadas
- combinação de pistas e ambiente

### Capítulo 3
- puzzles com pressão narrativa ou ameaça

### Capítulo 4
- puzzles mais decisivos
- ligação direta com clímax e final

---

## Integração com narrativa

Puzzles devem conversar com a história.

### Exemplos
- um código pode vir de um documento antigo
- uma sequência pode refletir um evento do passado
- um gerador pode estar ligado à queda do local
- um símbolo pode representar a entidade principal

### Regras
- puzzle sem contexto é enfeite inútil
- puzzle com contexto melhora o mundo
- a solução deve reforçar a lore

---

## Dificuldade

### Faixas recomendadas
- fácil: ensina o sistema
- média: exige atenção
- difícil: combina mais de uma pista
- crítica: usada em clímax ou boss

### Regras
- dificuldade deve crescer por capítulo
- não misturar dificuldade alta demais com ritmo ruim
- se o puzzle travar demais, revisar pistas, não culpar o jogador

---

## Estado do puzzle

Todo puzzle precisa ter estados:

- não iniciado
- em progresso
- resolvido
- travado
- alterado por evento

### Regras
- o estado deve ser salvo
- o jogo precisa saber se o puzzle já foi resolvido
- puzzles não podem resetar por acidente

---

## Organização de arquivos

### Sugestão
- `puzzles/chapter_01/`
- `puzzles/chapter_02/`
- `puzzles/chapter_03/`
- `puzzles/chapter_04/`
- `puzzles/shared/`

### Para cada puzzle
Criar:
- ficha técnica
- pistas
- estado
- evento de recompensa

---

## Checklist antes de aprovar um puzzle

- Existe contexto narrativo?
- Existe pista suficiente?
- A solução é lógica?
- O feedback é claro?
- O puzzle muda algo no jogo?
- O estado é salvo?
- O jogador sente que aprendeu algo?

Se a resposta for sim, o puzzle está pronto para entrar no jogo.
