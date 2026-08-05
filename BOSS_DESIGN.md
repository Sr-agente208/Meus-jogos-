# BOSS_DESIGN.md

## Objetivo

Este documento define a estrutura de design dos bosses do jogo.

Boss não é só inimigo forte. Boss precisa ter identidade, fases, leitura visual, função narrativa e impacto real na progressão.

---

## Filosofia

Um boss deve:

- marcar um ponto importante da história
- testar o que o jogador aprendeu
- ter padrão reconhecível
- mudar o ritmo do capítulo
- oferecer tensão e recompensa

Se o boss não muda nada além da barra de vida, ele está subutilizado.

---

## Estrutura obrigatória

Todo boss deve possuir:

- ID
- nome
- capítulo
- origem
- objetivo narrativo
- arena ou área de confronto
- fases
- ataques
- fraquezas
- gatilhos de transição
- evento de início
- evento de vitória
- recompensa ou consequência

---

## Ficha padrão

```text
BOSS_ID:
NAME:
CHAPTER:
ORIGIN:
ROLE:
ARENA:
PHASES:
ATTACKS:
WEAKNESSES:
EVENT_START:
EVENT_END:
REWARD:
NOTES:
```

---

## Papel narrativo

Cada boss precisa justificar sua existência dentro da história.

### Possibilidades
- guardião de área
- manifestação da anomalia
- entidade corrompida
- obstáculo final de capítulo
- teste do protagonista
- confronto com figura importante da lore

### Regras
- o boss precisa ter motivo para estar ali
- a luta deve conversar com o lore
- o boss não pode parecer aleatório

---

## Leitura visual

O jogador precisa entender o boss só de olhar.

### Elementos importantes
- silhueta marcante
- cor ou padrão reconhecível
- animação diferente do inimigo comum
- presença sonora própria
- arena compatível com o peso da luta

### Regras
- evitar design genérico
- evitar excesso de detalhe que atrapalhe leitura
- o boss precisa ser memorável mesmo sem texto explicativo

---

## Fases

Cada boss deve ter fases bem definidas.

### Estrutura recomendada
- fase 1: apresentação
- fase 2: pressão crescente
- fase 3: comportamento alterado
- fase final: clímax

### Regras
- cada fase precisa mudar algo real
- transição deve ser clara
- fases não devem ser só aumento de dano e vida
- o jogador precisa perceber que o combate evoluiu

---

## Tipos de mudança de fase

- novos ataques
- arena alterada
- novas rotas de fuga
- velocidade maior
- invulnerabilidade temporária
- mudança de padrão
- invocação de minions
- alteração ambiental

---

## Ataques

### Tipos possíveis
- ataque corpo a corpo
- projétil
- área de dano
- perseguição curta
- ataque carregado
- golpe em cadeia
- armadilha de arena
- distorção ambiental

### Regras
- cada ataque precisa ter telegraph
- o jogador deve ter chance de reagir
- ataques não podem parecer injustos
- o boss deve recompensar leitura e timing

---

## Fraquezas

Todo boss deve ter pelo menos uma forma de exploração estratégica.

### Exemplos
- luz intensa
- item específico
- som distrativo
- janela após ataque
- ponto vulnerável em certa fase
- evento do ambiente

### Regras
- fraqueza precisa ser consistente
- o jogador precisa aprender a usar a fraqueza
- boss sem fraqueza vira muro de frustração

---

## Arena

A arena deve ser parte do design do boss.

### Regras
- espaço suficiente para movimentação
- pontos de interesse claros
- obstáculos coerentes
- leitura visual boa
- possibilidade de tensão e fuga, se fizer sentido

### Tipos
- arena fechada
- arena em ruínas
- corredor expandido
- sala com mecanismo
- espaço corrompido

---

## Recompensa

Derrotar um boss deve trazer consequência importante.

### Possibilidades
- nova área desbloqueada
- chave ou item especial
- nova flag narrativa
- nova verdade da lore
- acesso a capítulo seguinte
- mudança no estado do mundo

### Regra
Boss sem consequência é só combate grande. Precisa valer o esforço.

---

## Integração com o sistema

O boss deve conversar com:

- narrativa
- eventos
- save
- HUD
- áudio
- level design
- IA

### Regras
- o combate deve ser salvo corretamente
- o boss deve ter estado persistente quando necessário
- a derrota deve liberar evento claro

---

## Organização de arquivos

### Sugestão
- `bosses/chapter_01/`
- `bosses/chapter_02/`
- `bosses/chapter_03/`
- `bosses/chapter_04/`
- `bosses/final/`

### Para cada boss
Criar:
- ficha técnica
- script de comportamento
- lista de fases
- lista de ataques
- documento narrativo
- referência visual

---

## Checklist de boss

Antes de concluir um boss, verificar:

- Ele tem papel narrativo?
- A silhueta é marcante?
- As fases mudam de verdade?
- Os ataques têm telegraph?
- A arena ajuda o combate?
- Existe fraqueza ou estratégia?
- A derrota afeta a história?
- O jogador entende o que aconteceu?

Se todas as respostas forem sim, o boss está pronto para entrar na produção.

---

## Regra final

Boss bom não é o que só bate forte.

Boss bom é o que o jogador lembra depois de fechar o jogo e pensa: "ok, esse aí foi pessoal".
