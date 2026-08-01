# LEVEL_DESIGN.md

## Objetivo

Este documento define como os níveis, áreas e mapas do jogo devem ser pensados para garantir exploração fluida, progressão clara e atmosfera consistente.

A meta é fazer o jogador se sentir perdido no clima, não perdido no código.

---

## Princípios de level design

- Cada área precisa ter função clara.
- O jogador deve entender para onde ir sem perder o suspense.
- Rotas alternativas devem existir quando fizer sentido.
- O mapa precisa ensinar o jogador aos poucos.
- A tensão deve subir junto com a exploração.
- Áreas importantes precisam ser memoráveis.

---

## Estrutura de um nível

Todo nível deve ter, no mínimo:

- entrada
- área principal
- obstáculos
- pontos de leitura ou observação
- rota de retorno ou saída
- checkpoint ou marco importante
- evento de fechamento

---

## Tipos de área

### 1. Área segura
Espaço de respiração, organização e leitura de pistas.

### 2. Área de exploração
Ambiente com investigação, coleta de itens e progressão leve.

### 3. Área de tensão
Espaço com perigo, presença de inimigo ou sensação de ameaça.

### 4. Área de perseguição
Ambiente voltado para fuga, reação e sobrevivência.

### 5. Área narrativa
Local com foco em história, documentos, cutscene ou evento.

### 6. Área de boss
Arena ou espaço controlado onde um confronto importante acontece.

---

## Fluxo de navegação

O jogador deve seguir um fluxo lógico:

**Entrada → Leitura do ambiente → Descoberta → Decisão → Avanço → Resolução**

### Regras
- O mapa nunca deve obrigar o jogador a adivinhar sem pistas.
- Se houver backtracking, ele precisa ter propósito.
- O caminho principal deve ser identificável.
- Áreas secundárias devem recompensar exploração.

---

## Ritmo espacial

O nível precisa alternar sensações.

### Sequência recomendada
- corredor estreito
- sala de observação
- área aberta
- ponto de tensão
- espaço de recompensa
- rota travada
- nova descoberta

### Regra
Não colocar susto em toda esquina. O terror funciona melhor quando o silêncio faz o serviço pesado.

---

## Comunicação visual

O jogador deve entender o espaço pelo cenário.

### Ferramentas visuais
- luz
- cor
- contraste
- sinalização ambiental
- objetos quebrados
- trilhas no chão
- portas destacadas
- som ambiente

### Regras
- O caminho principal deve chamar atenção sem parecer seta de tutorial.
- Elementos importantes precisam se destacar do resto.
- O cenário deve contar parte da história sozinho.

---

## Gates de progressão

A progressão pode ser bloqueada por:

- chave
- código
- energia desligada
- evento narrativo
- item de missão
- puzzle resolvido
- boss derrotado
- flag específica

### Regras
- Todo bloqueio precisa ter solução clara.
- O jogo deve avisar indiretamente o que falta.
- Nunca prender o jogador sem feedback.

---

## Backtracking

Voltar por áreas já visitadas pode ser útil, mas precisa valer a pena.

### Quando usar
- nova chave encontrada
- evento alterou o mapa
- inimigo bloqueou rota anterior
- documento ou item ficou acessível depois

### Regras
- Não repetir o mesmo trajeto sem motivo.
- O backtracking deve mostrar mudança no ambiente.
- O retorno pode aumentar tensão se o local mudou.

---

## Checkpoints e pontos de retorno

### Função
Garantir que o jogador não perca progresso importante e reduzir frustração.

### Regras
- checkpoint deve vir antes de trechos difíceis
- boss importante deve ter ponto de preparação
- áreas longas precisam de marcos
- o retorno do save não pode quebrar a progressão

---

## Pacing por área

Cada área deve cumprir uma função de ritmo.

### Exemplo
- área 1: introdução
- área 2: exploração
- área 3: tensão
- área 4: evento narrativo
- área 5: perseguição
- área 6: recompensa

### Regra
A sequência deve evitar fadiga. Se tudo é grito, nada assusta mais.

---

## Uso de inimigos no mapa

Inimigos devem ser posicionados para criar pressão estratégica.

### Posições úteis
- corredor de fuga
- sala aberta com pouca cobertura
- área de observação
- rota de retorno
- trecho com objetivo temporizado

### Regras
- Inimigo não deve aparecer sem função.
- A disposição deve reforçar o ambiente.
- O mapa precisa permitir aprendizado do comportamento inimigo.

---

## Level scripting

O mapa pode usar scripts para controlar eventos.

### Exemplos
- porta tranca depois de entrar
- luz apaga após coletar item
- entidade aparece depois de um diálogo
- perseguição ativa ao ligar gerador
- boss surge após ler documento

### Regras
- Scripts devem ser claros e rastreáveis.
- Eventos do mapa precisam ser versionados.
- Evitar lógica escondida demais.

---

## Arquitetura de mapa sugerida

```text
map/
├── chapter_01/
│   ├── entrance
│   ├── hallway
│   ├── room_a
│   ├── room_b
│   └── exit
├── chapter_02/
├── chapter_03/
└── chapter_04/
```

---

## Convenção de design de áreas

Cada área deve ser documentada com:

- nome
- capítulo
- objetivo
- perigo principal
- item importante
- evento ligado
- checkpoint mais próximo

---

## Regras de layout

- O espaço precisa ser navegável.
- O jogador deve conseguir memorizar o lugar.
- Evitar corredores iguais demais.
- Variar escala, textura e iluminação.
- Toda área importante deve ter uma identidade.

---

## Boss arena

### Regras para arenas de boss
- espaço suficiente para movimentação
- visual marcante
- poucas distrações desnecessárias
- pontos de leitura claros
- cobertura ou obstáculos, se fizer sentido
- transição de entrada bem definida

---

## Exploração recompensada

Áreas opcionais devem conter:

- documentos
- itens úteis
- lore
- atalhos
- pistas de puzzle
- recursos de sobrevivência

Se a área for opcional e vazia, ela está falhando.

---

## Acessibilidade de mapa

O level design também precisa pensar em clareza.

### Regras
- objetivos precisam ser compreensíveis
- contrastes visuais devem ajudar na leitura do espaço
- não depender apenas de cor para orientar
- permitir leitura do ambiente mesmo com pressa

---

## Checklist de um nível pronto

Antes de considerar um nível finalizado, perguntar:

- O jogador entende onde está?
- O objetivo está claro?
- O mapa tem ritmo?
- A exploração vale a pena?
- O perigo está distribuído com inteligência?
- O checkpoint está bem posicionado?
- O cenário conta algo sozinho?
- O mapa combina com o capítulo?

Se todas as respostas estiverem boas, o nível está jogável de verdade.
