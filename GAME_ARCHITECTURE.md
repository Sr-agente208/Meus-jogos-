# GAME_ARCHITECTURE.md

## Visão geral

Este documento define a arquitetura técnica base para o desenvolvimento do jogo dentro deste repositório. A prioridade é manter o projeto modular, fácil de manter e simples de expandir por capítulos, sistemas e futuras versões.

## Princípios de arquitetura

- **Modularidade**: cada sistema deve viver em seu próprio arquivo ou pasta.
- **Baixo acoplamento**: cenas, entidades, UI e lógica não devem depender demais umas das outras.
- **Escalabilidade**: a base precisa suportar novos capítulos, inimigos, eventos e assets sem reescrever tudo.
- **Legibilidade**: nomes claros, código limpo e documentação mínima obrigatória.
- **Controle de versão**: cada mudança relevante deve vir em commit pequeno e descritivo.

## Camadas do projeto

### 1. Camada de apresentação
Responsável por tudo que o jogador vê e ouve.

Inclui:
- interface do usuário
- menus
- HUD
- cutscenes
- animações
- transições
- efeitos visuais
- áudio e música

### 2. Camada de gameplay
Responsável pelas regras do jogo.

Inclui:
- movimentação do jogador
- interação com objetos
- combate ou fuga
- quebra-cabeças
- coleta de itens
- progressão de capítulos
- gatilhos de evento

### 3. Camada de mundo
Responsável pelo estado global do jogo.

Inclui:
- mapa
- áreas desbloqueadas
- portas e passagens
- flags de progresso
- estado de entidades
- checkpoints

### 4. Camada de persistência
Responsável por salvar e carregar o progresso.

Inclui:
- slots de save
- checkpoint automático
- estado de capítulos
- inventário
- flags narrativas
- opções do jogador

## Estrutura de pastas sugerida

```text
src/
├── core/
│   ├── game_loop
│   ├── state_manager
│   ├── scene_manager
│   └── event_bus
├── player/
│   ├── movement
│   ├── interaction
│   ├── inventory
│   └── status
├── enemies/
│   ├── ai
│   ├── behaviors
│   └── boss_states
├── ui/
│   ├── hud
│   ├── menus
│   ├── dialogs
│   └── overlays
├── world/
│   ├── maps
│   ├── triggers
│   ├── props
│   └── checkpoints
├── narrative/
│   ├── chapters
│   ├── cutscenes
│   ├── dialogue
│   └── events
├── systems/
│   ├── save_load
│   ├── audio
│   ├── quest
│   ├── combat
│   └── puzzle
├── assets/
└── config/
```

## Sistema de cenas

O jogo deve ser dividido em cenas ou estados claros.

### Estados principais
- boot
- menu principal
- carregando
- jogo
- pausa
- cutscene
- inventário
- configurações
- game over
- créditos

### Regras
- cada cena precisa saber quando entra e quando sai
- transições devem ser centralizadas
- cutscenes não devem ficar misturadas com lógica de gameplay
- o menu principal não deve carregar sistemas pesados sem necessidade

## Sistema do jogador

### Responsabilidades
- movimentação
- colisão
- interação
- uso de itens
- leitura de pistas
- mudanças de estado como medo, dano ou alerta

### Organização interna
- `movement`: anda, corre, agacha, vira
- `interaction`: usa portas, objetos e pontos de interesse
- `inventory`: itens coletáveis e consumíveis
- `status`: vida, sanidade, energia ou outros atributos

## Sistema de inimigos e IA

### Padrão geral
Cada inimigo deve ter:
- estado atual
- condição de ativação
- comportamento por distância
- rotina de patrulha ou perseguição
- reação ao som, visão ou eventos

### Estados comuns
- idle
- patrulha
- alerta
- perseguição
- ataque
- investigando
- retornando
- derrotado

### Regras importantes
- IA não deve conhecer interface do usuário
- comportamento deve ser separado de efeitos visuais
- bosses devem usar máquinas de estado próprias
- cada entidade importante precisa de documentação

## Sistema de capítulos

O jogo deve ser dividido por capítulos para facilitar narrativa, ritmo e produção.

### Cada capítulo deve conter
- introdução
- objetivo principal
- eventos-chave
- ameaça principal
- conflito narrativo
- conclusão ou gancho

### Estrutura recomendada
- capítulo 1: apresentação do mundo e do problema
- capítulo 2: expansão da ameaça
- capítulo 3: escalada de tensão
- capítulo 4: clímax ou ruptura
- capítulos futuros: expansão modular

## Sistema narrativo

### Componentes
- diálogo
- eventos disparados por condição
- cutscenes
- arquivos de lore
- mensagens ambientais
- pistas visuais

### Regras
- narrativa precisa ser rastreável por flags
- texto importante deve ficar documentado
- cutscene deve poder ser reaproveitada ou editada sem quebrar o jogo

## Sistema de save

### Deve salvar
- progresso de capítulo
- posição do jogador
- itens coletados
- estado de portas e eventos
- flags narrativas
- opções de áudio e acessibilidade

### Regras
- salvar em pontos definidos ou automaticamente em marcos
- validar dados ao carregar
- não permitir corrupção silenciosa de save

## Sistema de áudio

### Trilhas
- música ambiente
- música de perseguição
- efeitos de interface
- efeitos de passos
- efeitos de entidades
- stingers de susto e tensão

### Regras
- áudio deve reagir ao estado do jogo
- crossfade quando possível
- volumes separados por categoria

## Sistema de interface

### Elementos previstos
- vida
- sanidade
- itens rápidos
- objetivo atual
- mensagens na tela
- indicadores de interação
- menus de pausa e configurações

### Regras
- HUD deve ser discreto
- menus devem ser claros
- interface não deve poluir cena narrativa

## Sistema de eventos

Eventos devem ser a base da progressão.

### Tipos de evento
- ao entrar em área
- ao pegar item
- ao abrir porta
- ao terminar cutscene
- ao sobreviver a perseguição
- ao derrotar boss

### Regras
- evento precisa ter condição e consequência
- evitar evento duplicado sem controle
- registrar flags em um estado central

## Sistema de assets

### Organização recomendada
- imagens em pastas por capítulo ou categoria
- áudios separados por uso
- modelos ou sprites versionados
- nomes consistentes e sem espaços desnecessários

### Convenção de nomes
- `chapter_01_intro.png`
- `enemy_shadow_idle.png`
- `ui_pause_bg.png`
- `sfx_door_open.wav`

## Fluxo de desenvolvimento

1. Definir a mecânica.
2. Registrar a ideia em documentação.
3. Criar a estrutura de arquivos.
4. Implementar o sistema base.
5. Testar a integração.
6. Ajustar visual e áudio.
7. Fazer commit com mensagem clara.

## Padrão de commits recomendado

- `feat: adiciona sistema de interação`
- `feat: implementa IA do inimigo`
- `fix: corrige colisão da porta`
- `docs: atualiza arquitetura do jogo`
- `refactor: separa lógica de cena`
- `chore: organiza assets do capítulo`

## Regras para a IA de desenvolvimento

- Não misturar sistemas sem necessidade.
- Preferir funções pequenas e reutilizáveis.
- Nunca apagar comportamento já documentado sem avisar.
- Toda mecânica nova deve vir com descrição técnica.
- Se uma implementação crescer demais, dividir em módulos.
- Antes de alterar algo grande, entender o fluxo completo.

## Observação final

Esta arquitetura é a base. Ela pode e deve evoluir conforme o jogo crescer, mas sempre mantendo o foco em clareza, organização e manutenção simples.
