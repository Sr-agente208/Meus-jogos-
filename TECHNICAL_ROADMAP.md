# TECHNICAL_ROADMAP.md

## Objetivo

Este documento organiza a ordem técnica de desenvolvimento do projeto.

A ideia é evitar retrabalho, manter prioridades claras e permitir que qualquer desenvolvedor ou IA saiba o que fazer primeiro.

---

## Fase 1 — Base do projeto

### Metas
- criar estrutura de pastas
- organizar documentação
- definir convenções de commit
- preparar assets iniciais
- separar código, arte e áudio

### Entregas
- README.md
- PROJETO.txt
- ARENA_AI.md
- GAME_ARCHITECTURE.md
- GAMEPLAY_SYSTEMS.md
- NARRATIVE_FLOW.md

---

## Fase 2 — Protótipo jogável

### Metas
- implementar movimentação do jogador
- implementar interação básica
- montar HUD mínima
- criar sistema de pause
- criar loop simples de exploração

### Entregas
- player movement
- interaction system
- basic HUD
- pause menu
- first playable scene

---

## Fase 3 — Sistemas centrais

### Metas
- inventário
- save/load
- eventos
- áudio base
- UI funcional
- progressão por flags

### Entregas
- INVENTORY_SYSTEM
- SAVE_SYSTEM
- EVENT_MANAGER
- AUDIO_MANAGER
- UI layer

---

## Fase 4 — Gameplay de verdade

### Metas
- inimigos comuns
- IA base
- puzzles
- capítulos
- objetivos
- checkpoints
- áreas de risco e exploração

### Entregas
- AI_DESIGN implementado
- PUZZLE_DESIGN aplicado
- CHAPTERS estruturados
- LEVEL_DESIGN aplicado
- ENTITY_DATABASE em uso

---

## Fase 5 — Conteúdo narrativo

### Metas
- lore
- documentos
- cutscenes
- missões
- bosses
- finais

### Entregas
- LORE_BIBLE
- QUEST_SYSTEM
- BOSS_DESIGN
- narrativa completa dos capítulos

---

## Fase 6 — Refinamento

### Metas
- balanceamento
- performance
- ajustes visuais
- som
- feedback de UI
- correções de bugs

### Entregas
- melhoria de qualidade geral
- redução de falhas
- versão mais estável do jogo

---

## Fase 7 — Expansão

### Metas
- novos capítulos
- novas entidades
- novos itens
- novos puzzles
- novos finais
- suporte futuro para mods ou extensões, se desejado

---

## Ordem recomendada de implementação

1. estrutura do projeto
2. jogador
3. interação
4. HUD
5. inventário
6. eventos
7. save/load
8. áudio
9. inimigos
10. puzzles
11. capítulos
12. bosses
13. narrativa final
14. polimento

---

## Dependências críticas

### Antes de criar conteúdo avançado, é obrigatório ter:
- base de player funcionando
- sistema de flags
- save seguro
- UI mínima
- organização de arquivos

Sem isso, o projeto cresce torto.

---

## Marcos de validação

### Marco 1
O jogador consegue andar, interagir e abrir menu.

### Marco 2
O jogo consegue salvar e carregar estado básico.

### Marco 3
Um capítulo simples pode ser jogado do início ao fim.

### Marco 4
Um inimigo com IA básica funciona sem quebrar o mapa.

### Marco 5
Um boss, puzzle e cutscene funcionam dentro da campanha.

### Marco 6
O jogo está pronto para expansão e polimento.

---

## Regras de prioridade

- estabilidade primeiro
- documentação junto com a implementação
- conteúdo novo só depois da base
- sistemas pequenos antes dos grandes
- teste antes de escalar

---

## Critério de sucesso

O projeto só está andando direito quando:

- cada sistema tem lugar definido
- não existe lógica espalhada sem necessidade
- o progresso pode ser salvo com segurança
- a história e a gameplay conversam
- o jogo é ampliável sem reescrever tudo

---

## Regra final

Se a equipe sentir vontade de pular a base e ir direto para boss, cutscene e lore gigante, o roadmap está salvando o projeto de si mesmo.
