# AI_DESIGN.md

## Objetivo

Este documento define o comportamento técnico das IAs do jogo, incluindo inimigos comuns, entidades especiais e bosses.

A meta é evitar IA improvisada e criar um sistema previsível, modular e fácil de expandir.

---

## Princípios gerais

- A IA deve ser legível e testável.
- Cada entidade precisa ter estados claros.
- O comportamento deve depender de percepção, contexto e eventos.
- A IA não deve acessar diretamente UI ou sistemas que não precisa controlar.
- Toda entidade importante deve ter documentação própria quando for adicionada ao projeto.

---

## Estrutura base da IA

Toda IA deve seguir esta sequência lógica:

**Perceber → Decidir → Executar → Reavaliar**

### Ciclo
1. Detecta o jogador ou um evento.
2. Avalia o estado atual.
3. Escolhe uma ação.
4. Executa a ação.
5. Aguarda nova atualização.

---

## Sensores

A IA pode reagir a diferentes formas de percepção.

### Sensores possíveis
- visão
- audição
- proximidade
- linha de visão
- estado do mapa
- flags narrativas
- eventos disparados

### Regras
- Cada sensor deve ser configurável.
- Sensores precisam ter alcance e limite claros.
- Não usar percepção infinita sem motivo narrativo.
- Eventos do mapa podem alterar o comportamento da IA.

---

## Estados globais de IA

### Estados base
- idle
- patrulha
- investigando
- alerta
- perseguição
- ataque
- retorno
- confuso
- derrotado

### Regras
- Toda entidade deve possuir um estado atual.
- Mudança de estado precisa ter condição clara.
- Estados não devem se sobrepor de forma caótica.
- O sistema deve impedir transições inválidas.

---

## Inimigos comuns

Inimigos comuns servem para pressão e ritmo de gameplay.

### Funções
- patrulhar áreas
- detectar o jogador
- reagir a sons ou eventos
- iniciar perseguição
- punir erro do jogador

### Estrutura recomendada
- rota de patrulha
- zona de alerta
- distância de reação
- tempo de investigação
- duração da perseguição

### Regras
- Inimigos não devem ser todos iguais.
- Cada área pode ter uma variação de comportamento.
- A dificuldade pode aumentar por capítulo.
- O jogador precisa entender o risco, mesmo sem ler tutorial.

---

## Entidades especiais

Entidades especiais são inimigos com comportamento único ou papel narrativo forte.

### Exemplo de diferenças
- aparecem em momentos específicos
- seguem regras próprias
- podem ser vinculadas a capítulos
- podem alterar o ambiente
- podem usar mecânicas incomuns

### Regras
- Entidade especial precisa de documento próprio.
- A lógica deve ser separada da de inimigo comum.
- O comportamento deve ser fácil de ajustar por evento ou capítulo.

---

## Bosses

Bosses precisam de design dedicado.

### Estrutura obrigatória
- estado inicial
- fase 1
- fase 2
- fase 3 ou final
- ataques especiais
- janela de vulnerabilidade
- transição entre fases
- evento de derrota

### Regras
- Boss não deve depender de IA genérica sem adaptação.
- Fases precisam mudar ritmo, ataque ou arena.
- O boss precisa ter leitura visual clara.
- Cada boss deve ser documentado separadamente.

---

## Máquina de estados

A máquina de estados deve controlar o comportamento da entidade.

### Exemplo simplificado
- idle → patrulha → investigando → alerta → perseguição → ataque → retorno

### Regras
- Toda transição precisa ter gatilho.
- Estados especiais devem impedir ações inválidas.
- O retorno ao estado inicial deve ser previsível.

---

## Comportamento por distância

A IA pode reagir conforme a distância do jogador.

### Faixas úteis
- longe
- médio
- perto
- contato

### Aplicação
- longe: patrulha ou idle
- médio: investigação ou alerta
- perto: perseguição
- contato: ataque ou evento especial

---

## Reação a som

Se o jogo usar som como mecânica, a IA deve reagir a isso.

### O que pode gerar som
- correr
- abrir portas
- derrubar objetos
- interagir com elementos
- ativar armadilhas

### Regras
- sons precisam ter intensidade diferente
- a IA deve comparar prioridade do som
- sons pequenos não devem causar perseguição absurda

---

## Reação a visão

### Regras
- a visão precisa considerar obstáculo
- o jogador pode se esconder se o jogo permitir
- o campo de visão deve ser configurável
- a detecção não pode parecer injusta

---

## Reação a eventos

Eventos narrativos podem mudar a IA.

### Exemplos
- abrir uma porta
- ativar um gerador
- ler um documento específico
- derrotar um boss
- entrar em área restrita

### Regras
- flags devem alterar comportamento sem quebrar a lógica base
- eventos importantes podem ligar ou desligar entidades

---

## Perseguição

A perseguição precisa ser tensa, mas controlada.

### Regras
- perseguição deve ter início e fim
- a IA precisa parar de perseguir se perder o jogador por tempo suficiente
- o jogador precisa ter chance de escapar
- perseguição não deve durar para sempre

### Elementos úteis
- intensificar música
- alterar iluminação
- ativar respawn de entidade em outro ponto
- bloquear rotas alternativas

---

## IA e narrativa

A IA deve reforçar a narrativa, não atrapalhar.

### Exemplos
- uma entidade pode ficar mais agressiva em determinado capítulo
- um boss pode mudar de fase após evento narrativo
- inimigos podem desaparecer após cortar energia

### Regra principal
Se o comportamento não combina com a história, o design precisa ser revisto.

---

## Balanceamento

### O que revisar
- tempo de reação
- tempo de perseguição
- frequência de aparição
- dano causado
- chances de erro do jogador
- distância mínima para detecção

### Regra
A IA deve assustar, não frustrar sem motivo.

---

## Organização por arquivos

### Sugestão
- `ai/base_ai`
- `ai/enemy_states`
- `ai/patrol_routes`
- `ai/boss_states`
- `ai/perception`
- `ai/behaviors`

### Para cada nova entidade
Criar ao menos:
- arquivo de comportamento
- arquivo de estado
- nota de documentação

---

## Checklist antes de implementar uma IA

- Os estados estão definidos?
- Os sensores foram listados?
- O comportamento depende de eventos?
- Existe condição de derrota ou fuga?
- A IA está documentada?
- O boss ou inimigo faz sentido no capítulo?

---

## Regra final

Se a IA parecer inteligente demais sem explicação, ela está quebrando o equilíbrio.

Se a IA parecer burra demais, ela está quebrando o clima.

O ponto certo é: previsível o bastante para ser justa, imprevisível o bastante para ser assustadora.
