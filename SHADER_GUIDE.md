# SHADER_GUIDE.md

## Objetivo

Este documento define como shaders e efeitos visuais devem ser usados no jogo para reforçar atmosfera, anomalias, corrupção e feedback de gameplay sem comprometer desempenho ou legibilidade.

---

## Filosofia

Shaders devem ter função clara.

Usar efeitos para:

- reforçar narrativa
- sinalizar estados
- representar anomalias
- criar tensão
- destacar eventos importantes

Evitar efeitos apenas por estética.

---

## Categorias

### Glitch
Para interferência, corrupção digital e falhas de realidade.

### Distortion
Para deformação de imagem, presença sobrenatural e instabilidade.

### Scanline / Noise
Para comunicação, monitores, câmeras e ambientes corrompidos.

### Chromatic Aberration
Para momentos curtos de distorção visual.

### Vignette
Para tensão, dano, medo ou estados críticos.

### Color Grading
Para mudar sensação de uma área ou estado narrativo.

### Dissolve / Corruption
Para aparições, desaparecimentos e transformação de entidades.

---

## Regras de uso

- Priorizar efeitos temporários em momentos importantes.
- Evitar filtros pesados permanentes.
- Não prejudicar leitura da UI.
- Não esconder obstáculos essenciais.
- Cada efeito precisa ter intensidade configurável quando possível.

---

## Glitch

### Aplicações
- entidades
- áreas corrompidas
- telas e computadores
- eventos narrativos
- transições

### Componentes possíveis
- deslocamento UV
- ruído procedural
- linhas horizontais
- cortes de imagem
- alteração de cor
- flicker

### Regra
Glitch excessivo perde impacto. O efeito funciona melhor quando aparece, some e deixa dúvida.

---

## Distortion

### Aplicações
- proximidade de entidade
- alteração de realidade
- boss
- eventos de grande impacto

### Regras
- controlar frequência
- controlar intensidade
- permitir desligamento em configurações de acessibilidade se necessário

---

## Efeitos por estado

### Exploração
- efeitos mínimos
- imagem estável

### Suspense
- pequenas distorções
- ruído ambiente visual

### Perigo
- vinheta
- distorção moderada
- alterações sutis de cor

### Perseguição
- distorção mais intensa
- alterações rápidas
- efeitos sincronizados com áudio

### Boss
- efeitos próprios
- mudanças ligadas às fases

---

## Shaders e gameplay

Shaders podem responder a parâmetros do jogo.

Exemplos:

- proximidade da entidade
- sanidade do jogador
- dano
- estado de perseguição
- capítulo atual
- flag narrativa

### Regra
O shader deve receber apenas os dados necessários e não controlar lógica de gameplay.

---

## Shaders e narrativa

Eventos narrativos importantes podem alterar o visual global.

Exemplos:

- tela distorce após uma revelação
- ambiente ganha outra paleta após corrupção
- entidade deixa rastro visual
- transição entre capítulos usa efeito próprio

---

## Performance

### Regras
- evitar múltiplos efeitos pesados empilhados
- reduzir resolução de efeitos secundários quando possível
- testar em hardware de referência
- evitar cálculos desnecessários por pixel
- desligar efeitos fora da tela quando possível

### Prioridade
1. gameplay
2. leitura visual
3. estabilidade
4. efeito visual

Nunca sacrificar estabilidade por um glitch bonito.

---

## Qualidade e acessibilidade

### Recomendado
- opção para reduzir intensidade de efeitos
- opção para desligar efeitos muito agressivos
- não depender apenas de distorção para comunicar gameplay crítico

---

## Organização de arquivos

```text
shaders/
├── postprocess/
├── entities/
├── environment/
├── ui/
├── transitions/
└── shared/
```

### Convenção de nomes
- `glitch_screen`
- `distortion_entity`
- `corruption_surface`
- `vignette_damage`
- `chapter_transition`

---

## Checklist

Antes de aprovar um shader:

- Ele tem função clara?
- Pode ser ativado e desativado corretamente?
- Não quebra a leitura?
- Não causa custo desnecessário?
- Combina com o capítulo?
- Funciona junto com o áudio?
- Possui intensidade adequada?

---

## Regra final

O melhor shader de terror não é o que faz a tela virar uma salada de pixels.

É o que faz o jogador perceber que alguma coisa está errada antes mesmo de entender o porquê.
